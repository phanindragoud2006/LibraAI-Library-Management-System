```java
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/books")
public class BookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String sql = "SELECT book_id, title, author, category, rack_no, shelf_no, quantity FROM books";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>LibraAI - Books</title>");
            out.println("<style>");
            out.println("body{font-family:Arial;background:#f5f5f5;padding:30px;}");
            out.println("h1{text-align:center;}");
            out.println("table{width:100%;border-collapse:collapse;background:white;}");
            out.println("th,td{padding:12px;border:1px solid #ddd;text-align:center;}");
            out.println("th{background:#333;color:white;}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<h1>LibraAI - Library Books</h1>");

            out.println("<table>");
            out.println("<tr>");
            out.println("<th>ID</th>");
            out.println("<th>Title</th>");
            out.println("<th>Author</th>");
            out.println("<th>Category</th>");
            out.println("<th>Rack</th>");
            out.println("<th>Shelf</th>");
            out.println("<th>Quantity</th>");
            out.println("</tr>");

            while (rs.next()) {

                out.println("<tr>");

                out.println("<td>" + rs.getInt("book_id") + "</td>");
                out.println("<td>" + rs.getString("title") + "</td>");
                out.println("<td>" + rs.getString("author") + "</td>");
                out.println("<td>" + rs.getString("category") + "</td>");
                out.println("<td>" + rs.getString("rack_no") + "</td>");
                out.println("<td>" + rs.getString("shelf_no") + "</td>");
                out.println("<td>" + rs.getInt("quantity") + "</td>");

                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {

            out.println("<h2>Error: " + e.getMessage() + "</h2>");

            e.printStackTrace();
        }
    }
}
```


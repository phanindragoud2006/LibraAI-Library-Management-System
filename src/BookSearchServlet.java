
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookSearchServlet extends HttpServlet {

    private final String URL =
            "jdbc:mysql://localhost:3306/library_db";

    private final String USERNAME = "root";

    private final String PASSWORD =
            "password";

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String bookName = request.getParameter("title");

        PrintWriter out = response.getWriter();

        if (bookName == null || bookName.trim().isEmpty()) {
            out.println("<h2>Please enter a book title.</h2>");
            return;
        }

        String sql =
            "SELECT * FROM books WHERE title LIKE ?";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con =
                DriverManager.getConnection(
                    URL, USERNAME, PASSWORD
                );

            PreparedStatement pstmt =
                con.prepareStatement(sql);

            pstmt.setString(
                1,
                "%" + bookName + "%"
            );

            ResultSet rs =
                pstmt.executeQuery();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Book Search</title>");
            out.println("</head>");
            out.println("<body>");

            out.println("<h1>📚 AI Library Assistant</h1>");

            if (rs.next()) {

                out.println("<h2>Book Found! 🎉</h2>");

                out.println("<p><b>Title:</b> "
                        + rs.getString("title")
                        + "</p>");

                out.println("<p><b>Author:</b> "
                        + rs.getString("author")
                        + "</p>");

                out.println("<p><b>Category:</b> "
                        + rs.getString("category")
                        + "</p>");

                out.println("<p><b>📍 Rack:</b> "
                        + rs.getString("rack_no")
                        + "</p>");

                out.println("<p><b>📖 Shelf:</b> "
                        + rs.getString("shelf_no")
                        + "</p>");

                out.println("<p><b>Available:</b> "
                        + rs.getInt("quantity")
                        + "</p>");

            } else {

                out.println(
                    "<h2>❌ Book not found!</h2>"
                );
            }

            out.println("</body>");
            out.println("</html>");

            rs.close();
            pstmt.close();
            con.close();

        } catch (Exception e) {

            out.println("<h2>Database Error</h2>");
            e.printStackTrace(out);
        }
    }
}

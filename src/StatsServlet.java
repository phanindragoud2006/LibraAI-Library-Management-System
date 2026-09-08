import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StatsServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library_db",
                "root",
                "Sunny@123"
            );

            String sql = "SELECT COUNT(*) AS total_books, " +
                         "COALESCE(SUM(quantity), 0) AS available_copies, " +
                         "COUNT(DISTINCT rack_no) AS total_racks " +
                         "FROM books";

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                out.print("{");
                out.print("\"totalBooks\":" +
                        rs.getInt("total_books") + ",");
                out.print("\"availableCopies\":" +
                        rs.getInt("available_copies") + ",");
                out.print("\"totalRacks\":" +
                        rs.getInt("total_racks"));
                out.print("}");
            }

            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {

            out.print("{\"error\":\"");

            String message = e.toString()
                    .replace("\"", "'")
                    .replace("\n", " ");

            out.print(message);

            out.print("\"}");
        }
    }
}

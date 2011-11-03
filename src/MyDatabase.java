

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Database
 */
@WebServlet("/Database")
public class MyDatabase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyDatabase() {
        super();
        
        Connection conn = null;
        try {
            conn =
               DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&" +
                                           "user=root&password=pothead");
            
         // Query the student PIDs
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery("SELECT pid FROM students");
            // Print out the PID (1st attribute)
           
            while (rset.next())
            	System.out.println(rset.getInt(1));

          //close the result set, statement, and connection
            rset.close();
            stmt.close();
            conn.close();
     	
            // Do something with the Connection
        } catch (SQLException ex) {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }

    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("Hello World");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	

}

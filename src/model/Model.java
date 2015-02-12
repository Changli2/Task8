package model;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;

public class Model {
	private UserDAO userDAO;
	private CommentDAO commentDAO;	
	


	public Model(ServletConfig config) throws ServletException {		
		// initialise tables in my-sql database
		try {			
			String jdbcDrive 	= config.getInitParameter("jdbcDriver");
			String jdbcURL      = config.getInitParameter("jdbcURL");
			ConnectionPool cp 	= new ConnectionPool(jdbcDrive, jdbcURL);
			
			String userTbl = "team8_user";
			String commentTbl = "team8_comment";
			
			userDAO = new UserDAO(cp, userTbl);
			commentDAO = new CommentDAO(cp, commentTbl);			

			
		} catch (DAOException e) {
			throw new ServletException(e);
		} 
	}
	
	public UserDAO getEmployeeDAO()  { return userDAO; }
	public CommentDAO getCustomerDAO()  { return commentDAO; }
}
/**
 * Utility class which contains methods to get database connection and close database connection
 */
package com.clikfix.db;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

import com.clikfix.constants.IExceptionConstants;
import com.clikfix.exceptions.GlobalException;

/**
 * @author Chaitanya Devavarapu
 *
 */
public class BaseDAO implements IExceptionConstants{
	
	/**
	 * Method used to get connection object from connection pool
	 * @param dataSourceName
	 * @return
	 */
	public static Connection getConnectionObjFromConnectionPool(String dataSourceName) throws GlobalException {
		Connection con = null;
		try {
			/* Obtain our environment naming context */
			javax.naming.Context ic = (javax.naming.Context) new javax.naming.InitialContext().lookup("java:comp/env");			
			 
			/* Look up our data source */
			javax.sql.DataSource  ds = (javax.sql.DataSource) ic.lookup(dataSourceName);
			synchronized (ds)
			{
				con = ds.getConnection();
			}			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return con;
	}
	
	/**
	 * Method returns the Database Connection object get retrieving the connection from datasource
	 * @return java.sql.Connection 
	 */
	public static Connection getDBConnection() throws GlobalException {	
		Connection con = null;
		con = BaseDAO.getConnectionObjFromConnectionPool(DATASOURCE_NAME);
		return con;
	}
	
	
	/**
	 * This method closes the java.sql.ResultSet object
	 * @param rs
	 */
	public static void close(ResultSet rs) throws GlobalException {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				//throw new GlobalException(e.getMessage());
			}
		}	
	}
	
	/**
	 * This method closes the java.sql.Statement object
	 * @param stmt
	 * @throws GlobalException 
	 */
	public static void close(Statement stmt) throws GlobalException {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				//throw new GlobalException(e.getMessage());
			}
		} 
	}
	
	/**
	 * This method closes the PreparedStatement object
	 * @param pstmt
	 */
	public static void close(PreparedStatement pstmt) throws GlobalException {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				//throw new GlobalException(e.getMessage());
			}
		} 
	}
	
	/**
	 * This method closes the java.sql.Connection object
	 * @param con
	 */
	public static void close(Connection con) throws GlobalException {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				//System.out.println("Connection is already closed.");
				throw new GlobalException(e.getMessage());
			}
		} 
	}
	
	/**
	 * This method closes the ResultSet, Statement, Connection objects
	 * @param rs
	 * @param stmt
	 * @param con
	 * @throws GlobalException 
	 */
	public static void close(ResultSet rs, Statement stmt, Connection con) throws GlobalException {
		BaseDAO.close(rs);
		BaseDAO.close(stmt);
		BaseDAO.close(con);
	}
	
	/**
	 * This method closes the ResultSet, PreparedStatement and Connection objects
	 * @param rs - java.sql.ResultSet
	 * @param pstmt
	 * @param con
	 * @throws GlobalException 
	 */
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) throws GlobalException {
		BaseDAO.close(rs);
		BaseDAO.close(pstmt);
		BaseDAO.close(con);
	}	
	
	public static void close(ResultSet rs, PreparedStatement pstmt) throws GlobalException {
		BaseDAO.close(rs);
		BaseDAO.close(pstmt);
	}	
	
	public static void close(ResultSet rs, Statement stmt) throws GlobalException {
		BaseDAO.close(rs);
		BaseDAO.close(stmt);
	}	
 
}

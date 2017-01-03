package com.clik2fix.cust;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.clikfix.constants.IAppConstants;
import com.clikfix.constants.IExceptionConstants;
import com.clikfix.db.BaseDAO;
import com.clikfix.exceptions.GlobalException;

public class CustDao extends BaseDAO implements ICustDao, IExceptionConstants, IAppConstants {

	@Override
	public boolean saveCust(String name, String email, String mobile) throws GlobalException {		
		Connection con = null;
		Statement stmt = null;
				
		int effRows = 0;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "insert into tbl_cust (name,email,mobile) values('"+name+"','"+email+"','"+mobile+"')";
			effRows = stmt.executeUpdate(sql);
		} catch (Exception e) {			
			throw new GlobalException(e.getMessage());
		} finally {
			BaseDAO.close(stmt);
			BaseDAO.close(con);
		}
		
		if(effRows > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int checkCust(String email) throws GlobalException {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		int custId = 0;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "select cust_id from tbl_cust where email = '"+email+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				custId = rs.getInt("cust_id");
			}
		} catch (Exception e) {			
			throw new GlobalException(e.getMessage());
		} finally {
			BaseDAO.close(rs);
			BaseDAO.close(stmt);
			BaseDAO.close(con);
		}
		return custId;
	}

}

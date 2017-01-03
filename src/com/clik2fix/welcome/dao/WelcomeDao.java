package com.clik2fix.welcome.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;
import java.util.TreeMap;

import com.clikfix.db.BaseDAO;
import com.clikfix.exceptions.GlobalException;

public class WelcomeDao extends BaseDAO {
	
	public Map<Integer,String> getWorkTypeMap() throws GlobalException {
		Map<Integer, String> map = new TreeMap<Integer, String>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select work_type_id, work_type_name from tbl_work_type");
			while(rs.next()) {
				map.put(rs.getInt("work_type_id"), rs.getString("work_type_name"));
			}	
		} catch(Exception e) {
			throw new GlobalException(e.getMessage());
		} finally {
			BaseDAO.close(rs, stmt, con);
		}
		return map;
	}
	
	public Map<Integer,String> getAreaMap() throws GlobalException {
		Map<Integer, String> map = new TreeMap<Integer, String>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select area_id, area_name from tbl_area");
			while(rs.next()) {
				map.put(rs.getInt("area_id"), rs.getString("area_name"));
			}	
		} catch(Exception e) {
			throw new GlobalException(e.getMessage());
		} finally {
			BaseDAO.close(rs, stmt, con);
		}
		return map;
	}	
}

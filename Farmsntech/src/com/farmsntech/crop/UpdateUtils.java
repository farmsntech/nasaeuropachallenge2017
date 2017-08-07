package com.farmsntech.crop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmsntech.Farmer;
import com.farmsntech.db.DbUtils;

public class UpdateUtils {

	public static void update(Float min,Float max,Float rain) throws IOException
	{   Connection con = null;
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	ResultSet r = null;
	String sql="delete from current";
	String sql2 = "insert into current(min,max,rain) values ("+min+","+max+","+rain+")";
	
		
		con = DbUtils.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.execute(sql);
			
			ps = con.prepareStatement(sql2);
			
			ps.execute(sql2);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("home"+e);
		}
	}
	
	
	
	public static List selectcurrent() throws ClassNotFoundException,
			IOException, SQLException {
				
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;
		String sql2 = "select * from current";
		List<Current> list = new ArrayList<Current>();
		
     	con = DbUtils.getConnection();
 	ps = con.prepareStatement(sql2);
	
	r = ps.executeQuery();
	while (r.next()) {
		float min = r.getFloat("min");
		float max = r.getFloat("max");
		float rain = r.getFloat("rain");
		Current curr = new Current(min, max, rain);
		list.add(curr);

	}
	return list;
}
	}

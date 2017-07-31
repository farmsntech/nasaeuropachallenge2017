package com.farmsntech;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.farmsntech.db.DbUtils;
import com.farmsntech.Farmer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class FarmerUtils {

	public static void insertfarmer(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException

	{ 	HttpSession session = request.getSession(true); 
long mobileno = (Long)session.getAttribute("mobile");
String password = session.getAttribute("password").toString();

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
String sql = "insert into farmer(password,mobile) values (?,?)";

	try {
		

		con =DbUtils.getConnection();
		ps = con.prepareStatement(sql);
		
		ps.setString(1, password);
		ps.setLong(2, mobileno);
		
		ps.execute();
		
		response.sendRedirect("mainpage.jsp");
		} catch (SQLException sqe) {
		System.out.println(sqe);
		
	}
}
	
	public static List selectfarmer(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
				
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;
		String sql2 = "select * from farmer where mobile_no=? and password=?";
		List<Farmer> list = new ArrayList<Farmer>();
		
        long n = Long.parseLong(request.getParameter("mobile"));
         String pass=request.getParameter("password");
   try{

	con = DbUtils.getConnection();
	ps = con.prepareStatement(sql2);
	ps.setLong(1, n);
	ps.setString(2, pass);
	r = ps.executeQuery();
	while (r.next()) {
		long mobile = r.getInt("mobile_no");
		int fid = r.getInt("fid");
		String password = r.getString("password");
		Farmer farmer = new Farmer(fid,mobile,password);
		list.add(farmer);

	}
	
} catch (Exception e) {
	e.printStackTrace();
}
return list;
}
	


	
}

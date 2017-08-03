package com.farmsntech.crop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.farmsntech.db.DbUtils;

public class CropUtils {

	public static List selectCrop(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException,
			IOException {
				
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet r = null;
		String sql2 = "select * from crop";
		List<Crop> list = new ArrayList<Crop>();
		
       
   try{

	con = DbUtils.getConnection();
	ps = con.prepareStatement(sql2);
	r = ps.executeQuery();
	while (r.next()) {
		int cid = r.getInt("crop_id");
		String cname = r.getString("crop_name");
		Crop crop = new Crop(cid,cname);
		list.add(crop);

	}
	
} catch (Exception e) {
	e.printStackTrace();
}
return list;
}
}

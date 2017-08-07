package com.farmsntech.crop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.farmsntech.weather;
import com.farmsntech.db.DbUtils;

public class ClimateUtils {
 
	public static void insertcli(float[] cond,String[] summary,int i) throws IOException
	{
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into globew(min,max,rain,pressure,windspeed,humidity,summary) values (?,?,?,?,?,?,?)";

			try {
				
				con =DbUtils.getConnection();
				ps = con.prepareStatement(sql);
				ps.setFloat(1,cond[0]);
				ps.setFloat(2,cond[1]);
				ps.setFloat(3,cond[2]);
				ps.setFloat(4,cond[3]);
				ps.setFloat(5,cond[4]);
				ps.setFloat(6,cond[5]);
				ps.setString(7, summary[0]);
				ps.execute();
				
				con =DbUtils.getConnection();
				ps = con.prepareStatement(sql);
				ps.setFloat(1,cond[6]);
				ps.setFloat(2,cond[7]);
				ps.setFloat(3,cond[8]);
				ps.setFloat(4,cond[9]);
				ps.setFloat(5,cond[10]);
				ps.setFloat(6,cond[11]);
				ps.setString(7, summary[1]);
				
				
				ps.execute();
				ps = con.prepareStatement(sql);
				ps.setFloat(1,cond[12]);
				ps.setFloat(2,cond[13]);
				
				ps.setFloat(3,cond[14]);
				ps.setFloat(4,cond[15]);
				ps.setFloat(5,cond[16]);
				ps.setFloat(6,cond[17]);
				
				ps.setString(7, summary[2]);
				
				
				ps.execute();
				ps = con.prepareStatement(sql);
				ps.setFloat(1,cond[18]);
				ps.setFloat(2,cond[19]);
				
				ps.setFloat(3,cond[20]);
				ps.setFloat(4,cond[21]);
				ps.setFloat(5,cond[22]);
				ps.setFloat(6,cond[23]);
				
				ps.setString(7, summary[3]);
				
				
				ps.execute();
				ps = con.prepareStatement(sql);
				ps.setFloat(1,cond[24]);
				ps.setFloat(2,cond[25]);
				
				ps.setFloat(3,cond[26]);
				ps.setFloat(4,cond[27]);
				ps.setFloat(5,cond[28]);
				ps.setFloat(6,cond[29]);
				
				ps.setString(7, summary[4]);
				
				
				ps.execute();
				ps = con.prepareStatement(sql);
				ps.setFloat(1,cond[30]);
				ps.setFloat(2,cond[31]);
				
				ps.setFloat(3,cond[32]);
				ps.setFloat(4,cond[33]);
				ps.setFloat(5,cond[35]);
				ps.setFloat(6,cond[36]);
				
				ps.setString(7, summary[5]);
				
				
				ps.execute();
				ps = con.prepareStatement(sql);
				ps.setFloat(1,cond[37]);
				ps.setFloat(2,cond[38]);
				
				ps.setFloat(3,cond[39]);
				ps.setFloat(4,cond[40]);
				ps.setFloat(5,cond[41]);
				ps.setFloat(6,cond[42]);
				
				ps.setString(7, summary[6]);
				
				
				ps.execute();
				
				} catch (SQLException sqe) {
				System.out.println(sqe);
					
		
	}
	
}
	
	 public static List selectcli() throws ClassNotFoundException,
		IOException {
			
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet r = null;
	String sql2 = "select * from globew ";
	List<Climate> list = new ArrayList<Climate>();
	

try{

con = DbUtils.getConnection();
ps = con.prepareStatement(sql2);

r = ps.executeQuery();
while (r.next()) {
float min= r.getFloat("min");
	float max  = r.getFloat("max");
	float rain= r.getFloat("rain");
	float pressure=r.getFloat("pressure");
	float wind=r.getFloat("windspeed");

	float humid=r.getFloat("humidity");
	String summary=r.getString("summary");
	Climate cli=new Climate(min, max, rain, pressure, wind, humid, summary);
	list.add(cli);
	

}

} catch (Exception e) {
e.printStackTrace();
}
return list;
}

















}





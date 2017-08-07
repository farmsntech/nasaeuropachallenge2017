package com.farmsntech;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.TimerTask;
import java.util.Date;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import com.farmsntech.crop.Current;
import com.farmsntech.crop.UpdateUtils;
public class ScheduledTask extends TimerTask  {

	Date now; // to display current time

	// Add your task here
	public void run() {
		List<Current> list1=null;
		
		try {
			list1 = UpdateUtils.selectcurrent();
		} catch (ClassNotFoundException | IOException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			float min=0;
			float max=0;
			float rain=0;
		
	for (Current curr: list1){
		 min=curr.getMin();
		 max=curr.getMax();
		 rain=curr.getRain();
		
	}
		RConnection connection = null;
		
		try {
            /* Create a connection to Rserve instance running on default port
             * 6311
             */
            connection = new RConnection();

            /* Note four slashes (\\\\) in the path */
            connection.eval("source('/home/orienit/r/algocurr.R')");
            int num1=10;
            int num2=20;
            int sum=connection.eval("myPredict("+min+","+max+","+","+rain+")").asInteger();
            System.out.println("The sum is=" + sum);
        } catch (RserveException e) {
            e.printStackTrace();
        } catch (REXPMismatchException e) {
            e.printStackTrace();
        }
		now = new Date(); // initialize date
		System.out.println("Time is :" + now); // Display current time
	}
}
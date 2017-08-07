package com.farmsntech;


	import org.rosuda.REngine.REXPMismatchException;
	import org.rosuda.REngine.Rserve.RConnection;
	import org.rosuda.REngine.Rserve.RserveException;

	public class Temp {

	    public static void add() {
	        RConnection connection = null;

	        try {
	            /* Create a connection to Rserve instance running on default port
	             * 6311
	             */
	            connection = new RConnection();

	            /* Note four slashes (\\\\) in the path */
	            connection.eval("source('/home/---/algo1.R')");//use local system path of this file.
	            int sum=connection.eval("myAdd()").asInteger();
	            System.out.println("The sum is=" + sum);
	            
	            connection.eval("source('/home/---/algo2.R')");//use local system path of this file. 
	            int sum1=connection.eval("myAdd()").asInteger();
	            System.out.println("The sum is=" + sum1);
	            
	            connection.eval("source('/home/---/algo3.R')");//use local system path of this file. 
	            int sum2=connection.eval("myAdd()").asInteger();
	            System.out.println("The sum is=" + sum2);
	            
	            connection.eval("source('/home/---/algo4.R')");//use local system path of this file. 
	            int sum3=connection.eval("myAdd()").asInteger();
	            System.out.println("The sum is=" + sum2);
	            
	            connection.eval("source('/home/---/algo5.R')");//use local system path of this file. 
	            int sum4=connection.eval("myAdd()").asInteger();
	            System.out.println("The sum is=" + sum2);
	            
	            connection.eval("source('/home/---/algofinal.R')");//use local system path of this file. 
	            int sum5=connection.eval("myAdd()").asInteger();
	            System.out.println("The sum is=" + sum2);
	            
	            
	        } catch (RserveException e) {
	            e.printStackTrace();
	        } catch (REXPMismatchException e) {
	            e.printStackTrace();
	        }
	    }
	}

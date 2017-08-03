package com.farmsntech.crop;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Prediction {

	    public static float[] read() {

	        String csvFile = "/home/orienit/MyData3.csv";
	        String line = "";
	        String cvsSplitBy = ",";
	        int count=0;
	        float[] fore=new float[39];
	        int i=0;
	        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
	            while ((line = br.readLine()) != null) {
	            	count++;
	                // use comma as separator
	            	if(count>=8)
	                {
	            		String[] forecast= line.split(cvsSplitBy);
	            		 System.out.println(forecast[1]);
	            			fore[i]=Float.parseFloat(forecast[1]);
	            			i++;
	            			 System.out.println(forecast[2]);
	            			fore[i]=Float.parseFloat(forecast[2]);
	            			i++;
	            			fore[i]=Float.parseFloat(forecast[3]);
	            			i++;
	            			
	            		}
	            } }

	         catch (IOException e) {
	            e.printStackTrace();
	        }
			return fore;
	    }
	
	
	public static String predict(String a,int c,int crop,int sid)
	{   
		
		float[] wcast=read();
		System.out.println(wcast[0]);
		String[] weather = a.split(",");
		int i;
		
		float[] w=new float[40];
		
		if(sid==1){
			
			int alert=0;
		for(i=0;i<21;i++)
		{
		 
		w[i] = Float.parseFloat(weather[i]);
		}
		
		for(i=0;i<8;i++)
		{
			w[i+21] = wcast[0];
		}
		
		
		
		for(i=0;i<30;i++)
		{
			if(i%3==2)
			{
				if(w[i]>=40){    //heavy rain comment
					alert=1;
				}
				else
					alert=0;
			}
			if(i%3==1)
			{
				if(w[i]>=40){
					alert=1;
				}
				else
					alert=0;
			}
			if(i%3==0)
			{
				if(w[i]<=10){
					alert=1;
				}
				else
					alert=0;
			}
		}
		int count1=0;
		int count2=0;
		int count3=0;
		if(alert==1)
		{
			String msg="There will be heavy rain in coming days.Kindly check after 7 days. ";  
				return msg;																						//alert for heavy rain
		}
		else{
			
		
			for(i=2;i<30;i=i+3)
			{
			   if(w[i]>=0 && w[i]<=5)
			   {
				   count1++;
			   }
			   else if(w[i]>5 && w[i]<=10)
			   {
				   count2++;
			   }
			   else if(w[i]>10)
			   {
				   count3++;
			   }
			}
			
	int fav=0;		
	if(count2>=6 || (count2>=4 && count1>=3) || (count1>=3 && count2>=3 && count3>=3) || (count2>=4 && count3<=3))
	{
		fav=1;  
																						//ideal
		String msg="Conditions are favourable.You can grow seed within 5 days.";
		return msg;
	}
	
	else
	{
		if(c==1 && fav==0)
		{
			String msg="There will not be so much rain.Use canal water to maintain 4-5 cm of rainfall";  
			return msg;//use canal water
		}
		else if(c==0 && fav==0)
		{
			String msg="There will not be sufficient rain.Kindly wait for 6-7 days.";	
			return msg;//wait for nxt msg	//scheduler
		}
	}}
		}
		
		
		else if(sid==2)  			
		{ int alert=0;
								//calamity
			for(i=0;i<21;i++)
			{
				if(i%3==2)
				{	
					if(w[i]>=40)
					{
						alert=1;
						String msg ="There will be heavy rain in coming days.Build a passage to drain extra water.Minatain water level of 2-3 cm";
						return msg;
					}
				}
			}
			
			
			
			
		}
		else if(sid==3)						//vegetative phase
		{    int alert=0;
			//String msg="";					//2-3 cm of water level
			for(i=0;i<21;i++)
			{
				if(i%3==2)
				{	
					if(w[i]>=40)
					{
						alert=1;
					}
				}
			}
			if(alert==1){
			String msg="There will be heavy rain in coming days.Build a passage to drain extra water.Minatain water level of 2-3 cm"; 	
			return msg;//passage bnao
			}
			
			
		}
		return null;
		
	}
}

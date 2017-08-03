package com.farmsntech.crop;

import java.io.BufferedReader;
	import java.io.FileReader;
	import java.io.IOException;

	public class reading {

	    public static void read() {

	        String csvFile = "/home/orienit/MyData3.csv";
	        String line = "";
	        String cvsSplitBy = ",";
	        int count=0;
	        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {

	            while ((line = br.readLine()) != null) {
	            	count++;
	                // use comma as separator
	                String[] country = line.split(cvsSplitBy);
	                if(count!=1)
	                {
	                System.out.println("Country [code= " + country[1] + " , name=" + country[2] + "]");
	                }
	            }

	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	    }
	}

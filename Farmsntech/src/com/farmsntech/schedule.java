package com.farmsntech;
import java.util.Timer;
public class schedule {

	

	/**
	 *
	 * @author Dhinakaran P.
	 */

	//Main class

		public static void main(String args[]) throws InterruptedException {

			Timer time = new Timer(); // Instantiate Timer Object
			ScheduledTask st = new ScheduledTask(); // Instantiate SheduledTask class
			time.schedule(st, 0, 5000); // Create Repetitively task for every 1 secs

			//for demo only.
			
			
		}
	}


package util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetDate {
	public String getTodayDate()
	{
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		String todayDate = dateFormat.format(date);
		//System.out.println(todayDate);
		return todayDate;
	}
	

}

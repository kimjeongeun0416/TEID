package com.bookmark;

import java.util.ArrayList;
import java.util.List;

public class Bookmark 
{
	/*	
	dt_id			CHAR(20) NOT NULL,				
    dt_breakfast	CHAR(7) NULL,					
    dt_lunch		CHAR(7) NULL,					
    dt_dinner		CHAR(7) NULL,					
    dt_snack		CHAR(7) NULL,										
*/
	private String id;
	private List<String> breakfast = new ArrayList<String>();
	private List<String> lunch = new ArrayList<String>();
	private List<String> dinner = new ArrayList<String>();
	private List<String> snack = new ArrayList<String>();
	
	public String getId()
	{
		return id;
	}
	
	public void setId(String id)
	{
		this.id = id;
	}
	
	public List<String> getBreakfast()
	{
		return breakfast;
	}
	
	public void setBreakfast(String breakfast)
	{
		(this.breakfast).add(breakfast);
	}
	
	public List<String> getLunch()
	{
		return lunch;
	}
	
	public void setLunch(String lunch)
	{
		(this.lunch).add(lunch);
	}
	
	public List<String> getDinner()
	{
		return dinner;
	}
	
	public void setDinner(String dinner)
	{
		(this.dinner).add(dinner);
	}
	
	public List<String> getSnack()
	{
		return snack;
	}
	
	public void setSnack(String snack)
	{
		(this.snack).add(snack);
	}

}

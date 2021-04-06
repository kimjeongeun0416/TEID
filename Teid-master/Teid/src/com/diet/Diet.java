package com.diet;

public class Diet 
{
	/*	dt_id			CHAR(20) NOT NULL PRIMARY KEY,	
    dt_date			DATE NOT NULL,					
    dt_breakfast	CHAR(7) NULL,					
    dt_lunch		CHAR(7) NULL,					
    dt_dinner		CHAR(7) NULL,					
    dt_snack		CHAR(7) NULL,					
    dt_memo			VARCHAR(255) NULL,				
*/
	private String id;
	private String date; 
	private String breakfast;
	private String lunch;
	private String dinner;
	private String snack;
	private String memo;
	private int score;
	
	public String getId()
	{
		return id;
	}
	
	public void setId(String id)
	{
		this.id = id;
	}
	
	public String getDate()
	{
		return date;
	}
	
	public void setDate(String date)
	{
		this.date = date;
	}
	
	public String getBreakfast()
	{
		return breakfast;
	}
	
	public void setBreakfast(String breakfast)
	{
		this.breakfast = breakfast;
	}
	
	public String getLunch()
	{
		return lunch;
	}
	
	public void setLunch(String lunch)
	{
		this.lunch = lunch;
	}
	
	public String getDinner()
	{
		return dinner;
	}
	
	public void setDinner(String dinner)
	{
		this.dinner = dinner;
	}
	
	public String getSnack()
	{
		return snack;
	}
	
	public void setSnack(String snack)
	{
		this.snack = snack;
	}
	
	public String getMemo()
	{
		return memo;
	}
	
	public void setMemo(String memo)
	{
		this.memo = memo;
	}
	
	public int getScore()
	{
		return score;
	}
	
	public void setScore(int score)
	{
		this.score = score;
	}
}

package com.charvikent.dbconnection;

import java.sql.*;

public class DbUtility 
{
    private DbUtility()
    {

    }
    static
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(Exception e)
        {
            System.err.println(e);
        }
    }
	private static Connection con=null;
	public static synchronized Connection getConnection(String url,String username,String password)
	{
		if(con==null)
		{
			try
			{
				con=DriverManager.getConnection(url,username,password); 
			}
			catch(Exception e)
			{
				System.err.println(e);
			}
		}
		return con;
	}
}
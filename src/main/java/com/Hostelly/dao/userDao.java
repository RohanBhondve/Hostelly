package com.Hostelly.dao;

import java.util.ArrayList;

public interface userDao {
	public boolean isValidUser(String username, String password);
	
	public ArrayList<String> getDetails(String username);
}

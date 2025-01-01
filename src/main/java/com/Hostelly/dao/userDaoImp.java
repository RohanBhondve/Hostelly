package com.Hostelly.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Hostelly.Util.DBUtil;

public class userDaoImp implements userDao {

	
	public boolean isValidUser(String username, String password) {
		String query = "SELECT * FROM hostelly WHERE id = ? AND password = ?";
		try (Connection connection = DBUtil.getConnection();
			 PreparedStatement pStmt = connection.prepareStatement(query);){
			
			pStmt.setString(1, username);
			pStmt.setString(2, password);
			ResultSet rs = pStmt.executeQuery();
			return rs.next();
		}
		catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public ArrayList<String> getDetails(String username) {
		String query = "SELECT * FROM details WHERE id = ?";
		try(Connection connection = DBUtil.getConnection();
			PreparedStatement pStmt = connection.prepareStatement(query);){
			pStmt.setString(1, username);
//			System.out.println("exception in getDetails1");
			ArrayList<String> l = new ArrayList<>();
			ResultSet rs = pStmt.executeQuery();
			if (rs.next()) {  // Move to the first row
	            l.add(rs.getString(1));
	            l.add(rs.getString(2));
	            l.add(rs.getString(3));
	            l.add(rs.getString(4));
	        }
			
			return l;
			 
		}
		catch(SQLException e) {
			e.printStackTrace();
			
			return null;
			
		}
	}
	
	//for login page
	public void setDateTime(String id,String status,String data,String location) {
		String query = "INSERT INTO checkInOut VALUES(?,?,?,?)";
		try(Connection connection = DBUtil.getConnection();
			PreparedStatement pStmt = connection.prepareStatement(query);) {
			pStmt.setString(1,id);
			pStmt.setString(2,status);
			pStmt.setString(3,data);
			pStmt.setString(4,location);
			pStmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//for laundry page
	public void laundryDetails(String roomNo, String name, int clothes, String date,String time) {
		String query = "INSERT INTO laundry VALUES(?,?,?,?,?)";
		try(Connection connection = DBUtil.getConnection();
			PreparedStatement pStmt = connection.prepareStatement(query);){
			pStmt.setString(1, roomNo);
			pStmt.setString(2,name);
			pStmt.setInt(3, clothes);
			pStmt.setString(4,date);
			pStmt.setString(5,time);
			pStmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//for housekeeping page
	public void housekeepingDetails(String roomNo, String name, String date, String time, String clean) {
		String query = "INSERT INTO housekeeping VALUES(?,?,?,?,?)";
		try(Connection connection = DBUtil.getConnection();
				PreparedStatement pStmt = connection.prepareStatement(query);){
				pStmt.setString(1, roomNo);
				pStmt.setString(2,name);
				pStmt.setString(3,date);
				pStmt.setString(4,time);
				pStmt.setString(5,clean);
				pStmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
	}

}

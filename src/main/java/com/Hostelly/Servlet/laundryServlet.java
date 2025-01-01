package com.Hostelly.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Hostelly.dao.userDaoImp;

/**
 * Servlet implementation class laundryServlet
 */
public class laundryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public laundryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roomNo = request.getParameter("roomNo");
		String name = request.getParameter("name");
		String clothesString = request.getParameter("clothes");
		int clothes = Integer.parseInt(clothesString);
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		
		try {
			userDaoImp ud3 = new userDaoImp();
			ud3.laundryDetails(roomNo, name, clothes, date, time);
			response.sendRedirect("payment.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}

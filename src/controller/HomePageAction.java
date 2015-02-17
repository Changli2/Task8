package controller;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import databean.Location;
import model.LocationDAO;
import model.Model;

public class HomePageAction extends Action{
	private LocationDAO locationDAO;

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return "homePage.do";
	}
	
	public HomePageAction(Model model) {
		// TODO Auto-generated constructor stub
		locationDAO= model.getLocationDAO();
	}

	@Override
	public String perform(HttpServletRequest request) {
		
		
		Location[] locs;
		try {
			locs = locationDAO.getTopTen();
			request.setAttribute("topten", locs);
		} catch (RollbackException e) {
			e.printStackTrace();
		}
	
		return "Homepage.jsp";
	}

}

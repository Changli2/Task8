package controller;

import javax.servlet.http.HttpServletRequest;

import model.LocationDAO;
import model.Model;

import org.genericdao.RollbackException;

import databean.Location;

public class GoogleChartAction extends Action{
	private LocationDAO locationDAO;
		
		public String getName() {
			// TODO Auto-generated method stub
			return "googleChart.do";
		}
		
		public GoogleChartAction(Model model) {
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
			
			return "Analytics.jsp";
		}

}

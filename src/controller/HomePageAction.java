package controller;

import javax.servlet.http.HttpServletRequest;

public class HomePageAction extends Action{

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return "homePage.do";
	}

	@Override
	public String perform(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return "home.jsp";
	}

}

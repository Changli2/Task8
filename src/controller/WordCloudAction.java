package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import twitterAPI.*;

public class WordCloudAction extends Action{ 
		
		public String getName() {
			// TODO Auto-generated method stub
			return "googleCloud.do";
		}

		@Override
		public String perform(HttpServletRequest request) {
		
			String lat= request.getParameter("lat");
			String lang= request.getParameter("lng");
			
			YahooWoeid yahooid= new YahooWoeid();
			String woeid= yahooid.getWoeid(lat, lang);
			
			ArrayList<String> trends =  GetHotTrends.getPopTrends(woeid);
		
			request.setAttribute("num", trends.size());
			
			request.setAttribute("twitTrends", trends);
			
			return "GoogleCloud.jsp";
		}
}
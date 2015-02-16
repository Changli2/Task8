package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import twitterAPI.*;

public class WordCloudAction extends Action{ 
		
		public String getName() {
			return "googleCloud.do";
		}

		public String perform(HttpServletRequest request) {
		
			String lat= request.getParameter("lat");
			String lang= request.getParameter("lng");
			
			YahooWoeid yahooid= new YahooWoeid();
			String woeid= yahooid.getWoeid(lat, lang);
			System.out.println("woeid"+ woeid);
			ArrayList<String> trends =  GetHotTrends.getPopTrends(woeid);
			
			if (trends.size()>1){
				request.setAttribute("num", trends.size());				
				request.setAttribute("twitTrends", trends);
			} else {
				request.setAttribute("num", 0);				
				request.setAttribute("twitTrends", "We are sorry, please try again");
			}
			
			return "GoogleCloud.jsp";
		}
}
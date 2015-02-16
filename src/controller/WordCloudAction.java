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
			
			ArrayList<String> trends =  GetHotTrends.getPopTrends("2473224");
			
			request.setAttribute("num", trends.size());
			
			request.setAttribute("twitTrends", trends);
			
			return "GoogleCloud.jsp";
		}
}
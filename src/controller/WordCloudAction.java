package controller;

import javax.servlet.http.HttpServletRequest;

public class WordCloudAction extends Action{ 
		
		public String getName() {
			// TODO Auto-generated method stub
			return "googleCloud.do";
		}

		@Override
		public String perform(HttpServletRequest request) {
			return "GoogleCloud.jsp";
		}

}
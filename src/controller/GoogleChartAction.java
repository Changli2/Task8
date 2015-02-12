package controller;

import javax.servlet.http.HttpServletRequest;

public class GoogleChartAction extends Action{ 
		
		public String getName() {
			// TODO Auto-generated method stub
			return "googleChart.do";
		}

		@Override
		public String perform(HttpServletRequest request) {
			return "GoogleChart.jsp";
		}

}

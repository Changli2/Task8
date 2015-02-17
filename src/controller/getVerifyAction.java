package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.LocationDAO;
import model.Model;

import org.genericdao.RollbackException;
import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.Api;
import org.scribe.builder.api.TwitterApi;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;

import databean.Location;

public class getVerifyAction extends Action{
	private LocationDAO locationDAO;

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return "getVerify.do";
	}
	
	public getVerifyAction(Model model) {
		// TODO Auto-generated constructor stub
		locationDAO= model.getLocationDAO();
	}


	@Override
	public String perform(HttpServletRequest request)  {
		OAuthService service = new ServiceBuilder()
		.provider(TwitterApi.class)
		.apiKey("dB3by68F7PjybbLBjXyXsjbzz")
		.apiSecret("PZXONAiRgfbBH0LNo2Z4bRDeekiGgjizlFhSu0T3A24MihbyWc")
		.callback("http://localhost:8080/Task8/homePage.do").build();
		 HttpSession session = request.getSession();
	     Token token =(Token) session.getAttribute("token");
		
		// =(Token) request.getAttribute("token");
		System.out.println(session.getAttribute("token"));
		Verifier v = new Verifier(request.getParameter("oauth_verifier"));
		System.out.println(request.getParameter("oauth_verifier"));
		Token accessToken = service.getAccessToken(token, v);
		//System.out.println(accessToken.getToken()+ "token is ");
		System.out.println(accessToken+"got");
		session.setAttribute("accessToken",accessToken.getToken());
		session.setAttribute("secretaccessToken", accessToken.getSecret());
		OAuthRequest req = new OAuthRequest(Verb.GET,
				"https://api.twitter.com/1.1/statuses/lookup.json");
		req.addQuerystringParameter("id", "20,432656548536401920");

		service.signRequest(accessToken, req);
		Response response = req.send();
		System.out.println("Got it! Lets see what we found...");
		System.out.println();

		System.out.println(response.getBody());
		
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

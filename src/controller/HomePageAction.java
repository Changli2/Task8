package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import databean.FlickrPhoto;
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
		List<FlickrPhoto> photos = new ArrayList<FlickrPhoto>();
		String searchurl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=9334fecf0b2c41602b2fd55a94a849e0&text="
				+ "Pittsburgh" + "&sort=relevance&format=rest";
		
		URL myURL;
		try {
			myURL = new URL(searchurl);
		

		HttpURLConnection con = (HttpURLConnection) myURL.openConnection();
		con.setRequestMethod("GET");
		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		
		String temp = in.readLine();
		String One = in.readLine();
		/* System.out.println(One); */

		String Two = in.readLine();
		/* System.out.println(Two); */

		String Three = in.readLine();
		/* System.out.println(Three); */

		for (int i = 0; i < 10; i++) {
			String line = in.readLine();
			if (!(line == null || line.equals(""))) {
				
				String[] parts = line.split("\\\"");
				if (parts.length >= 10) {
					String id = parts[1];
					String owner = parts[3];
					String secret = parts[5];
					String server = parts[7];
					String farm = parts[9];
					FlickrPhoto photo = new FlickrPhoto(id, owner, secret,
							server, farm);
					photos.add(photo);
				} else {
					System.out.println("backup branch");
				}
				



			}
		}
		
				
				in.close();
				con.disconnect();

				
				request.setAttribute("photos", photos);
			} catch (MalformedURLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

				
				
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


package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databean.FlickrPhoto;

public class UploadAction extends Action {

	public String getName() {
		// TODO Auto-generated method stub
		return "upload.do";
	}

	@Override
	public String perform(HttpServletRequest request) {

		try {
			try {
				MessageDigest hash = MessageDigest.getInstance("MD5");

			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// File file =new File("333.jpg");

			List<FlickrPhoto> photos = new ArrayList<FlickrPhoto>();
			String callTest = "https://api.flickr.com/services/rest/?method=flickr.tags.getClusterPhotos&api_key=d3803ebdf492372803328824620ab1d7&tag=BMW&cluster_id=car&format=rest&auth_token=72157650365512169-6655b6404f6f0cc7&api_sig=21fc5966999b117d0bf098de29936d1d";
			String uploadurl = "https://up.flickr.com/services/upload/&api_key=d3803ebdf492372803328824620ab1d7&auth_token=72157650365512169-6655b6404f6f0cc7&api_sig=21fc5966999b117d0bf098de29936d1d";
			String searchurl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=d237da9ec0636440997bacda66e0ef9f&tags="
					+ request.getParameter("keyword") + "&format=rest";
			
			URL myURL = new URL(searchurl);

			HttpURLConnection con = (HttpURLConnection) myURL.openConnection();
			con.setRequestMethod("GET");
			BufferedReader in = new BufferedReader(new InputStreamReader(
					con.getInputStream()));

			String temp = in.readLine();
			String One = in.readLine();
			/*System.out.println(One);*/

			String Two = in.readLine();
			/*System.out.println(Two);*/

			String Three = in.readLine();
			/*System.out.println(Three);*/

			for (int i = 0; i < 10; i++) {
				String line = in.readLine();
				if (!(line == null || line.equals(""))) {
					String[] parts = line.split("\\\"");
					String id = parts[1];
					String owner = parts[3];
					String secret = parts[5];
					String server = parts[7];
					String farm = parts[9];
					FlickrPhoto photo = new FlickrPhoto(id, owner, secret,
							server, farm);
					photos.add(photo);

					/*
					 * System.out.println(id); System.out.println(owner);
					 */

				}
			}

			in.close();
			con.disconnect();

			request.setAttribute("keyword", request.getParameter("keyword"));
			request.setAttribute("photos", photos);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Upload.jsp";
	}

}

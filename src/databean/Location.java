package databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("locId")
public class Location {
	private String locId;
	private String locName;
	private int count;
	
	public String getLocId() {
		return this.locId;
	}
	
	public String getLocName() {
		return this.locName;
	}
	
	public int getCount() {
		return this.count;
	}
	
	public void setLocId(String aLocId) {
		this.locId = aLocId;
	}
	
	public void setLocName(String aName) {
		this.locName = aName;
	}
	
	public void setCount(int num) {
		this.count = num;
	}
}

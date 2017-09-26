package com.cv.crawler;

import java.util.ArrayList;
import java.util.List;

public class Information
{
	private List<String> text;
	private List<String> url;
	public Information()
	{
		text = new ArrayList<String>();
		url = new ArrayList<String>();
	}
	public Information(List<String> text, List<String> url)
	{
		super();
		this.text = text;
		this.url = url;
	}
	public List<String> getText()
	{
		return text;
	}
	public void setText(List<String> text)
	{
		this.text = text;
	}
	public List<String> getUrl()
	{
		return url;
	}
	public void setUrl(List<String> url)
	{
		this.url = url;
	}
	
	
	
}

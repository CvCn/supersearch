package com.cv.search;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cv.crawler.Crawler;
import com.cv.crawler.Information;
import com.cv.crawler.Print;
import com.cv.crawler.PrintText;

/*
 * 实现功能：
 * * 从互联网抓取新闻
 * *　在网页中列举抓取的内容
 * 涉及技术
 * * 爬虫
 * * servlet
 * * html/css/js
 * * jsp
 * 步骤：
 * *　1.先从前端动态展示写起                                    固定的条数 动态展示
 * *　2.后台抓取的逻辑 固定时间抓取 储存在orcale数据库 每次页面刷新，从orcale数据库调取内容 
 * *　 	orcale数据库主要做数据备份 前台调取的始终是最新的抓取的内容（待完善）
 * *　3.设置tomcat开机自启，服务器启动便开始抓取数据
 */
public class search extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private PrintText pt;
	private Crawler c;
	
	@Override
	public void init() throws ServletException
	{
		pt = new Print();
		c = new Crawler();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		Information info = crawl("http://news.baidu.com/");
		List<String> text = info.getText();
		List<String> url = info.getUrl();
		req.setAttribute("one", text.get(0));
		req.setAttribute("oneH", url.get(0));
		req.setAttribute("two", text.get(6));
		req.setAttribute("twoH", url.get(6));
		req.setAttribute("three", text.get(7));
		req.setAttribute("threeH", url.get(7));
		req.setAttribute("four", text.get(8));
		req.setAttribute("fourH", url.get(8));
		req.setAttribute("five", text.get(9));
		req.setAttribute("fiveH", url.get(9));
		req.setAttribute("six", text.get(10));
		req.setAttribute("sixnH", url.get(10));
		
		req.getRequestDispatcher("WEB-INF/search/search.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		doPost(req, resp);
	}
	private Information crawl(String web){
		String pattern = "class=\"dot\">(.+?)<a href=\"(.+?)\"(.+?)>(.+?)</a>";
		List<String> url = c.rex(c.con(web), pattern, 2, 11, pt);
		List<String> text = c.rex(c.con(web), pattern, 4, 11, pt);
		return new Information(text, url);
	}
	
	
}

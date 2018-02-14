package com.sivalabs.asset;

import java.text.SimpleDateFormat;
import java.io.IOException;
import java.util.List;
import java.util.Date;
import org.hibernate.classic.Session;
import java.util.*;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author SivaLabs
 *
 */

@Controller
public class AssetControllers
{
	@Autowired
	private AssetDAO assetDAO;
	
	@Autowired
	private AssetFormValidator validator;
	
	@RequestMapping("/home")
	public String home()
	{
		return "home";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) 
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
		
	@RequestMapping("/searchasset")
	public ModelAndView searchasset(@RequestParam(required= false, defaultValue="") String name)
	{
		ModelAndView mav = new ModelAndView("Master_list");
		List<Asset> asset = assetDAO.searchAsset(name.trim());
		mav.addObject("SEARCH_ASSET_RESULTS_KEY", asset);
		return mav;
	}
	
	@RequestMapping("/Master_list")
	public ModelAndView getAllasset()
	{
		ModelAndView mav = new ModelAndView("Master_list");
		List<Asset> asset = assetDAO.getAllAsset();
		mav.addObject("SEARCH_ASSET_RESULTS_KEY", asset);
		return mav;
	}
	
	@RequestMapping("/viewIndex")
	public ModelAndView getIndex()
	{
		ModelAndView mav = new ModelAndView("Index_page");
		return mav;
	}
		
	/*@RequestMapping("/countDashboard")
	public ModelAndView getAlldashboardvalues1()
	public ModelAndView getIndex1()
	{
		ModelAndView mav = new ModelAndView("ViewIndex");
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		Query q=session.createQuery("select count(*) from asset");
		List<Integer> list=q.list();
		System.out.println(list.get(0));
		return mav;
	}*/
	
	/*@RequestMapping("/Count")
	public ModelAndView getIndex2()
	{
		String hql = "count(* from assets)";
		Query query = session.createQuery(hql);		
		Long count = (Long)query.uniqueResult();
		System.out.println("Display the output"+query);
	}*/
	
	
	
	@RequestMapping(value="/Add_asset", method=RequestMethod.GET)
	public ModelAndView newuserForm()
	{
		ModelAndView mav = new ModelAndView("Add_asset");
		Asset Asset = new Asset();
		mav.getModelMap().put("Add_asset", Asset);
		return mav;
	}
	
	@RequestMapping(value="/Add_asset", method=RequestMethod.POST)
	public String create(@ModelAttribute("Add_asset")Asset Asset, BindingResult result, SessionStatus status)
	{
		System.out.println("From Add Asset  post before validate");
		validator.validate(Asset, result);
		if (result.hasErrors()) 
		{				
			return "Add_asset";
		}
		assetDAO.save(Asset);
		status.setComplete();
		System.out.println("From Add Asset  post after validate");
		return "redirect:Master_list.do";
	}
	
	@RequestMapping(value="/editAsset", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("editAsset");
		Asset Asset = assetDAO.getById(id);
		mav.addObject("editAsset", Asset);
		return mav;
	}
	
	@RequestMapping(value="/editAsset", method=RequestMethod.POST)
	public String update(@ModelAttribute("editAsset") Asset Asset, BindingResult result, SessionStatus status)
	{
		
		System.out.println("From Update  Post Method---------------Before Update!");
		validator.validate(Asset, result);
		if (result.hasErrors()) {
			return "editAsset";
		}
		assetDAO.update(Asset);
		status.setComplete();
		System.out.println("From Update  Post Method---------------After Update!");
		return "redirect:Master_list.do";
	}
	
	
	@RequestMapping("deleteAsset")
	public ModelAndView delete(@RequestParam("id")Integer id)
	{
		System.out.println("From Delete***********************");
		
		ModelAndView mav = new ModelAndView("redirect:Master_list.do");
		assetDAO.delete(id);
		return mav;
	}
	
}

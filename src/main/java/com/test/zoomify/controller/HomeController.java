package com.test.zoomify.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.zoomify.vo.ImageVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, String zoomifyName, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		String[] fileNames = {"345166.jpg","469892.jpg","469924.jpg","469968.jpg","469986.jpg","953904.jpg","99013.jpg"};
		String[] zoomifyImages = {"345166","469892","469924","469968","469986","953904","99013"};
		List<ImageVO> zoomifys = new ArrayList<ImageVO>();
		for(int i=0; i<7; i++) {
			ImageVO vo = new ImageVO();
			vo.setFileName(fileNames[i]);
			vo.setZoomifyImage(zoomifyImages[i]);
			zoomifys.add(vo);
		}
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("zoomifys", zoomifys);
		if(zoomifyName != null) {
			logger.info("받아온 이미지 이름: " + zoomifyName);
			model.addAttribute("zoomifyName", zoomifyName);
		}
		
		return "home";
	}
	
}

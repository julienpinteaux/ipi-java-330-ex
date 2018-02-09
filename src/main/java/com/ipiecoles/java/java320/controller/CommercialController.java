package com.ipiecoles.java.java320.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ipiecoles.java.java320.model.Commercial;
import com.ipiecoles.java.java320.service.CommercialService;

@Controller
@RequestMapping("/commercial")
public class CommercialController {
	
	@Autowired
	private CommercialService commercialService;
	
	@RequestMapping 
	(method = RequestMethod.GET,value = "/new")
	public String formulaireCommercial() {

		return "employes/detail";
	}
	
	@RequestMapping 
	(method = RequestMethod.POST,consumes=MediaType.APPLICATION_FORM_URLENCODED_VALUE, produces = "text/html",value = "/{id}")
	public String creerCommercial(@PathVariable (value = "id") Long id, @RequestBody Commercial commercial,Map<String, Object> model) {

		commercialService.updateEmploye(id, commercial);
		model.put("employe",commercial);
		
		return "employe/detail" + id;
	}
}
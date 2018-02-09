package com.ipiecoles.java.java320.controller;

import java.util.Map;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ipiecoles.java.java320.model.Employe;
import com.ipiecoles.java.java320.service.EmployeService;

@Controller
@RequestMapping("/employes")
public class EmployeController {
	
	@Autowired
	private EmployeService employeService;
	
	@RequestMapping
	(method = RequestMethod.GET,
	value = "")
	public String test(Map<String, Object> model) {
		
		Long nbr = employeService.countAllEmploye();
		model.put("nbr", nbr);
	    
	    return "index";
	}
	
	@RequestMapping
	(method = RequestMethod.GET,
	value = "/{id}")
	public String infoEmployeById(@PathVariable (value = "id") Long id,Map<String, Object> model) {
		
		if(id != 0) {
			Employe employe = employeService.findById(id);	
			model.put("employe", employe);
			return "employes/detail";
		}
		else { return "erreur";}
	}
	
	@RequestMapping 
	(method = RequestMethod.GET, produces = "text/html",value = "", params = {"matricule"})
	public String findByMatricule(@RequestParam ("matricule") String mat,Map<String, Object> model) {

		try {
		Employe employe = employeService.findMyMatricule(mat);
		model.put("employe",employe);
		return "employes/detail";
		}
		catch(EntityNotFoundException e) {
			return "erreur";
		}
	}
	
	@RequestMapping 
	(method = RequestMethod.GET, produces = "text/html",value = "",
	params = {"page","size","sortDirection","sortProperty"})
	public String sortPagination(@RequestParam ("page") Integer page,
			@RequestParam ("size") Integer size,
			@RequestParam ("sortDirection") String sortDirection,
			@RequestParam ("sortProperty") String sortProperty,
			Map<String, Object> model){

		Page<Employe> emps = employeService.findAllEmployes(page, size, sortProperty, sortDirection);
		model.put("emps", emps);
		model.put("start", page*size+1);
		model.put("end", page*size+emps.getNumberOfElements());
		model.put("total",emps.getTotalElements());
		model.put("page", page);
		model.put("nbrpage", emps.getTotalPages());
		
		return "employes/liste";
	}
	
	
	
}
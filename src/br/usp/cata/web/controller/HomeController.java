package br.usp.cata.web.controller;

import java.nio.charset.Charset;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.usp.cata.service.RuleService;
import br.usp.cata.service.UserService;


@Resource
public class HomeController {
	
	private final Result result;
	private final RuleService ruleService;
	private final UserService userService;
	
	static final Logger logger = LogManager.getLogger(IndexController.class); 
	
	public HomeController(Result result, RuleService ruleService, UserService userService) {
		this.result = result;
		this.ruleService = ruleService;
		this.userService = userService;
	}
	
	@Get
	@Path("/home")
	public void index() {
    	result.include("charsets", Charset.availableCharsets().values());
	}
	
	@Get
	@Path("/statistics")
	public void statistics() {
		logger.trace("Acesso á página statistics pelo usuário " + (userService.isAuthenticatedUser() ? userService.getUser().getName() : "não autenticado"));
		result.include("rules", ruleService.findAll());
	}
	
}

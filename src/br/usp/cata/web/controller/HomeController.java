package br.usp.cata.web.controller;

import java.nio.charset.Charset;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;


@Resource
public class HomeController {
	
	private final Result result;
	
	public HomeController(Result result) {
		this.result = result;
	}
	
	@Get
	@Path("/home")
	public void index() {
    	result.include("charsets", Charset.availableCharsets().values());
	}
	
}

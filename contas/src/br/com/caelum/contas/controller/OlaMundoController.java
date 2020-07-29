package br.com.caelum.contas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OlaMundoController {
	
	@RequestMapping("/teste")
	public String executar(){
		System.out.println("Primeiro teste com Spring MVC");
		return "teste/foi";
		
	}

}

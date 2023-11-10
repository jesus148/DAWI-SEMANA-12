package com.empresa.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Cliente;

import com.empresa.service.ClienteService;


import lombok.extern.apachecommons.CommonsLog;

@Controller
@CommonsLog
public class ClienteConsultaController {
	
	
	
	@Autowired
	private ClienteService clienteservice;
	
	
	@GetMapping("/verConsultaCliente")
	public String verInicio() {
		return "consultaCliente";
	}
	
	
	
	
	@GetMapping("/consultaCliente")
	@ResponseBody
	public List<Cliente> consulta (int estado, 
									String nombre, 
									String dni){
		
		List<Cliente> lstSalida = clienteservice.listaConsultaCliente(estado, "%"+nombre+"%", "%" +dni+ "%");
		
		return lstSalida;
	}
	
	
	
	
	
	
	
	
	

}

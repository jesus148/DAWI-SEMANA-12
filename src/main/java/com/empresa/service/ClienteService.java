package com.empresa.service;


import java.util.List;

import com.empresa.entity.Cliente;


public interface ClienteService {
	public abstract Cliente insertaCliente(Cliente obj);
	public abstract List<Cliente> listaPorDni(String dni);
	public abstract List<Cliente> listaPorNombre(String nombre);
	
	//consultas
	public abstract List<Cliente> listaConsultaCliente(int estado, String nombre, String dni);
}

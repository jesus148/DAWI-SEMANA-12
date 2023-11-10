package com.empresa.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.empresa.entity.Cliente;


public interface ClienteRepository extends JpaRepository<Cliente, Integer> {
	
	public List<Cliente> findByDni(String dni);
	public List<Cliente> findByNombre(String nombre);
	
	
	
	//Consulta
	@Query("select e from Cliente e where "
			+ "( e.estado = ?1)  and "
			+ "( e.nombre like ?2 ) and "
			+ "( e.dni = ?3 )") 
	public abstract List<Cliente> listaConsultaCliente(int estado, String nombre, String dni);
	
	
}

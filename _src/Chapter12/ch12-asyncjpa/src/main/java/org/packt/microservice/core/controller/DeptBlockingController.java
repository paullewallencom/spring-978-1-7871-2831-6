package org.packt.microservice.core.controller;


import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.packt.microservice.core.model.data.Department;
import org.packt.microservice.core.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DeptBlockingController {
	
	@Autowired
	private DepartmentService departmentServiceImpl;
	
	@GetMapping(value="/selectDept/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
	public Department blockDepartment(@PathVariable("id") Integer id) {
		return departmentServiceImpl.findAllDeptById(id);
	}
		
	@GetMapping(value="/listDept", produces= MediaType.APPLICATION_JSON_VALUE)
	public List<Department> blockListDept() {
		return departmentServiceImpl.findAllDeptList();
	}
	
	
	
	/*
	@PostMapping(value="/saveDeptRec", consumes= MediaType.APPLICATION_JSON_VALUE)
	public Boolean blockSaveDept(@RequestBody Department dept) {
		try{
			departmentServiceImpl.saveDeptRec(dept);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	*/
}

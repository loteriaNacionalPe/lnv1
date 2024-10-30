package org.loterianacional.springcloud.msvc.controllers;

import org.loterianacional.springcloud.msvc.models.entities.Departamento;
import org.loterianacional.springcloud.msvc.services.DepartamentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios/user/departamentos")
public class DepartamentoController {

    @Autowired
    private DepartamentoService service;

    @GetMapping("/")
    public List<Departamento> listarDepartamento(){
        return service.listarDepartamentos();
    }

}

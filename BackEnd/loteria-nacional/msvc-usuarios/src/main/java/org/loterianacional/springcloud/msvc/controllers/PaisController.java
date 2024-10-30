package org.loterianacional.springcloud.msvc.controllers;

import org.loterianacional.springcloud.msvc.models.entities.Pais;
import org.loterianacional.springcloud.msvc.services.PaisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios/user/paises")
public class PaisController {

    @Autowired
    private PaisService service;

    @GetMapping("/")
    public List<Pais> listarPaises(){
        return service.listarPaises();
    }

}

package org.loterianacional.springcloud.msvc.controllers;

import org.loterianacional.springcloud.msvc.models.entities.Provincia;
import org.loterianacional.springcloud.msvc.models.entities.Usuario;
import org.loterianacional.springcloud.msvc.services.ProvinciaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios/user/provincias")
public class ProvinciaController {

    @Autowired
    private ProvinciaService service;

    @GetMapping("/{idDepartamento}")
    public ResponseEntity<?> listarProvinciaPorId(@PathVariable String idDepartamento){
        List<Provincia> provinciaPorId = service.listarProvinciaPorId(idDepartamento);
        if(provinciaPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(provinciaPorId);
    }

}

package org.loterianacional.springcloud.msvc.controllers;

import org.loterianacional.springcloud.msvc.models.entities.Distrito;
import org.loterianacional.springcloud.msvc.models.entities.Provincia;
import org.loterianacional.springcloud.msvc.services.DistritoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios/user/distritos")
public class DistritoController {

    @Autowired
    private DistritoService service;

    @GetMapping("/{idDepartamento}/{idProvincia}")
    public ResponseEntity<?> listarDistritoPorId(@PathVariable String idDepartamento,@PathVariable String idProvincia){
        List<Distrito> distritoPorId = service.listarDistritoPorId(idDepartamento,idProvincia);
        if(distritoPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(distritoPorId);
    }

}

package org.loterianacional.springcloud.msvc.controllers;

import org.loterianacional.springcloud.msvc.models.entities.TipoUsuario;
import org.loterianacional.springcloud.msvc.models.entities.Usuario;
import org.loterianacional.springcloud.msvc.services.TipoUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios/user/tipoUsuario")
public class TipoUsuarioController {

    @Autowired
    private TipoUsuarioService service;

    @GetMapping("/")
    public List<TipoUsuario> listarTipoUsuario(){
        return service.listarTipoUsuario();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> listarTipoUsuarioPorId(@PathVariable Integer id) {
        List<TipoUsuario> tipoUsuario = service.listarTipoUsuarioPorId(id);
        if (tipoUsuario.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(tipoUsuario);
    }

}

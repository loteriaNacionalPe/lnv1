package org.loterianacional.springcloud.msvc.controllers;

import org.loterianacional.springcloud.msvc.models.entities.TipoDocumento;
import org.loterianacional.springcloud.msvc.models.entities.TipoUsuario;
import org.loterianacional.springcloud.msvc.services.TipoDocumentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios/user/tipoDocumento")
public class TipoDocumentoController {

    @Autowired
    private TipoDocumentoService service;

    @GetMapping("/")
    public List<TipoDocumento> listarTipoDocumento(){
        return service.listarTipoDocumento();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> listarTipoDocumentoPorId(@PathVariable Integer id) {
        List<TipoDocumento> tipoDocumento = service.listarTipoDocumentoPorId(id);
        if (tipoDocumento.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(tipoDocumento);
    }

}

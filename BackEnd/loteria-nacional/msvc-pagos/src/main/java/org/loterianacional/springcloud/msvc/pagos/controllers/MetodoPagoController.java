package org.loterianacional.springcloud.msvc.pagos.controllers;

import org.loterianacional.springcloud.msvc.pagos.models.entities.EstadoPago;
import org.loterianacional.springcloud.msvc.pagos.models.entities.MetodoPago;
import org.loterianacional.springcloud.msvc.pagos.services.EstadoPagoService;
import org.loterianacional.springcloud.msvc.pagos.services.MetodoPagoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/pagos/user/metodoPago")
public class MetodoPagoController {


    @Autowired
    private MetodoPagoService service;

    @GetMapping("/")
    public List<MetodoPago> listarMetodoPago(){
        return service.listarMetodoPago();
    }

    @GetMapping("/{idMetodoPago}")
    public ResponseEntity<?> listarMetodoPagoPorId(@PathVariable Integer idMetodoPago) {
        List<MetodoPago> metodoPago = service.listarMetodoPagoPorId(idMetodoPago);
        if (metodoPago.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(metodoPago);
    }

}

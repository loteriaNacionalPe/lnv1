package org.loterianacional.springcloud.msvc.pagos.controllers;

import org.loterianacional.springcloud.msvc.pagos.models.entities.EstadoPago;
import org.loterianacional.springcloud.msvc.pagos.services.EstadoPagoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/pagos/user/stadoPago")
public class EstadoPagoController {

    @Autowired
    private EstadoPagoService service;

    @GetMapping("/")
    public List<EstadoPago> listarEstadoPago(){
        return service.listarEstadoPago();
    }

    @GetMapping("/{idEstadoPago}")
    public ResponseEntity<?> listarEstadoPagoPorId(@PathVariable Integer idEstadoPago) {
        List<EstadoPago> estadoPago = service.listarEstadoPagoPorId(idEstadoPago);
        if (estadoPago.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(estadoPago);
    }

}

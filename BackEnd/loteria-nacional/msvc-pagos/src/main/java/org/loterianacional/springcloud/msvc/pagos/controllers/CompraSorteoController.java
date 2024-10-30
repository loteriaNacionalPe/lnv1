package org.loterianacional.springcloud.msvc.pagos.controllers;

import org.loterianacional.springcloud.msvc.pagos.models.DTOs.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.pagos.models.entities.CompraSorteo;
import org.loterianacional.springcloud.msvc.pagos.services.CompraSorteoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pagos/user/compraSorteo")
public class CompraSorteoController {

    @Autowired
    private CompraSorteoService service;

    @GetMapping("/sorteos/usuario")
    public ResponseEntity<?> listarCompraSorteoPorUsuario(@RequestParam("idUsuario")  Integer idUsuario) {
        List<CompraSorteoUsuario> estadoPago = service.listarCompraSorteoPorUsuario(idUsuario);
        if (estadoPago.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(estadoPago);
    }

    @GetMapping("/sorteos/{idSorteo}")
    public ResponseEntity<?> listarCompraSorteoPorSorteo(@PathVariable  Integer idSorteo) {
        List<CompraSorteoUsuario> estadoPago = service.listarCompraSorteoPorSorteo(idSorteo);
        if (estadoPago.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(estadoPago);
    }

    @PostMapping("/registroCompraSorteo")
    public ResponseEntity<?> insertarCompraSorteo (@RequestBody CompraSorteo compraSorteo,@RequestHeader("Authorization") String token){

        service.insertarCompraSorteo(compraSorteo,token);
        return ResponseEntity.ok("Se registró la compra.");
    }

    @DeleteMapping("/eliminacionCompraSorteo/{idCompraSorteo}")
    public ResponseEntity<?> eliminarJuego (@PathVariable Integer idCompraSorteo){
        service.eliminarCompraSorteo(idCompraSorteo);
        return ResponseEntity.ok("Se eliminó la compra.");
    }

}

package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.DTOs.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.loterianacional.springcloud.msvc.juegos.services.SorteoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/user/sorteo")
public class SorteoController {

    @Autowired
    private SorteoService service;

    @PostMapping("/registroDeSorteo")
    public ResponseEntity<?> insertarSorteo (@RequestBody Sorteo sorteo){

        service.insertarSorteo(sorteo);
        return ResponseEntity.ok("Se registró el sorteo.");
    }

    @GetMapping("/")
    public List<Sorteo> listarSorteos(){
        return service.listarSorteos();
    }


    @GetMapping("/{idSorteo}")
    public ResponseEntity<?> listarSorteoPorId(@PathVariable Integer idSorteo){
        List<Sorteo> sorteoPorId = service.listarSorteoPorId(idSorteo);
        if(sorteoPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(sorteoPorId.get(0));
    }

    @PutMapping("/actualizacionSorteo/{idSorteo}")
    public ResponseEntity<?> actualizarSorteo (@PathVariable Integer idSorteo, @RequestBody Sorteo sorteo){

        service.actualizarSorteo(idSorteo,sorteo);
        return ResponseEntity.ok("Se actualizó el sorteo.");
    }

    @PutMapping("/actualizacionTicktGanadorSorteo/{idSorteo}")
    public ResponseEntity<?> actualizarTicketganadorSorteo (@PathVariable Integer idSorteo, @RequestBody Sorteo sorteo){

        service.actualizarTicketGanadorSorteo(idSorteo,sorteo);
        return ResponseEntity.ok("Se actualizó el ticket ganador.");
    }

    @DeleteMapping("/eliminacionSorteo/{idSorteo}")
    public ResponseEntity<?> eliminarSorteo (@PathVariable Integer idSorteo){

        service.eliminarSorteo(idSorteo);
        return ResponseEntity.ok("Se eliminó el sorteo.");
    }

    @GetMapping("/juego/{idJuego}")
    public ResponseEntity<?> listarSorteoPorJuego(@PathVariable Integer idJuego){
        List<Sorteo> sorteoPorJuego = service.listarSorteoPorJuego(idJuego);
        if(sorteoPorJuego.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(sorteoPorJuego);
    }

    @GetMapping("/usuario/{idUsuario}")
    public ResponseEntity<?> listarCompraSorteoPorUsuario_MsvcPago(@PathVariable Integer idUsuario, @RequestHeader("Authorization") String token){
        List<CompraSorteoUsuario> sorteoPorUsuario = service.listarCompraSorteoPorUsuario_MsvcPago(idUsuario,token);
        if(sorteoPorUsuario.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(sorteoPorUsuario);
    }

}

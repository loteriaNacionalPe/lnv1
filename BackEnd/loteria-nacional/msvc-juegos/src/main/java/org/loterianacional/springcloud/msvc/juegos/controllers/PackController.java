package org.loterianacional.springcloud.msvc.juegos.controllers;

import jakarta.validation.Valid;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;
import org.loterianacional.springcloud.msvc.juegos.services.PackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/user/pack")
public class PackController {

    @Autowired
    private PackService service;

    @PostMapping("/registroDePack")
    public ResponseEntity<?> insertarPack (@RequestBody Pack pack){

        service.insertarPack(pack);
        return ResponseEntity.ok("Se registró el pack.");
    }

    @PutMapping("/actualizacionDePack/{idPack}")
    public ResponseEntity<?> actualizarPack (@PathVariable Integer idPack, @RequestBody Pack pack){

        service.actualizarPack(idPack,pack);
        return ResponseEntity.ok("Se actualizó el pack.");
    }

    @GetMapping("/")
    public List<Pack> listarPacks(){
        return service.listarPacks();
    }

    @GetMapping("/{idPack}")
    public ResponseEntity<?> listarPackPorId(@PathVariable Integer idPack){
        List<Pack> packPorId = service.listarPackPorId(idPack);
        if(packPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(packPorId.get(0));
    }

    @GetMapping("/packJuego/{idJuego}")
    public ResponseEntity<?> listarPackPorJuego(@PathVariable Integer idJuego){
        List<Pack> packPorJuego = service.listarPackPorJuego(idJuego);
        if(packPorJuego.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(packPorJuego);
    }

    @GetMapping("/packSorteo/{idSorteo}")
    public ResponseEntity<?> listarPackPorSorteo(@PathVariable Integer idSorteo){
        List<Pack> packPorSorteo = service.listarPackPorSorteo(idSorteo);
        if(packPorSorteo.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(packPorSorteo);
    }

    @DeleteMapping("/eliminacionDePack/{idPack}")
    public ResponseEntity<?> eliminarPack (@PathVariable Integer idPack){
        service.eliminarPack(idPack);
        return ResponseEntity.ok("Se eliminó el pack.");
    }

}

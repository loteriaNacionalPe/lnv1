package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.CodigoPromocional;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Influencer;
import org.loterianacional.springcloud.msvc.juegos.services.CodigoPromocionalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/user/influencers/codigoPromocional")
public class CodigoPromocionalController {

    @Autowired
    private CodigoPromocionalService service;

    @PostMapping("/registroCodigoPromocional")
    public ResponseEntity<?> insertarCodigoPromocional (@RequestBody CodigoPromocional codigoPromocional){

        service.insertarCodigoPromocional(codigoPromocional);
        return ResponseEntity.ok("Se registró el codigo promocional.");
    }

    @PutMapping("/actualizacionCodigoPromocional/{idCodigoPromocional}")
    public ResponseEntity<?> actualizarCodigoPromocional (@PathVariable Integer idCodigoPromocional, @RequestBody CodigoPromocional codigoPromocional){

        service.actualizarCodigoPromocional(idCodigoPromocional,codigoPromocional);
        return ResponseEntity.ok("Se actualizó el codigo promocional.");
    }

    @GetMapping("/")
    public List<CodigoPromocional> listarCodigoPromocional(){
        return service.listarCodigoPromocional();
    }

    @GetMapping("/{idCodigoPromocional}")
    public ResponseEntity<?> listarCodigoPromocionalPorId(@PathVariable Integer idCodigoPromocional){
        List<CodigoPromocional> codigoPromocionalPorId = service.listarCodigoPromocionalPorId(idCodigoPromocional);
        if(codigoPromocionalPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(codigoPromocionalPorId.get(0));
    }

    @GetMapping("/influencer/{idInfluencer}")
    public ResponseEntity<?> listarCodigoPromocionalPorInfluencer(@PathVariable Integer idInfluencer){
        List<CodigoPromocional> codigoPromocionalPorInfluencer = service.listarCodigoPromocionalPorInfluencer(idInfluencer);
        if(codigoPromocionalPorInfluencer.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(codigoPromocionalPorInfluencer);
    }

    @DeleteMapping("/eliminacionCodigoPromocional/{idCodigoPromocional}")
    public ResponseEntity<?> eliminarCodigoPromocional (@PathVariable Integer idCodigoPromocional){
        service.eliminarCodigoPromocional(idCodigoPromocional);
        return ResponseEntity.ok("Se eliminó el codigo promocional.");
    }


}

package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Influencer;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;
import org.loterianacional.springcloud.msvc.juegos.services.InfluencerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/user/influencers")
public class InfluencerController {

    @Autowired
    private InfluencerService service;

    @PostMapping("/registroDeInfluencer")
    public ResponseEntity<?> insertarInfluencer (@RequestBody Influencer influencer){

        service.insertarInfluencer(influencer);
        return ResponseEntity.ok("Se registró el influencer.");
    }

    @PutMapping("/actualizacionDeInfluencer/{idInfluencer}")
    public ResponseEntity<?> actualizarInfluencer (@PathVariable Integer idInfluencer, @RequestBody Influencer influencer){

        service.actualizarInfluencer(idInfluencer,influencer);
        return ResponseEntity.ok("Se actualizó el influencer.");
    }

    @GetMapping("/")
    public List<Influencer> listarInfluencers(){
        return service.listarInfluencers();
    }

    @GetMapping("/{idInfluencer}")
    public ResponseEntity<?> listarInfluencerPorId(@PathVariable Integer idInfluencer){
        List<Influencer> packPorId = service.listarInfluencerPorId(idInfluencer);
        if(packPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(packPorId.get(0));
    }

    @DeleteMapping("/eliminacionDePack/{idInfluencer}")
    public ResponseEntity<?> eliminarInfluencer (@PathVariable Integer idInfluencer){
        service.eliminarInfluencer(idInfluencer);
        return ResponseEntity.ok("Se eliminó el pack.");
    }

}

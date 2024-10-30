package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.IndicadorInfluencer;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Influencer;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;
import org.loterianacional.springcloud.msvc.juegos.services.IndicadorInfluencerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/user/influencers/indicadores")
public class IndicadorInfluencerController {

    @Autowired
    private IndicadorInfluencerService service;

    @PostMapping("/registroDeIndicador")
    public ResponseEntity<?> insertarIndicadorInfluencer (@RequestBody IndicadorInfluencer indicadorInfluencer){

        service.insertarIndicadorInfluencer(indicadorInfluencer);
        return ResponseEntity.ok("Se registró el indicador de influencer.");
    }

    @GetMapping("/")
    public List<IndicadorInfluencer> listarIndicadorInfluencer(){
        return service.listarIndicadorInfluencer();
    }

    @GetMapping("/{idCodigoPromocional}")
    public ResponseEntity<?> listarIndicadorInfluencerPorCodigoPromocional(@PathVariable Integer idCodigoPromocional){
        List<IndicadorInfluencer> indicadorInfluencerPorCodigoPromociona = service.listarIndicadorInfluencerPorCodigoPromocional(idCodigoPromocional);
        if(indicadorInfluencerPorCodigoPromociona.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(indicadorInfluencerPorCodigoPromociona);
    }


}

package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;
import org.loterianacional.springcloud.msvc.juegos.services.JuegoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/user")
public class JuegoController {

    @Autowired
    private JuegoService service;

    @PostMapping("/registroDeJuego")
    public ResponseEntity<?> insertarJuego (@RequestBody Juego juego){

        service.insertarJuego(juego);
        return ResponseEntity.ok("Se registró al juego.");
    }

    @PutMapping("/actualizacionDeJuego/{idJuego}")
    public ResponseEntity<?> actualizarJuego (@PathVariable Integer idJuego, @RequestBody Juego juego){

        service.actualizarJuego(idJuego,juego);
        return ResponseEntity.ok("Se actualizó el juego.");
    }

    @DeleteMapping("/eliminacionDeJuego/{idJuego}")
    public ResponseEntity<?> eliminarJuego (@PathVariable Integer idJuego){
        service.eliminarJuego(idJuego);
        return ResponseEntity.ok("Se eliminó al juego.");
    }

    @GetMapping("/")
    public List<Juego> listarJuegos(){
        return service.listarJuegos();
    }


    @GetMapping("/{idJuego}")
    public ResponseEntity<?> listarJuegoPorId(@PathVariable Integer idJuego){
        List<Juego> juegoPorId = service.listarJuegoPorId(idJuego);
        if(juegoPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(juegoPorId.get(0));
    }

}

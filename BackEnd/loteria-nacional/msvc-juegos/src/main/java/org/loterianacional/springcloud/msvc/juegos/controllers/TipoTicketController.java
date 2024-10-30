package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TipoTicket;
import org.loterianacional.springcloud.msvc.juegos.services.TipoTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/user/tipoTicket")
public class TipoTicketController {

    @Autowired
    private TipoTicketService service;

    @GetMapping("/")
    public List<TipoTicket> listarTipoTicket(){
        return service.listarTipoTicket();
    }

    @GetMapping("/{idTipoTicket}")
    public ResponseEntity<?> listarTipoTicketPorId(@PathVariable Integer idTipoTicket){
        List<TipoTicket> tipoTicketPorId = service.listarTipoTicketPorId(idTipoTicket);
        if(tipoTicketPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(tipoTicketPorId.get(0));
    }

    @PutMapping("/actualizacionDeTipoTicket/{idTipoTicket}")
    public ResponseEntity<?> actualizarTipoTicket (@PathVariable Integer idTipoTicket, @RequestBody TipoTicket tipoTicket){

        service.actualizarTipoTicket(idTipoTicket,tipoTicket);
        return ResponseEntity.ok("Se actualizó el tipo ticket.");
    }


}

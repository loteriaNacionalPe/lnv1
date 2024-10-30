package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.DTOs.TicketSorteoCompra;
import org.loterianacional.springcloud.msvc.juegos.models.DTOs.TicketSorteoFisico;
import org.loterianacional.springcloud.msvc.juegos.models.DTOs.TicketSorteoVirtual;
import org.loterianacional.springcloud.msvc.juegos.services.TicketSorteoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/juegos/user/ticketSorteo")
public class TicketSorteoController {

    @Autowired
    private TicketSorteoService service;

    @PostMapping("/registroTicketSorteoVirtual")
    public ResponseEntity<?> insertarTicketSorteoVirtual (@RequestBody TicketSorteoVirtual ticketSorteo){

        service.insertarTicketSorteoVirtual(ticketSorteo);
        return ResponseEntity.ok("Registro de tickets vituales correcto.");
    }

    @PostMapping("/registroTicketSorteoFisico")
    public ResponseEntity<?> insertarTicketSorteoFisico (@RequestBody TicketSorteoFisico ticketSorteo){

        service.insertarTicketSorteoFisico(ticketSorteo);
        return ResponseEntity.ok("Registro de tickets fisicos correcto.");
    }

    @GetMapping("/ticketPorCompra")
    public ResponseEntity<?> listarTicketSorteoPorCompraSorteo(@RequestParam("idCompraSorteo")  Integer idCompraSorteo){
        List<TicketSorteoCompra> ticketPorCompra = service.listarTicketSorteoPorCompraSorteo(idCompraSorteo);
        if(ticketPorCompra.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(ticketPorCompra);
    }

    /*
    @GetMapping("/usuario")
    public ResponseEntity<?> listarTicketSorteoPorDni(@RequestParam("dni")  String dni){
        List<TicketSorteo> ticketPorDni = service.listarTicketSorteoPorDni(dni);
        if(ticketPorDni.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(ticketPorDni);
    }
    */

}

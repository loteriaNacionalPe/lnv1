package org.loterianacional.springcloud.msvc.clients;

import feign.FeignException;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;

@FeignClient(name = "msvc-juegos", url = "localhost:8002")
//@FeignClient(name = "msvc-juegos", url = "host.docker.internal:8002")
public interface JuegoClientRest {

    /*
    //SORTEO
    @GetMapping("/api/juegos/sorteo/ticket/usuario")
    public List<TicketSorteo> listarTicketSorteoPorDni(@RequestParam("dni")  String dni);

    default List<TicketSorteo> listarTicketSorteoPorDniFallback(String dni, FeignException e) {
        if (e.status() == 404) {
            return Collections.emptyList();
        }
        throw e;
    }*/


}

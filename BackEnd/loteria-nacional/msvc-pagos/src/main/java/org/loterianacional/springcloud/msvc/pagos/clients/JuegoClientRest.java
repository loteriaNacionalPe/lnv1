package org.loterianacional.springcloud.msvc.pagos.clients;


import org.loterianacional.springcloud.msvc.pagos.configs.FeignClientConfig;
import org.loterianacional.springcloud.msvc.pagos.models.DTOs.TicketSorteoFisico;
import org.loterianacional.springcloud.msvc.pagos.models.DTOs.TicketSorteoVirtual;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

@FeignClient(name = "msvc-juegos", url = "localhost:8002", configuration = FeignClientConfig.class)
public interface JuegoClientRest {

    @PostMapping("/api/juegos/user/ticketSorteo/registroTicketSorteoVirtual")
    public void insertarTicketSorteoVirtual (@RequestBody TicketSorteoVirtual ticketSorteo, @RequestHeader("Authorization") String token);

    @PostMapping("/api/juegos/user/ticketSorteo/registroTicketSorteoFisico")
    public void insertarTicketSorteoFisico (@RequestBody TicketSorteoFisico ticketSorteo, @RequestHeader("Authorization") String token);

}

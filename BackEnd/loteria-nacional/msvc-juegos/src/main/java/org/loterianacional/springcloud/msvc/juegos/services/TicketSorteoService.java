package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.DTOs.TicketSorteoCompra;
import org.loterianacional.springcloud.msvc.juegos.models.DTOs.TicketSorteoFisico;
import org.loterianacional.springcloud.msvc.juegos.models.DTOs.TicketSorteoVirtual;

import java.util.List;

public interface TicketSorteoService {

    void insertarTicketSorteoVirtual(TicketSorteoVirtual ticketSorteo);
    void insertarTicketSorteoFisico(TicketSorteoFisico ticketSorteo);
    List<TicketSorteoCompra> listarTicketSorteoPorCompraSorteo(Integer idCompraSorteo);


}

package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.TipoTicket;

import java.util.List;

public interface TipoTicketService {

    List<TipoTicket> listarTipoTicket();

    List<TipoTicket> listarTipoTicketPorId(Integer idTipoTicket);

    void actualizarTipoTicket(Integer idTipoTicket, TipoTicket tipoTicket);

}

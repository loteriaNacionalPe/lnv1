package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TipoTicket;
import org.loterianacional.springcloud.msvc.juegos.repositories.TipoTicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class TipoTicketServiceImpl implements TipoTicketService{

    @Autowired
    private TipoTicketRepository repository;

    @Override
    public List<TipoTicket> listarTipoTicket() {

        List<Object[]> results = repository.listarTipoTicket();
        List<TipoTicket> tiposTicket = new ArrayList<>();

        for (Object[] result : results) {
            TipoTicket tipoTicket = new TipoTicket();

            tipoTicket.setIdTipoTicket((Integer) result[0]);
            tipoTicket.setDescripcion((String) result[1]);

            tiposTicket.add(tipoTicket);

        }

        return tiposTicket;

    }

    @Override
    public List<TipoTicket> listarTipoTicketPorId(Integer idTipoTicket) {
        List<Object[]> results = repository.listarTipoTicketPorId(idTipoTicket);
        List<TipoTicket> tiposTicket = new ArrayList<>();

        for (Object[] result : results) {
            TipoTicket tipoTicket = new TipoTicket();

            tipoTicket.setIdTipoTicket((Integer) result[0]);
            tipoTicket.setDescripcion((String) result[1]);

            tiposTicket.add(tipoTicket);

        }

        return tiposTicket;
    }

    @Override
    @Transactional
    public void actualizarTipoTicket(Integer idTipoTicket, TipoTicket tipoTicket) {
        repository.actualizarTipoTicket(idTipoTicket, tipoTicket.getDescripcion());
    }
}

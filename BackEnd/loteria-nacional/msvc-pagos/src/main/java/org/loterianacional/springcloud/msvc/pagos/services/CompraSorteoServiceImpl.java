package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.clients.JuegoClientRest;
import org.loterianacional.springcloud.msvc.pagos.models.DTOs.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.pagos.models.DTOs.TicketSorteoFisico;
import org.loterianacional.springcloud.msvc.pagos.models.DTOs.TicketSorteoVirtual;
import org.loterianacional.springcloud.msvc.pagos.models.entities.CompraSorteo;
import org.loterianacional.springcloud.msvc.pagos.repositories.CompraSorteoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Console;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CompraSorteoServiceImpl implements CompraSorteoService {

    @Autowired
    private CompraSorteoRepository repository;

    @Autowired
    private JuegoClientRest juegoClientRest;

    @Override
    public List<CompraSorteoUsuario> listarCompraSorteoPorUsuario(Integer idUsuario) {

        List<Object[]> results = repository.listarCompraSorteoPorUsuario(idUsuario);
        List<CompraSorteoUsuario> comprasSorteoUsuario= new ArrayList<>();

        for (Object[] result : results){
            CompraSorteoUsuario compraSorteoUsuario = new CompraSorteoUsuario();
            compraSorteoUsuario.setIdSorteo((Integer) result[0]);
            compraSorteoUsuario.setIdCompraSorteo((Integer) result[1]);
            compraSorteoUsuario.setJuego((String) result[2]);
            compraSorteoUsuario.setFechaSorteo((Date) result[3]);
            compraSorteoUsuario.setFechaCompra((Date) result[4]);
            compraSorteoUsuario.setCatidadTickets((Integer) result[5]);
            compraSorteoUsuario.setEstadoPago((String) result[6]);
            compraSorteoUsuario.setPremio((String) result[7]);
            compraSorteoUsuario.setMonto(((BigDecimal) result[8]));
            comprasSorteoUsuario.add(compraSorteoUsuario);
        }

        return comprasSorteoUsuario;
    }

    @Override
    public List<CompraSorteoUsuario> listarCompraSorteoPorSorteo(Integer idSorteo) {
        List<Object[]> results = repository.listarCompraSorteoPorSorteo(idSorteo);
        List<CompraSorteoUsuario> comprasSorteoUsuario= new ArrayList<>();

        for (Object[] result : results){
            CompraSorteoUsuario compraSorteoUsuario = new CompraSorteoUsuario();
            compraSorteoUsuario.setIdSorteo((Integer) result[0]);
            compraSorteoUsuario.setIdCompraSorteo((Integer) result[1]);
            compraSorteoUsuario.setJuego((String) result[2]);
            compraSorteoUsuario.setFechaSorteo((Date) result[3]);
            compraSorteoUsuario.setFechaCompra((Date) result[4]);
            compraSorteoUsuario.setCatidadTickets((Integer) result[5]);
            compraSorteoUsuario.setEstadoPago((String) result[6]);
            compraSorteoUsuario.setPremio((String) result[7]);
            compraSorteoUsuario.setMonto(((BigDecimal) result[8]));
            comprasSorteoUsuario.add(compraSorteoUsuario);
        }

        return comprasSorteoUsuario;
    }

    @Override
    public Integer obtenerUltimoTicketSorteoVirtual(Integer idSorteo) {
        List<Object[]> results = repository.obtenerUltimoTicketSorteoVirtual(idSorteo);
        Integer ultimoTicket = 0;

            for (Object[] result : results){
                ultimoTicket = (Integer) result[0];
            }

            return ultimoTicket;

        }

    @Override
    public Integer obtenerLimiteInferior(Integer idSorteo) {
        List<Object[]> results = repository.obtenerLimiteInferior(idSorteo);
        Integer limiteInferior = 0;

        for (Object[] result : results){
            limiteInferior = (Integer) result[0];
        }

        return limiteInferior;
    }

    @Override
    @Transactional
    public void insertarCompraSorteo(CompraSorteo compraSorteo, String token) {

        Integer tipoTicket = compraSorteo.getIdTipoTicket();
        if(tipoTicket == 2) {compraSorteo.setPrimerTicketFisico(null);}

        Integer idCompraSorteo = insertarCompraSorteoRetorno(compraSorteo);

        Integer ultimoTicket = obtenerUltimoTicketSorteoVirtual(compraSorteo.getIdSorteo());

        if(ultimoTicket == 0){
            Integer limiteInferior = obtenerLimiteInferior(compraSorteo.getIdSorteo());
            ultimoTicket = limiteInferior;

        }

        // --> PASARELA DE PAGOS
        // --> Enviar Informacion a la pasarela de pagos
        // --> Retornar Informacion de la pasarela de pagos
        // --> Si la pasarela de pagos retorna PAGADO llenar valor con PAGADO;

        String estadoPago = "PAGADO";

        if(estadoPago.equals("PAGADO")){
            try{
                if(compraSorteo.getIdTipoTicket() == 2) {

                    TicketSorteoVirtual ticketSorteo = new TicketSorteoVirtual();

                    ticketSorteo.setTicketInicial(ultimoTicket+1);
                    ticketSorteo.setCantidadTickets(compraSorteo.getCantidadFinal());
                    ticketSorteo.setIdCompraSorteo(idCompraSorteo);
                    juegoClientRest.insertarTicketSorteoVirtual(ticketSorteo, token);
                    actualizarEstadoPagoEnCompraSorteo(idCompraSorteo);
                }else {

                    TicketSorteoFisico ticketSorteo = new TicketSorteoFisico();

                    ticketSorteo.setNumeroTicketInicial(compraSorteo.getPrimerTicketFisico());
                    ticketSorteo.setCantidadTickets(compraSorteo.getCantidadFinal());
                    ticketSorteo.setIdCompraSorteo(idCompraSorteo);

                    juegoClientRest.insertarTicketSorteoFisico(ticketSorteo, token);
                    actualizarEstadoPagoEnCompraSorteo(idCompraSorteo);
                }
            }catch (Exception e) {
                System.err.println("Error al insertar ticket sorteo: " + e.getMessage());
            }

        }
    }

    @Override
    //@Transactional
    public Integer insertarCompraSorteoRetorno(CompraSorteo compraSorteo) {

        Integer id = repository.insertarCompraSorteoRetorno(
                compraSorteo.getIdSorteo(),
                compraSorteo.getIdUsuario(),
                compraSorteo.getIdTipoUsuario(),
                compraSorteo.getCantidadInicial(),
                compraSorteo.getCantidadFinal(),
                compraSorteo.getIdTipoTicket(),
                compraSorteo.getPrimerTicketFisico(),
                compraSorteo.getMonto(),
                compraSorteo.getIdMetodoPago(),
                compraSorteo.getIdPack(),
                compraSorteo.getIdCodigoPromocional(),
                compraSorteo.getIdTipoDocumento(),
                compraSorteo.getDni(),
                compraSorteo.getTelefono(),
                compraSorteo.getEmail()
        );

        return id;
    }

    @Override
    @Transactional
    public void eliminarCompraSorteo(Integer idCompraSorteo) {
        repository.eliminarCompraSorteo(idCompraSorteo);
    }

    @Override
    @Transactional
    public void actualizarEstadoPagoEnCompraSorteo(Integer idCompraSorteo) {
        repository.actualizarEstadoPagoEnCompraSorteo(idCompraSorteo);
    }

}

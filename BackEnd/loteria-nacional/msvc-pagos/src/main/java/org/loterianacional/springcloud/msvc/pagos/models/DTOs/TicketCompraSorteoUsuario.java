package org.loterianacional.springcloud.msvc.pagos.models.DTOs;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.util.Date;

public class TicketCompraSorteoUsuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idTicketSorteo")
    private Integer idTicketSorteo;

    @Column(name = "idCompraSorteo")
    private Integer idCompraSorteo;

    @Column(name = "numeroTicket")
    private Integer numeroTicket;

    @Column(name = "fecha")
    private Date fecha;

    @Column(name = "activo")
    private Boolean activo;

}

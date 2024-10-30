package org.loterianacional.springcloud.msvc.models.DTOs;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class TicketSorteoCompra {

    private Integer idTicketSorteo;
    private Integer numeroTicket;
    private Integer idTipoResultado;
    private String resultado;
    private Date fecha;

}

package org.loterianacional.springcloud.msvc.juegos.models.DTOs;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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

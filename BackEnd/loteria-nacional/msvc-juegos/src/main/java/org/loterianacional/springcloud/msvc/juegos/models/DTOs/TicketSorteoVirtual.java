package org.loterianacional.springcloud.msvc.juegos.models.DTOs;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class TicketSorteoVirtual {

    private Integer ticketInicial;
    private Integer cantidadTickets;
    private Integer idCompraSorteo;

}

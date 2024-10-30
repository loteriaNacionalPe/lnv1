package org.loterianacional.springcloud.msvc.juegos.models.DTOs;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class TicketSorteoFisico {
    private Integer numeroTicketInicial;
    private Integer cantidadTickets;
    private Integer idCompraSorteo;
}

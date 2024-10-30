package org.loterianacional.springcloud.msvc.models.DTOs;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CompraSorteoUsuario {

    private Integer idCompraSorteo;
    private String juego;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date fechaSorteo;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date fechaCompra;
    private Integer catidadTickets;
    private String estadoPago;
    private String premio;
    private Double monto;
    private List<TicketSorteoCompra> tickets;

}

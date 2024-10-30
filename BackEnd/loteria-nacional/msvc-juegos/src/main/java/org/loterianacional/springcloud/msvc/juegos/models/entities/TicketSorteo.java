package org.loterianacional.springcloud.msvc.juegos.models.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name="juego.TicketSorteo")
public class TicketSorteo {

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

    @Column(name = "idTipoResultado")
    private Integer idTipoResultado;

    @Column(name = "activo")
    private Boolean activo;


}

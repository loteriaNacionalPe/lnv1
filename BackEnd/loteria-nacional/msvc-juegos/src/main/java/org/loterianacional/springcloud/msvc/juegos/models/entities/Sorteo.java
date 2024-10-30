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
@Table(name="juego.Sorteo")
public class Sorteo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSorteo")
    private Integer idSorteo;

    @Column(name = "idJuego")
    private Integer idJuego;

    @Column(name = "fechaSorteo")
    private Date fechaSorteo;

    @Column(name = "limiteInferiorOnline")
    private Integer limiteInferiorOnline;

    @Column(name = "ticketGanador")
    private String ticketGanador;

    @Column(name = "activo")
    private Boolean activo;

}

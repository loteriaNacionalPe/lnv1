package org.loterianacional.springcloud.msvc.juegos.models.entities;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name="juego.pack")
public class Pack {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPack")
    private Integer idPack;

    @Column(name = "idJuego")
    private Integer idJuego;

    @Column(name = "idSorteo")
    private Integer idSorteo;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "multiplicador")
    private BigDecimal multiplicador;

    @Column(name = "monto")
    private BigDecimal monto;

    @Column(name = "activo")
    private Boolean activo;

}

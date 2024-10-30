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
@Table(name="juego.codigoPromocional")
public class CodigoPromocional {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCodigoPromocional")
    private Integer idCodigoPromocional;

    @Column(name = "idInfluencer")
    private Integer idInfluencer;

    @Column(name = "codigo")
    private String codigo;

    @Column(name = "multiplicador")
    private BigDecimal multiplicador;

    @Column(name = "activo")
    private Boolean activo;

}

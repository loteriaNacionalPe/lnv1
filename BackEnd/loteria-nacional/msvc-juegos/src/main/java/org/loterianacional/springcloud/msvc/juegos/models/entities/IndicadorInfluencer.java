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
@Table(name="juego.indicadorInfluencer")
public class IndicadorInfluencer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idIndicadorInfluencer")
    private Integer idIndicadorInfluencer;

    @Column(name = "idCodigoPromocional")
    private Integer idCodigoPromocional;

    @Column(name = "fecha")
    private Date fecha;
}

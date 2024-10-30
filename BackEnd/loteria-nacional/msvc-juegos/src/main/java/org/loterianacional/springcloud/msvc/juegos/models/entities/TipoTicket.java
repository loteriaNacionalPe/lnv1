package org.loterianacional.springcloud.msvc.juegos.models.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name="juego.tipoTicket")
public class TipoTicket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idTipoTicket")
    private Integer idTipoTicket;
    @Column(name = "descripcion")
    private String descripcion;

}

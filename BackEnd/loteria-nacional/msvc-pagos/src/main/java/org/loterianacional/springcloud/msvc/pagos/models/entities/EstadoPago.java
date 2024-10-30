package org.loterianacional.springcloud.msvc.pagos.models.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name = "pago.estadoPago")
public class EstadoPago {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEstadoPago")
    private Integer idEstadoPago;

    @Column(name = "descripcion")
    private String descripcion;


}

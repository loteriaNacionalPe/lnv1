package org.loterianacional.springcloud.msvc.models.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name="usuario.paises")
public class Pais {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "code")
    private Integer code;

    @Column(name = "iso1")
    private String iso1;

    @Column(name = "iso2")
    private String iso2;

    @Column(name = "nombre")
    private String nombre;

}

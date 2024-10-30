package org.loterianacional.springcloud.msvc.models.entities;

import lombok.*;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class User {

    private int id;
    private String nombre;
    private String email;
}

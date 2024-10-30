package org.loterianacional.springcloud.msvc.models.DTOs;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class UsuarioLogin {

    private String nombreUsuario;
    private String contrasena;

}

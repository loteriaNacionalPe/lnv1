package org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs;

import lombok.*;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class UsuarioResponse {

    private int idUsuario;
    private String nombreUsuario;
    private String email;
    private String rol;
}

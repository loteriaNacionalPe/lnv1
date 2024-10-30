package org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class UsuarioLogin {

    private String email;
    private String contrasena;

}

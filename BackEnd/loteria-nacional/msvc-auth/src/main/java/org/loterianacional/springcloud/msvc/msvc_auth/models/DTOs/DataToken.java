package org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class DataToken {

    private String access_token;
    private UsuarioResponse usuario;

}

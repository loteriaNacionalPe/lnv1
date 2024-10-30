package org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class ResponseLogin {

    private Integer numeroDeErrores;
    private String mensaje;

}

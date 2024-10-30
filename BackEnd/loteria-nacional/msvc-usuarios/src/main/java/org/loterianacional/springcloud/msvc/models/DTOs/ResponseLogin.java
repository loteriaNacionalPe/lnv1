package org.loterianacional.springcloud.msvc.models.DTOs;

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

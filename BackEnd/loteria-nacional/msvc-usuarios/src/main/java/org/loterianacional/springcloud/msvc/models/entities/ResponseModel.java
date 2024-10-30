package org.loterianacional.springcloud.msvc.models.entities;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class ResponseModel {

    private Data data;
    private boolean ok;

}

package org.loterianacional.springcloud.msvc.models.entities;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Data {

    private String access_token;
    private User user;

}

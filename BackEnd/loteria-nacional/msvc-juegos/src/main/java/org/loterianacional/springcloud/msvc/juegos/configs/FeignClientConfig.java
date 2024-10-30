package org.loterianacional.springcloud.msvc.juegos.configs;

import feign.Request;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//@Configuration
public class FeignClientConfig {

    @Bean
    public Request.Options requestOptions() {
        return new Request.Options(5000, 30000); // 5 segundos de tiempo de conexión, 30 segundos de tiempo de lectura
    }
}
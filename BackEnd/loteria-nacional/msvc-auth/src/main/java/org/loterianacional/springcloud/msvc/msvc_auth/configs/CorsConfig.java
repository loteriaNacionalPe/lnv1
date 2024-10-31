package org.loterianacional.springcloud.msvc.msvc_auth.configs;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {


    @Override
    public void addCorsMappings(CorsRegistry registry) {

        registry.addMapping("/api/auth/**")
                .allowedOrigins("http://localhost:3000")
                //.allowedOrigins("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("Authorization", "Content-Type", "Origin", "Accept")
                .allowCredentials(false)
                .maxAge(3600);

        registry.addMapping("/api/user/**")
                .allowedOrigins("http://localhost:3000")
                //.allowedOrigins("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("Authorization", "Content-Type", "Origin", "Accept")
                .allowCredentials(false)
                .maxAge(3600);

    }

}

package org.loterianacional.springcloud.msvc.juegos.clients;

import feign.FeignException;
import org.loterianacional.springcloud.msvc.juegos.configs.FeignClientConfig;
import org.loterianacional.springcloud.msvc.juegos.models.DTOs.CompraSorteoUsuario;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;

@FeignClient(name = "msvc-pagos", url = "localhost:8003")
//@FeignClient(name = "msvc-pagos", url = "msvc-pagos:8003")
//@FeignClient(name = "msvc-pagos", url = "host.docker.internal:8003")
public interface PagoClientRest {

    @GetMapping("/api/pagos/user/compraSorteo/sorteos/usuario")
    public List<CompraSorteoUsuario> listarCompraSorteoPorUsuario(@RequestParam("idUsuario")  Integer idUsuario, @RequestHeader("Authorization") String token);

    default List<CompraSorteoUsuario> listarCompraSorteoPorUsuarioFallback(Integer idUsuario, FeignException e) {
        if (e.status() == 404) {
            return Collections.emptyList();
        }
        throw e;
    }

}

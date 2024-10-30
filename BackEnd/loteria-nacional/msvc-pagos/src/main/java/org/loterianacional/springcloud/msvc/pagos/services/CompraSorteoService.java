package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.DTOs.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.pagos.models.entities.CompraSorteo;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CompraSorteoService {

    List<CompraSorteoUsuario> listarCompraSorteoPorUsuario(Integer idUsuario);

    List<CompraSorteoUsuario> listarCompraSorteoPorSorteo(Integer idSorteo);

    Integer obtenerUltimoTicketSorteoVirtual(Integer idSorteo);

    Integer obtenerLimiteInferior(Integer idSorteo);

    void insertarCompraSorteo(CompraSorteo compraSorteo,String token);
    Integer insertarCompraSorteoRetorno(CompraSorteo compraSorteo);

    void eliminarCompraSorteo(Integer idCompraSorteo);

    void actualizarEstadoPagoEnCompraSorteo(Integer idCompraSorteo);

}

package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.entities.MetodoPago;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MetodoPagoService {

    List<MetodoPago> listarMetodoPago();

    List<MetodoPago> listarMetodoPagoPorId(Integer idMetodoPago);

}

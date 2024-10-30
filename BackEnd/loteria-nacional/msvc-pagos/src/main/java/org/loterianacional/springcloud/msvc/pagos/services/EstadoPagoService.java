package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.entities.EstadoPago;

import java.util.List;

public interface EstadoPagoService {

    List<EstadoPago> listarEstadoPago();

    List<EstadoPago> listarEstadoPagoPorId(Integer idEstadoPago);

}

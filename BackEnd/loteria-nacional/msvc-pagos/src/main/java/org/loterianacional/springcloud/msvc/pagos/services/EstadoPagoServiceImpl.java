package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.entities.EstadoPago;
import org.loterianacional.springcloud.msvc.pagos.repositories.EstadoPagoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EstadoPagoServiceImpl implements EstadoPagoService {

    @Autowired
    private EstadoPagoRepository repository;


    @Override
    public List<EstadoPago> listarEstadoPago() {
        List<Object[]> results = repository.listarEstadoPago();
        List<EstadoPago> estadosPago = new ArrayList<>();

        for(Object [] result : results){
            EstadoPago estadoPago = new EstadoPago();

            estadoPago.setIdEstadoPago((Integer) result[0]);
            estadoPago.setDescripcion((String) result[1]);

            estadosPago.add(estadoPago);
        }

        return estadosPago;
    }

    @Override
    public List<EstadoPago> listarEstadoPagoPorId(Integer idEstadoPago) {
        List<Object[]> results = repository.listarEstadoPagoPorId(idEstadoPago);
        List<EstadoPago> estadosPago = new ArrayList<>();

        for(Object [] result : results){
            EstadoPago estadoPago = new EstadoPago();

            estadoPago.setIdEstadoPago((Integer) result[0]);
            estadoPago.setDescripcion((String) result[1]);

            estadosPago.add(estadoPago);
        }

        return estadosPago;
    }
}

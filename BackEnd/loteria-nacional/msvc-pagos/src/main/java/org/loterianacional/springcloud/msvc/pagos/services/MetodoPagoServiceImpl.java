package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.entities.EstadoPago;
import org.loterianacional.springcloud.msvc.pagos.models.entities.MetodoPago;
import org.loterianacional.springcloud.msvc.pagos.repositories.MetodoPagoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MetodoPagoServiceImpl implements MetodoPagoService {

    @Autowired
    private MetodoPagoRepository repository;

    @Override
    public List<MetodoPago> listarMetodoPago() {
        List<Object[]> results = repository.listarMetodoPago();
        List<MetodoPago> metodosPago = new ArrayList<>();

        for(Object [] result : results){
            MetodoPago metodoPago = new MetodoPago();

            metodoPago.setIdMetodoPago((Integer) result[0]);
            metodoPago.setDescripcion((String) result[1]);
            metodoPago.setActivo((Boolean) result[2]);

            metodosPago.add(metodoPago);
        }

        return metodosPago;
    }

    @Override
    public List<MetodoPago> listarMetodoPagoPorId(Integer idMetodoPago) {
        List<Object[]> results = repository.listarMetodoPagoPorId(idMetodoPago);
        List<MetodoPago> metodosPago = new ArrayList<>();

        for(Object [] result : results){
            MetodoPago metodoPago = new MetodoPago();

            metodoPago.setIdMetodoPago((Integer) result[0]);
            metodoPago.setDescripcion((String) result[1]);
            metodoPago.setActivo((Boolean) result[2]);

            metodosPago.add(metodoPago);
        }

        return metodosPago;
    }
}

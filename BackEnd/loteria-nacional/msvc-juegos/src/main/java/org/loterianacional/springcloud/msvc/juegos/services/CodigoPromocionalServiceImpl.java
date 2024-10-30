package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.CodigoPromocional;
import org.loterianacional.springcloud.msvc.juegos.repositories.CodigoPromocionalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class CodigoPromocionalServiceImpl implements CodigoPromocionalService {

    @Autowired
    private CodigoPromocionalRepository repository;

    @Override
    @Transactional
    public void insertarCodigoPromocional(CodigoPromocional codigoPromocional) {
        repository.insertarCodigoPromocional(codigoPromocional.getIdInfluencer(), codigoPromocional.getCodigo(), codigoPromocional.getMultiplicador());
    }

    @Override
    @Transactional
    public void actualizarCodigoPromocional(Integer idCodigoPromocional, CodigoPromocional codigoPromocional) {
        repository.actualizarCodigoPromocional(idCodigoPromocional, codigoPromocional.getIdInfluencer(), codigoPromocional.getCodigo(), codigoPromocional.getMultiplicador());
    }

    @Override
    public List<CodigoPromocional> listarCodigoPromocional() {
        List<Object[]> results = repository.listarCodigoPromocional();
        List<CodigoPromocional> codigoPromocionals = new ArrayList<>();

        for (Object[] result : results) {
            CodigoPromocional codigoPromocional = new CodigoPromocional();

            codigoPromocional.setIdCodigoPromocional((Integer) result[0]);
            codigoPromocional.setIdInfluencer((Integer) result[1]);
            codigoPromocional.setCodigo((String) result[2]);
            codigoPromocional.setMultiplicador((BigDecimal) result[3]);
            codigoPromocional.setActivo((Boolean) result[4]);

            codigoPromocionals.add(codigoPromocional);
        }

        return codigoPromocionals;
    }

    @Override
    public List<CodigoPromocional> listarCodigoPromocionalPorId(Integer idCodigoPromocional) {
        List<Object[]> results = repository.listarCodigoPromocionalPorId(idCodigoPromocional);
        List<CodigoPromocional> codigoPromocionals = new ArrayList<>();

        for (Object[] result : results) {
            CodigoPromocional codigoPromocional = new CodigoPromocional();

            codigoPromocional.setIdCodigoPromocional((Integer) result[0]);
            codigoPromocional.setIdInfluencer((Integer) result[1]);
            codigoPromocional.setCodigo((String) result[2]);
            codigoPromocional.setMultiplicador((BigDecimal) result[3]);
            codigoPromocional.setActivo((Boolean) result[4]);

            codigoPromocionals.add(codigoPromocional);
        }

        return codigoPromocionals;
    }

    @Override
    public List<CodigoPromocional> listarCodigoPromocionalPorInfluencer(Integer idInfluencer) {
        List<Object[]> results = repository.listarCodigoPromocionalPorInfluencer(idInfluencer);
        List<CodigoPromocional> codigoPromocionals = new ArrayList<>();

        for (Object[] result : results) {
            CodigoPromocional codigoPromocional = new CodigoPromocional();

            codigoPromocional.setIdCodigoPromocional((Integer) result[0]);
            codigoPromocional.setIdInfluencer((Integer) result[1]);
            codigoPromocional.setCodigo((String) result[2]);
            codigoPromocional.setMultiplicador((BigDecimal) result[3]);
            codigoPromocional.setActivo((Boolean) result[4]);

            codigoPromocionals.add(codigoPromocional);
        }

        return codigoPromocionals;
    }

    @Override
    @Transactional
    public void eliminarCodigoPromocional(Integer isCodigoPromocional) {
        repository.eliminarCodigoPromocional(isCodigoPromocional);
    }

}

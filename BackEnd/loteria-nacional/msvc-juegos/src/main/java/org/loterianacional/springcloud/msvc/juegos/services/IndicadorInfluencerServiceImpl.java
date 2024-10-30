package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.IndicadorInfluencer;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.loterianacional.springcloud.msvc.juegos.repositories.IndicadorInfluencerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class IndicadorInfluencerServiceImpl implements IndicadorInfluencerService {

    @Autowired
    private IndicadorInfluencerRepository repository;

    @Override
    @Transactional
    public void insertarIndicadorInfluencer(IndicadorInfluencer indicadorInfluencer) {
        repository.insertarIndicadorInfluencer(indicadorInfluencer.getIdCodigoPromocional());
    }

    @Override
    public List<IndicadorInfluencer> listarIndicadorInfluencer() {
        List<Object[]> results = repository.listarIndicadorInfluencer();
        List<IndicadorInfluencer> indicadores = new ArrayList<>();

        for (Object[] result : results) {
            IndicadorInfluencer indicador = new IndicadorInfluencer();

            indicador.setIdIndicadorInfluencer((Integer) result[0]);
            indicador.setIdCodigoPromocional((Integer) result[1]);
            indicador.setFecha((Date) result[2]);

            indicadores.add(indicador);
        }

        return indicadores;
    }

    @Override
    public List<IndicadorInfluencer> listarIndicadorInfluencerPorCodigoPromocional(Integer idCodigoPromocional) {
        List<Object[]> results = repository.listarIndicadorInfluencerPorCodigoPromocional(idCodigoPromocional);
        List<IndicadorInfluencer> indicadores = new ArrayList<>();

        for (Object[] result : results) {
            IndicadorInfluencer indicador = new IndicadorInfluencer();

            indicador.setIdIndicadorInfluencer((Integer) result[0]);
            indicador.setIdCodigoPromocional((Integer) result[1]);
            indicador.setFecha((Date) result[2]);

            indicadores.add(indicador);
        }

        return indicadores;
    }
}

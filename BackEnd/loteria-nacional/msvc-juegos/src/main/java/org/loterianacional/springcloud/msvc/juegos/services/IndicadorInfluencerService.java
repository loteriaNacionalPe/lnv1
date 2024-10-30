package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.IndicadorInfluencer;

import java.util.List;


public interface IndicadorInfluencerService {

    void insertarIndicadorInfluencer(IndicadorInfluencer indicadorInfluencer);
    List<IndicadorInfluencer> listarIndicadorInfluencer();
    List<IndicadorInfluencer> listarIndicadorInfluencerPorCodigoPromocional(Integer idCodigoPromocional);

}

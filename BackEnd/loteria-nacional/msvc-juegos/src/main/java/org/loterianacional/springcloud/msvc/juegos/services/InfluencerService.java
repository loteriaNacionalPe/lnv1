package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Influencer;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;

import java.util.List;

public interface InfluencerService {

    void insertarInfluencer (Influencer influencer);
    void actualizarInfluencer (Integer idInfluencer, Influencer influencer);
    List<Influencer> listarInfluencers();
    List<Influencer> listarInfluencerPorId(Integer idInfluencer);
    void eliminarInfluencer(Integer idInfluencer);

}

package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Influencer;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;
import org.loterianacional.springcloud.msvc.juegos.repositories.InfluencerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class InfluencerServiceImpl implements InfluencerService {

    @Autowired
    private InfluencerRepository repository;

    @Override
    @Transactional
    public void insertarInfluencer(Influencer influencer) {
        repository.insertarInfluencer(influencer.getDescripcion());
    }

    @Override
    @Transactional
    public void actualizarInfluencer(Integer idInfluencer, Influencer influencer) {
        repository.actualizarInfluencer(idInfluencer, influencer.getDescripcion());
    }

    @Override
    public List<Influencer> listarInfluencers() {
        List<Object[]> results = repository.listarInfluencers();
        List<Influencer> influencers = new ArrayList<>();

        for (Object[] result : results) {
            Influencer influencer = new Influencer();

            influencer.setIdInfluencer((Integer) result[0]);
            influencer.setDescripcion((String) result[1]);
            influencer.setActivo((Boolean) result[2]);

            influencers.add(influencer);
        }

        return influencers;
    }

    @Override
    public List<Influencer> listarInfluencerPorId(Integer idInfluencer) {
        List<Object[]> results = repository.listarInfluencerPorId(idInfluencer);
        List<Influencer> influencers = new ArrayList<>();

        for (Object[] result : results) {
            Influencer influencer = new Influencer();

            influencer.setIdInfluencer((Integer) result[0]);
            influencer.setDescripcion((String) result[1]);
            influencer.setActivo((Boolean) result[2]);

            influencers.add(influencer);
        }

        return influencers;
    }

    @Override
    @Transactional
    public void eliminarInfluencer(Integer idInfluencer) {
        repository.eliminarInfluencer(idInfluencer);
    }
}

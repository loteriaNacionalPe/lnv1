package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;
import org.loterianacional.springcloud.msvc.juegos.repositories.PackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class PackServiceImpl implements PackService {

    @Autowired
    private PackRepository repository;

    @Override
    @Transactional
    public void insertarPack(Pack pack) {
        repository.insertarPack(pack.getIdJuego(),
                pack.getIdSorteo(),
                pack.getDescripcion(),
                pack.getMultiplicador(),
                pack.getMonto());
    }

    @Override
    @Transactional
    public void actualizarPack(Integer idPack, Pack pack) {
        repository.actualizarPack(idPack,
                pack.getIdJuego(),
                pack.getIdSorteo(),
                pack.getDescripcion(),
                pack.getMultiplicador(),
                pack.getMonto());
    }

    @Override
    public List<Pack> listarPacks() {
        List<Object[]> results = repository.listarPacks();
        List<Pack> packs = new ArrayList<>();

        for (Object[] result : results) {
            Pack pack = new Pack();

            pack.setIdPack((Integer) result[0]);
            pack.setIdJuego((Integer) result[1]);
            pack.setIdSorteo((Integer) result[2]);
            pack.setDescripcion((String) result[3]);
            pack.setMultiplicador((BigDecimal) result[4]);
            pack.setMonto((BigDecimal) result[5]);
            pack.setActivo((Boolean) result[6]);

            packs.add(pack);
        }

        return packs;
    }

    @Override
    public List<Pack> listarPackPorId(Integer idPack) {
        List<Object[]> results = repository.listarPackPorId(idPack);
        List<Pack> packs = new ArrayList<>();

        for (Object[] result : results) {
            Pack pack = new Pack();

            pack.setIdPack((Integer) result[0]);
            pack.setIdJuego((Integer) result[1]);
            pack.setIdSorteo((Integer) result[2]);
            pack.setDescripcion((String) result[3]);
            pack.setMultiplicador((BigDecimal) result[4]);
            pack.setMonto((BigDecimal) result[5]);
            pack.setActivo((Boolean) result[6]);

            packs.add(pack);
        }

        return packs;
    }

    @Override
    public List<Pack> listarPackPorJuego(Integer idJuego) {
        List<Object[]> results = repository.listarPackPorJuego(idJuego);
        List<Pack> packs = new ArrayList<>();

        for (Object[] result : results) {
            Pack pack = new Pack();

            pack.setIdPack((Integer) result[0]);
            pack.setIdJuego((Integer) result[1]);
            pack.setIdSorteo((Integer) result[2]);
            pack.setDescripcion((String) result[3]);
            pack.setMultiplicador((BigDecimal) result[4]);
            pack.setMonto((BigDecimal) result[5]);
            pack.setActivo((Boolean) result[6]);

            packs.add(pack);
        }

        return packs;
    }

    @Override
    public List<Pack> listarPackPorSorteo(Integer idSorteo) {
        List<Object[]> results = repository.listarPackPorSorteo(idSorteo);
        List<Pack> packs = new ArrayList<>();

        for (Object[] result : results) {
            Pack pack = new Pack();

            pack.setIdPack((Integer) result[0]);
            pack.setIdJuego((Integer) result[1]);
            pack.setIdSorteo((Integer) result[2]);
            pack.setDescripcion((String) result[3]);
            pack.setMultiplicador((BigDecimal) result[4]);
            pack.setMonto((BigDecimal) result[5]);
            pack.setActivo((Boolean) result[6]);

            packs.add(pack);
        }

        return packs;
    }

    @Override
    @Transactional
    public void eliminarPack(Integer idPack) {
        repository.eliminarPack(idPack);
    }



}

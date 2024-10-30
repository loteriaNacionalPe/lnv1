package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;

import java.util.List;

public interface PackService {

    void insertarPack (Pack pack);
    void actualizarPack (Integer idPack, Pack pack);
    List<Pack> listarPacks();
    List<Pack> listarPackPorId(Integer idPack);

    List<Pack> listarPackPorJuego(Integer idJuego);

    List<Pack> listarPackPorSorteo(Integer idSorteo);
    void eliminarPack(Integer idPack);

}

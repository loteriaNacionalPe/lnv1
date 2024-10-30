package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.CodigoPromocional;

import java.util.List;

public interface CodigoPromocionalService {

    void insertarCodigoPromocional (CodigoPromocional codigoPromocional);
    void actualizarCodigoPromocional (Integer idCodigoPromocional, CodigoPromocional codigoPromocional);
    List<CodigoPromocional> listarCodigoPromocional();
    List<CodigoPromocional> listarCodigoPromocionalPorId(Integer idCodigoPromocional);
    List<CodigoPromocional> listarCodigoPromocionalPorInfluencer(Integer idInfluencer);
    void eliminarCodigoPromocional(Integer isCodigoPromocional);

}

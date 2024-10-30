package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;

import java.util.List;

public interface JuegoService {
    void insertarJuego(Juego juego);
    void actualizarJuego(Integer idJuego, Juego juego);
    void eliminarJuego(Integer idJuego);

    List<Juego> listarJuegos();
    List<Juego> listarJuegoPorId(Integer idJuego);

}

package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.loterianacional.springcloud.msvc.juegos.repositories.JuegoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class JuegoServiceImpl implements  JuegoService{

    @Autowired
    private JuegoRepository repository;

    @Override
    @Transactional
    public void insertarJuego(Juego juego) {
        repository.insertarJuego(juego.getNombre(),
                juego.getDescripcion(),
                juego.getPrecio());
    }

    @Override
    @Transactional
    public void actualizarJuego(Integer idJuego, Juego juego) {
        repository.actualizarJuego(idJuego,
                juego.getNombre(),
                juego.getDescripcion(),
                juego.getPrecio());
    }

    @Override
    @Transactional
    public void eliminarJuego(Integer idJuego) {
        repository.eliminarJuego(idJuego);
    }

    @Override
    public List<Juego> listarJuegos() {
        List<Object[]> results = repository.listarJuegos();
        List<Juego> juegos = new ArrayList<>();

        for (Object[] result : results) {
            Juego juego = new Juego();

            juego.setIdJuego((Integer) result[0]);
            juego.setNombre((String) result[1]);
            juego.setDescripcion((String) result[2]);
            juego.setPrecio((BigDecimal) result[3]);
            juego.setActivo((Boolean) result[4]);

            juegos.add(juego);
        }

        return juegos;
    }

    @Override
    public List<Juego> listarJuegoPorId(Integer idJuego) {
        List<Object[]> results = repository.listarJuegoPorId(idJuego);
        List<Juego> juegos = new ArrayList<>();

        for (Object[] result : results) {
            Juego juego = new Juego();

            juego.setIdJuego((Integer) result[0]);
            juego.setNombre((String) result[1]);
            juego.setDescripcion((String) result[2]);
            juego.setPrecio((BigDecimal) result[3]);
            juego.setActivo((Boolean) result[4]);

            juegos.add(juego);
        }

        return juegos;
    }
}

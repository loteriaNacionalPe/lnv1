package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Repository
public interface JuegoRepository extends JpaRepository<Juego,Integer> {


    @Modifying
    @Query(value = "EXEC juego.spCrearJuegoNuevo " +
            ":nombre, " +
            ":descripcion, " +
            ":precio",nativeQuery = true)
    void insertarJuego(@Param("nombre") String nombre,
                         @Param("descripcion") String descripcion,
                         @Param("precio") BigDecimal precio
    );

    @Modifying
    @Query(value = "EXEC juego.spActualizarJuego " +
            ":idJuego, " +
            ":nombre, " +
            ":descripcion, " +
            ":precio",nativeQuery = true)
    void actualizarJuego(@Param("idJuego") Integer idJuego,
                        @Param("nombre") String nombre,
                        @Param("descripcion") String descripcion,
                        @Param("precio") BigDecimal precio
    );

    @Modifying
    @Query(value = "EXEC juego.spDesactivarJuego :idJuego",nativeQuery = true)
    void eliminarJuego(@Param("idJuego") Integer idJuego);

    @Query(value = "EXEC juego.spListarJuego",nativeQuery = true)
    List<Object[]> listarJuegos();

    @Query(value = "EXEC juego.spListarJuegoPorId :idJuego",nativeQuery = true)
    List<Object[]> listarJuegoPorId(@Param("idJuego") Integer idJuego);

}

package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Pack;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.List;

public interface PackRepository extends JpaRepository<Pack, Integer> {

    @Modifying
    @Query(value = "EXEC juego.spCrearNuevoPack " +
            ":idJuego, " +
            ":idSorteo, " +
            ":descripcion, " +
            ":multiplicador, " +
            ":monto ",nativeQuery = true)
    void insertarPack(@Param("idJuego") Integer idJuego,
                      @Param("idSorteo") Integer idSorteo,
                        @Param("descripcion") String descripcion,
                        @Param("multiplicador") BigDecimal multiplicador,
                        @Param("monto") BigDecimal monto
    );

    @Modifying
    @Query(value = "EXEC juego.spActualizarPack " +
            ":idPack, " +
            ":idJuego, " +
            ":idSorteo, " +
            ":descripcion, " +
            ":multiplicador, " +
            ":monto ",nativeQuery = true)
    void actualizarPack(@Param("idPack") Integer idPack,
                        @Param("idJuego") Integer idJuego,
                        @Param("idSorteo") Integer idSorteo,
                        @Param("descripcion") String descripcion,
                        @Param("multiplicador") BigDecimal multiplicador,
                        @Param("monto") BigDecimal monto
    );

    @Modifying
    @Query(value = "EXEC juego.spDesactivarPack " +
            ":idPack ",nativeQuery = true)
    void eliminarPack(@Param("idPack") Integer idPack);

    @Query(value = "EXEC juego.spListarPack",nativeQuery = true)
    List<Object[]> listarPacks();

    @Query(value = "EXEC juego.spListarPackPorId :idPack",nativeQuery = true)
    List<Object[]> listarPackPorId(@Param("idPack") Integer idPack);

    @Query(value = "EXEC juego.spListarPackPorJuego :idJuego",nativeQuery = true)
    List<Object[]> listarPackPorJuego(@Param("idJuego") Integer idJuego);

    @Query(value = "EXEC juego.spListarPackPorSorteo :idSorteo",nativeQuery = true)
    List<Object[]> listarPackPorSorteo(@Param("idSorteo") Integer idSorteo);

}

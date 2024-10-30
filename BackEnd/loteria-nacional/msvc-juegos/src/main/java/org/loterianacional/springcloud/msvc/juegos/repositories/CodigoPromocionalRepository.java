package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.CodigoPromocional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface CodigoPromocionalRepository extends JpaRepository<CodigoPromocional, Integer> {

    @Modifying
    @Query(value = "EXEC juego.spCrearNuevoCodigoPromocional " +
            ":idInfluencer, " +
            ":codigo, " +
            ":multiplicador ",nativeQuery = true)
    void insertarCodigoPromocional(@Param("idInfluencer") Integer idInfluencer,
                      @Param("codigo") String codigo,
                      @Param("multiplicador") BigDecimal multiplicador
    );

    @Modifying
    @Query(value = "EXEC juego.spActualizarCodigoPromocional " +
            ":idCodigoPromocional, " +
            ":idInfluencer, " +
            ":codigo, " +
            ":multiplicador ",nativeQuery = true)
    void actualizarCodigoPromocional(@Param("idCodigoPromocional") Integer idCodigoPromocional,
                        @Param("idInfluencer") Integer idInfluencer,
                        @Param("codigo") String codigo,
                        @Param("multiplicador") BigDecimal multiplicador
    );

    @Modifying
    @Query(value = "EXEC juego.spDesactivarCodigoPromocional " +
            ":idCodigoPromocional ",nativeQuery = true)
    void eliminarCodigoPromocional(@Param("idCodigoPromocional") Integer idCodigoPromocional);

    @Query(value = "EXEC juego.spListarCodigoPromocional",nativeQuery = true)
    List<Object[]> listarCodigoPromocional();

    @Query(value = "EXEC juego.spListarCodigoPromocionalPorId :idCodigoPromocional",nativeQuery = true)
    List<Object[]> listarCodigoPromocionalPorId(@Param("idCodigoPromocional") Integer idCodigoPromocional);

    @Query(value = "EXEC juego.spListarCodigoPromocionalPorInfluencer :idInfluencer",nativeQuery = true)
    List<Object[]> listarCodigoPromocionalPorInfluencer(@Param("idInfluencer") Integer idInfluencer);
}

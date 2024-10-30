package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.IndicadorInfluencer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IndicadorInfluencerRepository extends JpaRepository<IndicadorInfluencer, Integer> {

    @Modifying
    @Query(value = "EXEC juego.spCrearIndicadorInfluencer " +
            ":idCodigoPromocional " ,nativeQuery = true)
    void insertarIndicadorInfluencer(@Param("idCodigoPromocional") Integer idCodigoPromocional
    );

    @Query(value = "EXEC juego.spListarIndicadorInfluencer",nativeQuery = true)
    List<Object[]> listarIndicadorInfluencer();

    @Query(value = "EXEC juego.spListarIndicadorInfluencerPorCodigoPromocional :idCodigoPromocional",nativeQuery = true)
    List<Object[]> listarIndicadorInfluencerPorCodigoPromocional(@Param("idCodigoPromocional") Integer idCodigoPromocional);

}

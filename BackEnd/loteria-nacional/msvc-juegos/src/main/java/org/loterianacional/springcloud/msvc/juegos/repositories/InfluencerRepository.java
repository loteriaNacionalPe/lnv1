package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Influencer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.hibernate.type.descriptor.converter.spi.JpaAttributeConverter;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfluencerRepository extends JpaRepository<Influencer, Integer> {

    @Modifying
    @Query(value = "EXEC juego.spCrearNuevoInfluencer " +
            ":descripcion " ,nativeQuery = true)
    void insertarInfluencer(@Param("descripcion") String descripcion
    );

    @Modifying
    @Query(value = "EXEC juego.spActualizarInfluencer " +
            ":idInfluencer, " +
            ":descripcion " ,nativeQuery = true)
    void actualizarInfluencer(@Param("idInfluencer") Integer idInfluencer,
                        @Param("descripcion") String descripcion
    );

    @Modifying
    @Query(value = "EXEC juego.spDesactivarInfluencer " +
            ":idInfluencer ",nativeQuery = true)
    void eliminarInfluencer(@Param("idInfluencer") Integer idInfluencer);

    @Query(value = "EXEC juego.spListarInfluencer",nativeQuery = true)
    List<Object[]> listarInfluencers();

    @Query(value = "EXEC juego.spListarInfluencerPorId :idInfluencer",nativeQuery = true)
    List<Object[]> listarInfluencerPorId(@Param("idInfluencer") Integer idInfluencer);

}

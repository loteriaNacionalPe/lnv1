package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TipoTicket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TipoTicketRepository extends JpaRepository<TipoTicket,Integer> {

    @Query(value = "EXEC juego.spListarTipoTicket",nativeQuery = true)
    List<Object[]> listarTipoTicket();

    @Query(value = "EXEC juego.spListarTipoTicketPorId :idTipoTicket",nativeQuery = true)
    List<Object[]> listarTipoTicketPorId(@Param("idTipoTicket") Integer idTipoTicket);


    @Modifying
    @Query(value = "EXEC juego.spActualizarTipoTicket " +
            ":idTipoTicket, " +
            ":descripcion " ,nativeQuery = true)
    void actualizarTipoTicket(@Param("idTipoTicket") Integer idTipoTicket,
                        @Param("descripcion") String descripcion
    );

}

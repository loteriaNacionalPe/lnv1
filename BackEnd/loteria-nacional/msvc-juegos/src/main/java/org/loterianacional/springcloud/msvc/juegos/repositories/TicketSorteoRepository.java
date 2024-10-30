package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface TicketSorteoRepository extends JpaRepository<TicketSorteo, Integer> {


    @Modifying
    @Query(value = "EXEC juego.spCrearNuevoTicketSorteoVirtual " +
            ":ticketInicial, " +
            ":cantidadTickets, " +
            ":idCompraSorteo ",nativeQuery = true)
    void insertarTicketSorteoVirtual(
                        @Param("ticketInicial") Integer ticketInicial,
                        @Param("cantidadTickets") Integer cantidadTickets,
                        @Param("idCompraSorteo") Integer idCompraSorteo
    );

    @Modifying
    @Query(value = "EXEC juego.spCrearNuevoTicketSorteoFisico " +
            ":numeroTicketInicial , " +
            ":cantidadTickets, " +
            ":idCompraSorteo ",nativeQuery = true)
    void insertarTicketSorteoFisico(
            @Param("numeroTicketInicial") Integer numeroTicketInicial ,
            @Param("cantidadTickets") Integer cantidadTickets,
            @Param("idCompraSorteo") Integer idCompraSorteo
    );

    @Query(value = "EXEC juego.spListarTicketSorteoPorCompraSorteo :idCompraSorteo",nativeQuery = true)
    List<Object[]> listarTicketSorteoPorCompraSorteo(@Param("idCompraSorteo") Integer idCompraSorteo);


}

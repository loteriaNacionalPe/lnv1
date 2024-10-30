package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Repository
public interface SorteoRepository extends JpaRepository<Sorteo, Integer> {

    @Modifying
    @Query(value = "EXEC juego.spCrearSorteo " +
            ":idJuego, " +
            ":fechaSorteo, " +
            ":limiteInferiorOnline ",nativeQuery = true)
    void insertarSorteo(@Param("idJuego") Integer idJuego,
                       @Param("fechaSorteo") Date fechaSorteo,
                       @Param("limiteInferiorOnline") Integer limiteInferiorOnline
    );

    @Modifying
    @Query(value = "EXEC juego.spActualizarSorteo " +
            ":idSorteo, " +
            ":fechaSorteo, " +
            ":limiteInferiorOnline ",nativeQuery = true)
    void actualizarSorteo(@Param("idSorteo") Integer idSorteo,
                        @Param("fechaSorteo") Date fechaSorteo,
                        @Param("limiteInferiorOnline") Integer limiteInferiorOnline
    );

    @Modifying
    @Query(value = "EXEC juego.spIngresarTicketGanadorSorteo " +
            ":idSorteo, " +
            ":ticketGanador ",nativeQuery = true)
    void actualizarTicketGanadorSorteo(@Param("idSorteo") Integer idSorteo,
                          @Param("ticketGanador") String ticketGanador
    );

    @Modifying
    @Query(value = "EXEC juego.spDesactivarSorteo " +
            ":idSorteo ",nativeQuery = true)
    void eliminarSorteo(@Param("idSorteo") Integer idSorteo);


    @Query(value = "EXEC juego.spListarSorteos",nativeQuery = true)
    List<Object[]> listarSorteos();
    @Query(value = "EXEC juego.spListarSorteoPorId :idSorteo",nativeQuery = true)
    List<Object[]> listarSorteoPorId(@Param("idSorteo") Integer idSorteo);

    @Query(value = "EXEC juego.spListarSorteoPorJuego :idJuego",nativeQuery = true)
    List<Object[]> listarSorteoPorJuego(@Param("idJuego") Integer idSorteo);

}

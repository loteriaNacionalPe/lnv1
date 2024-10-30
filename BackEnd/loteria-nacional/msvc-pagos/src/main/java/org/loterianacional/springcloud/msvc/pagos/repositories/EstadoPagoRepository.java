package org.loterianacional.springcloud.msvc.pagos.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.pagos.models.entities.EstadoPago;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EstadoPagoRepository extends JpaRepository<EstadoPago, Integer> {
    @Query(value = "EXEC pago.spListarEstadoPago",nativeQuery = true)
    List<Object[]> listarEstadoPago();
    @Query(value = "EXEC pago.spListarEstadoPagoPorId :idEstadoPago",nativeQuery = true)
    List<Object[]> listarEstadoPagoPorId(@Param("idEstadoPago") Integer idEstadoPago);
}

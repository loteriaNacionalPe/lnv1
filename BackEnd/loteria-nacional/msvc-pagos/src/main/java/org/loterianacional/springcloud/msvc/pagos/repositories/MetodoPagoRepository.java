package org.loterianacional.springcloud.msvc.pagos.repositories;

import org.loterianacional.springcloud.msvc.pagos.models.entities.MetodoPago;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MetodoPagoRepository extends JpaRepository<MetodoPago, Integer> {
    @Query(value = "EXEC pago.spListarMetodoPago",nativeQuery = true)
    List<Object[]> listarMetodoPago();
    @Query(value = "EXEC pago.spListarMetodoPagoPorId :idMetodoPago",nativeQuery = true)
    List<Object[]> listarMetodoPagoPorId(@Param("idMetodoPago") Integer idMetodoPago);
}

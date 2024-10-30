package org.loterianacional.springcloud.msvc.repositories;

import org.loterianacional.springcloud.msvc.models.entities.Pais;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaisRepository extends JpaRepository<Pais, Integer> {

    @Query(value = "EXEC usuario.spListarPaises",nativeQuery = true)
    List<Object[]> listarPaises();

}

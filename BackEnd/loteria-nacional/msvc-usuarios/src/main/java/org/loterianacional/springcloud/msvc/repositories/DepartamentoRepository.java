package org.loterianacional.springcloud.msvc.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.models.entities.Departamento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartamentoRepository extends JpaRepository<Departamento, String> {

    @Query(value = "EXEC usuario.spListarDepartamentos",nativeQuery = true)
    List<Object[]> listarDepartamentos();

}

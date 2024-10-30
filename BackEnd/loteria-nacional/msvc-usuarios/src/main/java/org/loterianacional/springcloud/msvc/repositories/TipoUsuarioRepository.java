package org.loterianacional.springcloud.msvc.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.models.entities.TipoUsuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TipoUsuarioRepository extends JpaRepository<TipoUsuario, Integer> {

    @Query(value = "EXEC usuario.spListarTipoUsuario",nativeQuery = true)
    List<Object[]> listarTipoUsuario();

    @Query(value = "EXEC usuario.spListarTipoUsuarioPorId :id",nativeQuery = true)
    List<Object[]>  listarTipoUsuarioPorId(Integer id);

}

package org.loterianacional.springcloud.msvc.msvc_auth.repositories;

import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    @Query(value = "EXEC usuario.spListarUsuarioPorId :idUsuario",nativeQuery = true)
    List<Object[]> listarUsuarioPorId(@Param("idUsuario") Integer idUsuario);

    @Query(value = "EXEC usuario.spListarTipoUsuarioPorId :id",nativeQuery = true)
    List<Object[]> listarTipoUsuarioPorId(@Param("id") Integer id);

}

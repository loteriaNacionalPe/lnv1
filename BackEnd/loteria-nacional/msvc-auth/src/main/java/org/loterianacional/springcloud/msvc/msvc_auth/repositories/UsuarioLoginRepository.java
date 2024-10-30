package org.loterianacional.springcloud.msvc.msvc_auth.repositories;

import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UsuarioLoginRepository extends JpaRepository<Usuario, Long> {

    @Query(value = "autenticacion.spListarUsuarioPorEmail :email",nativeQuery = true)
    List<Object[]> buscarUsuarioPorEmail(@Param("email") String email);

    @Modifying
    @Query(value = "EXEC usuario.spCrearUsuarioNuevoUSER " +
            ":nombreUsuario, " +
            ":nombres, " +
            ":apellidos, " +
            ":dni, " +
            ":fechaNacimiento, " +
            ":idTipoDocumento, " +
            ":email, " +
            ":direccion, " +
            ":idPais, " +
            ":idDepartamento, " +
            ":idProvincia, " +
            ":idDistrito, " +
            ":codigoPostal, " +
            ":contrasena, " +
            ":celular ",nativeQuery = true)
    void insertarUsuarioTipoUSER(@Param("nombreUsuario") String nombreUsuario,
                         @Param("nombres") String nombres,
                         @Param("apellidos") String apellidos,
                         @Param("dni") String dni,
                         @Param("fechaNacimiento") Date fechaNacimiento,
                         @Param("idTipoDocumento") Integer idTipoDocumento,
                         @Param("email") String email,
                         @Param("direccion") String direccion,
                         @Param("idPais") Integer idPais,
                         @Param("idDepartamento") String idDepartamento,
                         @Param("idProvincia") String idProvincia,
                         @Param("idDistrito") String idDistrito,
                         @Param("codigoPostal") String codigoPostal,
                         @Param("contrasena") String contrasena,
                         @Param("celular") String celular
    );

    @Query(value = "EXEC usuario.spVerificarExistenciaNombreUsuario :nombreUsuario",nativeQuery = true)
    Integer nombreUsuarioExistente(@Param("nombreUsuario") String nombreUsuario);
    @Query(value = "EXEC usuario.spVerificarExistenciaDni :dni",nativeQuery = true)
    Integer dniExistente(@Param("dni") String dni);

    @Query(value = "EXEC usuario.spVerificarExistenciaEmail :email",nativeQuery = true)
    Integer correoExistente(@Param("email") String email);

}

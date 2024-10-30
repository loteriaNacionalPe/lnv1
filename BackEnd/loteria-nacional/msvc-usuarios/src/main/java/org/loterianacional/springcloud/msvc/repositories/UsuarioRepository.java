package org.loterianacional.springcloud.msvc.repositories;

import org.springframework.data.repository.query.Param;
import org.loterianacional.springcloud.msvc.models.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

    @Modifying
    @Query(value = "EXEC usuario.spCrearUsuarioNuevo " +
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
            ":celular, " +
            ":idTipoUsuario",nativeQuery = true)
    void insertarUsuario(@Param("nombreUsuario") String nombreUsuario,
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
                                   @Param("celular") String celular,
                                   @Param("idTipoUsuario") Integer idTipoUsuario
                                   );

    @Modifying
    @Query(value = "EXEC usuario.spActualizarUsuario " +
            ":dni, " +
            ":direccion, " +
            ":idPais, " +
            ":idDepartamento, " +
            ":idProvincia, " +
            ":idDistrito, " +
            ":codigoPostal, " +
            ":celular ",nativeQuery = true)
    void actualizarUsuario(@Param("dni") String dni,
                           @Param("direccion") String direccion,
                           @Param("idPais") Integer idPais,
                           @Param("idDepartamento") String idDepartamento,
                           @Param("idProvincia") String idProvincia,
                           @Param("idDistrito") String idDistrito,
                           @Param("codigoPostal") String codigoPostal,
                           @Param("celular") String celular
    );

    @Modifying
    @Query(value = "EXEC usuario.spDesactivarUsuario :dni",nativeQuery = true)
    void eliminarUsuario(@Param("dni") String dni);

    @Query(value = "EXEC usuario.spListarUsuario",nativeQuery = true)
    List<Object[]> listarUsuarios();

    @Query(value = "EXEC usuario.spListarUsuarioPorDni :dni",nativeQuery = true)
    List<Object[]> listarUsuarioPorDni(@Param("dni") String dni);


    @Query(value = "EXEC usuario.spVerificarExistenciaNombreUsuario :nombreUsuario",nativeQuery = true)
    Integer nombreUsuarioExistente(@Param("nombreUsuario") String nombreUsuario);
    @Query(value = "EXEC usuario.spVerificarExistenciaDni :dni",nativeQuery = true)
    Integer dniExistente(@Param("dni") String dni);

    @Query(value = "EXEC usuario.spVerificarExistenciaEmail :email",nativeQuery = true)
    Integer correoExistente(@Param("email") String email);

    //Integer loggeo(String usuario, String contrasena);

}

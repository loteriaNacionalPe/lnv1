package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.ResponseModel;
import org.loterianacional.springcloud.msvc.models.entities.Usuario;

import java.util.List;

public interface UsuarioService {

    void insertarUsuario(Usuario usuario);
    void actualizarUsuario(String dni, Usuario usuario);
    void eliminarUsuario(String dni);
    List<Usuario> listarUsuarios();
    List<Usuario> listarUsuarioPorDni(String dni);
    Integer nombreUsuarioExistente(String nombreUsuario);
    Integer dniExistente(String dni);
    Integer correoExistente(String email);

    //MSVC
    //List<TicketSorteo> listarTicketSorteoPorDni(String dni);//msvc

    ResponseModel loggeo(Usuario usuario);
    ResponseModel detalles();

}

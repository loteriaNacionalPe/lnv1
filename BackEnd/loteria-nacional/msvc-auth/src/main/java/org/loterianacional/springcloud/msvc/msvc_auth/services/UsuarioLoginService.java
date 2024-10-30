package org.loterianacional.springcloud.msvc.msvc_auth.services;


import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.Usuario;

import java.util.List;

public interface UsuarioLoginService {

    List<Usuario> buscarUsuarioPorEmail(String email);
    void insertarUsuarioTipoUSER(Usuario usuario);

    Integer nombreUsuarioExistente(String nombreUsuario);
    Integer dniExistente(String dni);
    Integer correoExistente(String email);

}

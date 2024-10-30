package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.TipoUsuario;

import java.util.List;

public interface TipoUsuarioService {

    List<TipoUsuario> listarTipoUsuario();
    List<TipoUsuario>  listarTipoUsuarioPorId(Integer id);

}

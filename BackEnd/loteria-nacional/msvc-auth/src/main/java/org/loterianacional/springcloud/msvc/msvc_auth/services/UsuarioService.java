package org.loterianacional.springcloud.msvc.msvc_auth.services;

import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.UsuarioResponseDetail;
import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.TipoUsuario;

import java.util.List;

public interface UsuarioService {

    List<UsuarioResponseDetail> listarUsuariosPorId(Integer idUsuario);

    List<TipoUsuario>  listarTipoUsuarioPorId(Integer id);

}

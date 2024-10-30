package org.loterianacional.springcloud.msvc.msvc_auth.services;

import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.DataToken;
import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.UsuarioLogin;

import java.util.HashMap;

public interface AuthService {

    DataToken login (UsuarioLogin usuarioLogin);

}

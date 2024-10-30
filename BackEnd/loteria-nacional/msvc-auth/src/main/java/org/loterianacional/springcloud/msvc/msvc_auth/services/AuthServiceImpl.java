package org.loterianacional.springcloud.msvc.msvc_auth.services;

import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.DataToken;
import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.UsuarioLogin;
import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.UsuarioResponse;
import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.TipoUsuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.Usuario;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private UsuarioLoginService usuarioLoginService;

    @Autowired
    private JWTUtilityService jwtUtilityService;

    @Autowired
    private UsuarioService usuarioService;

    @Override
    @Transactional
    public DataToken login(UsuarioLogin usuarioLogin) {

        DataToken dataResponse = new DataToken();
        UsuarioResponse usuarioResponse = new UsuarioResponse();

        try {
            List<Usuario> usuario = usuarioLoginService.buscarUsuarioPorEmail(usuarioLogin.getEmail());

            if(usuario.isEmpty()){
                return null;
            }
            Boolean match = verifyPassword(usuarioLogin.getContrasena(), usuario.get(0).getContrasena());
            if(match) {
                usuarioResponse.setIdUsuario(usuario.get(0).getIdUsuario());
                usuarioResponse.setNombreUsuario(usuario.get(0).getNombreUsuario());
                usuarioResponse.setEmail(usuario.get(0).getEmail());
                List<TipoUsuario> rol = usuarioService.listarTipoUsuarioPorId(usuario.get(0).getIdTipoUsuario());
                usuarioResponse.setRol(rol.get(0).getDescripcion());
                dataResponse.setAccess_token(jwtUtilityService.generateJWT(usuario.get(0).getIdUsuario(),rol.get(0).getDescripcion()));
                dataResponse.setUsuario(usuarioResponse);
            }
            else {
                //jwt.put("mensaje", "Error de autenticación.");
                return null;
            }
        }catch (Exception e) {

            return null;
        }
        return dataResponse;

    }

    private Boolean verifyPassword(String contrasenaIngresada, String contrasenaBD) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.matches(contrasenaIngresada, contrasenaBD);

    }

}

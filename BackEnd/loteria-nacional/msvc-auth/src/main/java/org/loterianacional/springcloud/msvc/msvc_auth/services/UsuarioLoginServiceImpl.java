package org.loterianacional.springcloud.msvc.msvc_auth.services;

import org.loterianacional.springcloud.msvc.msvc_auth.repositories.UsuarioLoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.Usuario;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UsuarioLoginServiceImpl implements UsuarioLoginService {

    @Autowired
    private UsuarioLoginRepository repository;

    @Override
    public List<Usuario> buscarUsuarioPorEmail(String email) {
        List<Object[]> results = repository.buscarUsuarioPorEmail(email);
        List<Usuario> usuarios = new ArrayList<>();

        for (Object[] result : results) {
            Usuario usuario = new Usuario();

            usuario.setIdUsuario((Integer) result[0]);
            usuario.setNombreUsuario((String) result[1]);
            usuario.setNombres((String) result[2]);
            usuario.setApellidos((String) result[3]);
            usuario.setDni((String) result[4]);
            usuario.setFechaNacimiento((Date) result[5]);
            usuario.setIdTipoDocumento((Integer) result[6]);
            usuario.setEmail((String) result[7]);
            usuario.setDireccion((String) result[8]);
            usuario.setIdPais((Integer) result[9]);
            usuario.setIdDepartamento((String) result[10]);
            usuario.setIdProvincia((String) result[11]);
            usuario.setIdDistrito((String) result[12]);
            usuario.setCodigoPostal((String) result[13]);
            usuario.setContrasena((String) result[14]);
            usuario.setCelular((String) result[15]);
            usuario.setIdTipoUsuario((Integer) result[16]);
            usuario.setActivo((Boolean) result[17]);

            usuarios.add(usuario);
        }
        return usuarios;
    }

    @Override
    @Transactional
    public void insertarUsuarioTipoUSER(Usuario usuario) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
        usuario.setContrasena(encoder.encode(usuario.getContrasena()));

        repository.insertarUsuarioTipoUSER(
                usuario.getNombreUsuario(),
                usuario.getNombres(),
                usuario.getApellidos(),
                usuario.getDni(),
                usuario.getFechaNacimiento(),
                usuario.getIdTipoDocumento(),
                usuario.getEmail(),
                usuario.getDireccion(),
                usuario.getIdPais(),
                usuario.getIdDepartamento(),
                usuario.getIdProvincia(),
                usuario.getIdDistrito(),
                usuario.getCodigoPostal(),
                usuario.getContrasena(),
                usuario.getCelular());

    }

    @Override
    public Integer nombreUsuarioExistente(String nombreUsuario) {
        Integer nombreUsuarioExist = repository.nombreUsuarioExistente(nombreUsuario);
        return nombreUsuarioExist;
    }

    @Override
    public Integer dniExistente(String dni) {
        Integer dniExist = repository.dniExistente(dni);
        return dniExist;
    }

    @Override
    public Integer correoExistente(String email) {
        Integer correoExist = repository.correoExistente(email);
        return correoExist;
    }


}

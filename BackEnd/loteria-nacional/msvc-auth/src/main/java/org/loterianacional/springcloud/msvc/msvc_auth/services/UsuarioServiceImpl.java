package org.loterianacional.springcloud.msvc.msvc_auth.services;

import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.UsuarioResponseDetail;
import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.TipoUsuario;
import org.loterianacional.springcloud.msvc.msvc_auth.repositories.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioRepository repository;

    @Override
    public List<UsuarioResponseDetail> listarUsuariosPorId(Integer idUsuario) {
        List<Object[]> results = repository.listarUsuarioPorId(idUsuario);
        List<UsuarioResponseDetail> usuarios = new ArrayList<>();

        for (Object[] result : results) {
            UsuarioResponseDetail usuario = new UsuarioResponseDetail();

            usuario.setIdUsuario((Integer) result[0]);
            usuario.setNombreUsuario((String) result[1]);
            usuario.setNombres((String) result[2]);
            usuario.setApellidos((String) result[3]);
            usuario.setDni((String) result[4]);
            usuario.setFechaNacimiento((Date) result[5]);
            usuario.setIdTipoDocumento((Integer) result[6]);
            usuario.setTipoDocumento((String) result[7]);
            usuario.setEmail((String) result[8]);
            usuario.setDireccion((String) result[9]);
            usuario.setIdPais((Integer) result[10]);
            usuario.setPais((String) result[11]);
            usuario.setIdDepartamento((String) result[12]);
            usuario.setDepartamento((String) result[13]);
            usuario.setIdProvincia((String) result[14]);
            usuario.setProvincia((String) result[15]);
            usuario.setIdDistrito((String) result[16]);
            usuario.setDistrito((String) result[17]);
            usuario.setCodigoPostal((String) result[18]);
            usuario.setCelular((String) result[19]);
            usuario.setIdTipoUsuario((Integer) result[20]);
            usuario.setTipoUsuario((String) result[21]);

            usuarios.add(usuario);
        }

        return usuarios;
    }

    @Override
    public List<TipoUsuario> listarTipoUsuarioPorId(Integer id) {
        List<Object[]> results = repository.listarTipoUsuarioPorId(id);
        List<TipoUsuario> tipoUsuarios = new ArrayList<>();

        for(Object [] result : results){
            TipoUsuario tipoUsuario = new TipoUsuario();

            tipoUsuario.setIdTipoUsuario((Integer) result[0]);
            tipoUsuario.setDescripcion((String) result[1]);

            tipoUsuarios.add(tipoUsuario);
        }

        return tipoUsuarios;
    }


}

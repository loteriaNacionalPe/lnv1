package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.TipoUsuario;
import org.loterianacional.springcloud.msvc.repositories.TipoUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.List;

@Service
public class TipoUsuarioServiceImpl implements TipoUsuarioService{

    @Autowired
    private TipoUsuarioRepository repository;

    @Override
    public List<TipoUsuario> listarTipoUsuario() {
        List<Object[]> results = repository.listarTipoUsuario();
        List<TipoUsuario> tipoUsuarios = new ArrayList<>();

        for(Object [] result : results){
            TipoUsuario tipoUsuario = new TipoUsuario();

            tipoUsuario.setIdTipoUsuario((Integer) result[0]);
            tipoUsuario.setDescripcion((String) result[1]);

            tipoUsuarios.add(tipoUsuario);
        }

        return tipoUsuarios;
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

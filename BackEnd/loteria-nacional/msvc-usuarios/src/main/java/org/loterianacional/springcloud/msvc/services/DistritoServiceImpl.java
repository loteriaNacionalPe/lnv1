package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.Distrito;
import org.loterianacional.springcloud.msvc.models.entities.Provincia;
import org.loterianacional.springcloud.msvc.repositories.DistritoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DistritoServiceImpl implements DistritoService {

    @Autowired
    private DistritoRepository repository;

    @Override
    public List<Distrito> listarDistritoPorId(String idDepartamento, String idProvincia) {
        List<Object[]> results = repository.listarDistritoPorId(idDepartamento,idProvincia);
        List<Distrito> distritos = new ArrayList<>();

        for (Object [] result : results){
            Distrito distrito = new Distrito();

            distrito.setId((String) result[0]);
            distrito.setName((String) result[1]);
            distrito.setDepartmentId((String) result[2]);
            distrito.setProvinceId((String) result[3]);

            distritos.add(distrito);
        }

        return distritos;
    }
}

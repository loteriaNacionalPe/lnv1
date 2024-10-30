package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.Provincia;

import org.loterianacional.springcloud.msvc.repositories.ProvinciaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProvinciaServiceImpl implements ProvinciaService{

    @Autowired
    private ProvinciaRepository repository;

    @Override
    public List<Provincia> listarProvinciaPorId(String idDepartamento) {

        List<Object[]> results = repository.listarProvinciaPorId(idDepartamento);
        List<Provincia> provincias = new ArrayList<>();

        for (Object [] result : results){
            Provincia provincia = new Provincia();

            provincia.setId((String) result[0]);
            provincia.setName((String) result[1]);
            provincia.setDepartmentId((String) result[2]);

            provincias.add(provincia);
        }

        return provincias;
    }
}

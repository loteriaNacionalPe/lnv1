package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.Departamento;
import org.loterianacional.springcloud.msvc.models.entities.Pais;
import org.loterianacional.springcloud.msvc.repositories.PaisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PaisServiceImpl implements  PaisService {

    @Autowired
    private PaisRepository repository;

    @Override
    public List<Pais> listarPaises() {
        List<Object[]> results = repository.listarPaises();
        List<Pais> paises = new ArrayList<>();

        for(Object [] result : results){
            Pais pais = new Pais();

            pais.setId((Integer) result[0]);
            pais.setCode((Integer) result[1]);
            pais.setIso1((String) result[2]);
            pais.setIso2((String) result[3]);
            pais.setNombre((String) result[4]);

            paises.add(pais);
        }

        return paises;
    }
}

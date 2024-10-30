package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.Departamento;
import org.loterianacional.springcloud.msvc.repositories.DepartamentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DepartamentoServiceImpl implements DepartamentoService {

    @Autowired
    private DepartamentoRepository repository;

    @Override
    public List<Departamento> listarDepartamentos() {
        List<Object[]> results = repository.listarDepartamentos();
        List<Departamento> departamentos = new ArrayList<>();

        for(Object [] result : results){
            Departamento departamento = new Departamento();

            departamento.setId((String) result[0]);
            departamento.setName((String) result[1]);

            departamentos.add(departamento);
        }

        return departamentos;
    }

}

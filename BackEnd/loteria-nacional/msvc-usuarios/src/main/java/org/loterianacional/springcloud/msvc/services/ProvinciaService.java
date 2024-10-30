package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.Provincia;

import java.util.List;

public interface ProvinciaService {

    List<Provincia> listarProvinciaPorId(String idDepartamento);

}

package org.loterianacional.springcloud.msvc.services;


import org.loterianacional.springcloud.msvc.models.entities.Distrito;

import java.util.List;

public interface DistritoService {

    List<Distrito> listarDistritoPorId(String idDepartamento, String idProvincia);

}

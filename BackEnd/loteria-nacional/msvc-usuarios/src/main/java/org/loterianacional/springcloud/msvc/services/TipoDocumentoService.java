package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.TipoDocumento;

import java.util.List;

public interface TipoDocumentoService {

    List<TipoDocumento> listarTipoDocumento();

    List<TipoDocumento> listarTipoDocumentoPorId(Integer id);

}

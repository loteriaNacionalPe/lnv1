package org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class UsuarioResponseDetail {


    private Integer idUsuario;

    private String nombreUsuario;

    private String nombres;

    private String apellidos;

    private String dni;

    private Date fechaNacimiento;

    private Integer idTipoDocumento;

    private String tipoDocumento;

    private String email;

    private String direccion;

    private Integer idPais;

    private String pais;

    private String idDepartamento;

    private String departamento;

    private String idProvincia;

    private String provincia;

    private String idDistrito;

    private String distrito;

    private String codigoPostal;

    private String celular;

    private Integer idTipoUsuario;

    private String tipoUsuario;
}


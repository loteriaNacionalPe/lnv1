package org.loterianacional.springcloud.msvc.models.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name="usuario.Usuario")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private Integer idUsuario;
    @NotBlank()
    @Column(name = "nombreUsuario")
    private String nombreUsuario;
    @NotBlank()
    @Column(name = "nombres")
    private String nombres;
    @NotBlank()
    @Column(name = "apellidos")
    private String apellidos;
    @NotBlank()
    @Column(name = "dni")
    private String dni;
    @Column(name = "fechaNacimiento")
    private Date fechaNacimiento;
    @Column(name = "idTipoDocumento", insertable = false, updatable = false)
    private Integer idTipoDocumento;
    @ManyToOne
    @JoinColumn(name = "idTipoDocumento")
    private TipoDocumento tipoDocumento;
    @NotBlank()
    @Email()
    @Column(name = "email")
    private String email;
    @NotBlank()
    @Column(name = "direccion")
    private String direccion;
    @Column(name = "idTipoPais")
    private Integer idPais;
    @NotBlank()
    @Column(name = "idDepartamento")
    private String idDepartamento;
    @NotBlank()
    @Column(name = "idProvincia")
    private String idProvincia;
    @NotBlank()
    @Column(name = "idDistrito")
    private String idDistrito;
    @NotBlank()
    @Column(name = "codigoPostal")
    private String codigoPostal;
    @NotBlank()
    @Column(name = "contrasena")
    private String contrasena;
    @NotBlank()
    @Column(name = "celular")
    private String celular;
    @Column(name = "idTipoUsuario", insertable = false, updatable = false)
    private Integer idTipoUsuario;
    @ManyToOne
    @JoinColumn(name = "idTipoUsuario")
    private TipoUsuario tipoUsuario;
    @Column(name = "activo")
    private Boolean activo;

}

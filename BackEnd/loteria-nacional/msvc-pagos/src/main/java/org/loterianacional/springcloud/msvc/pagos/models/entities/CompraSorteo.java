package org.loterianacional.springcloud.msvc.pagos.models.entities;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name = "pago.compraSorteo")
public class CompraSorteo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCompraSorteo")
    private Integer idCompraSorteo;

    @Column(name = "idSorteo")
    private Integer idSorteo;

    @Column(name = "idUsuario")
    private Integer idUsuario;

    @Column(name = "idTipoUsuario")
    private Integer idTipoUsuario;

    @Column(name = "fecha")
    private Date fecha;

    @Column(name = "cantidadInicial")
    private Integer cantidadInicial;

    @Column(name = "cantidadFinal")
    private Integer cantidadFinal;

    @Column(name = "idTipoTicket")
    private Integer idTipoTicket;

    @Column(name = "primerTicketFisico")
    private Integer primerTicketFisico;

    @Column(name = "monto")
    private BigDecimal monto;

    @Column(name = "idMetodoPago")
    private Integer idMetodoPago;

    @Column(name = "idPack")
    private Integer idPack;

    @Column(name = "idCodigoPromocional")
    private Integer idCodigoPromocional;

    @Column(name = "idTipoDocumento")
    private Integer idTipoDocumento;

    @Column(name = "dni")
    private String dni;

    @Column(name = "telefono")
    private String telefono;

    @Column(name = "email")
    private String email;

    @Column(name = "idTipoResultado")
    private Integer idTipoResultado;

    @Column(name = "idEstadoPago")
    private Integer idEstadoPago;

    @Column(name = "activo")
    private Boolean activo;

}

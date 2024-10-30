package org.loterianacional.springcloud.msvc.services;

import feign.FeignException;
import org.loterianacional.springcloud.msvc.clients.JuegoClientRest;
import org.loterianacional.springcloud.msvc.models.entities.*;
import org.loterianacional.springcloud.msvc.repositories.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;

@Service
public class UsuarioServiceImpl implements UsuarioService{

    @Autowired
    private UsuarioRepository repository;
    @Autowired
    private TipoDocumentoService tipoDocumentoService;
    @Autowired
    private TipoUsuarioService tipoUsuarioService;
    @Autowired
    private JuegoClientRest client;

    @Override
    @Transactional
    public void insertarUsuario(Usuario usuario) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
        usuario.setContrasena(encoder.encode(usuario.getContrasena()));

        repository.insertarUsuario(
                usuario.getNombreUsuario(),
                usuario.getNombres(),
                usuario.getApellidos(),
                usuario.getDni(),
                usuario.getFechaNacimiento(),
                usuario.getIdTipoDocumento(),
                usuario.getEmail(),
                usuario.getDireccion(),
                usuario.getIdPais(),
                usuario.getIdDepartamento(),
                usuario.getIdProvincia(),
                usuario.getIdDistrito(),
                usuario.getCodigoPostal(),
                usuario.getContrasena(),
                usuario.getCelular(),
                usuario.getIdTipoDocumento()
        );
    }

    @Override
    @Transactional
    public void actualizarUsuario(String dni, Usuario usuario) {
        repository.actualizarUsuario(dni,
                usuario.getDireccion(),
                usuario.getIdPais(),
                usuario.getIdDepartamento(),
                usuario.getIdProvincia(),
                usuario.getIdDistrito(),
                usuario.getCodigoPostal(),
                usuario.getCelular()
        );

    }

    @Override
    @Transactional
    public void eliminarUsuario(String dni) {
        repository.eliminarUsuario(dni);
    }

    @Override
    public List<Usuario> listarUsuarios() {
        List<Object[]> results = repository.listarUsuarios();
        List<Usuario> usuarios = new ArrayList<>();

        for (Object[] result : results) {
            Usuario usuario = new Usuario();

            usuario.setIdUsuario((Integer) result[0]);
            usuario.setNombreUsuario((String) result[1]);
            usuario.setNombres((String) result[2]);
            usuario.setApellidos((String) result[3]);
            usuario.setDni((String) result[4]);
            usuario.setFechaNacimiento((Date) result[5]);
            usuario.setIdTipoDocumento((Integer) result[6]);
            usuario.setTipoDocumento(tipoDocumentoService.listarTipoDocumentoPorId((Integer) result[6]).get(0));
            usuario.setEmail((String) result[7]);
            usuario.setDireccion((String) result[8]);
            usuario.setIdPais((Integer) result[9]);
            usuario.setIdDepartamento((String) result[10]);
            usuario.setIdProvincia((String) result[11]);
            usuario.setIdDistrito((String) result[12]);
            usuario.setCodigoPostal((String) result[13]);
            usuario.setContrasena((String) result[14]);
            usuario.setCelular((String) result[15]);
            usuario.setIdTipoUsuario((Integer) result[16]);
            usuario.setTipoUsuario(tipoUsuarioService.listarTipoUsuarioPorId((Integer) result[16]).get(0));
            usuario.setActivo((Boolean) result[17]);

            usuarios.add(usuario);
        }

        return usuarios;
    }

    @Override
    public List<Usuario> listarUsuarioPorDni(String dni) {
        List<Object[]> results = repository.listarUsuarioPorDni(dni);
        List<Usuario> usuarios = new ArrayList<>();

        for (Object[] result : results) {
            Usuario usuario = new Usuario();

            usuario.setIdUsuario((Integer) result[0]);
            usuario.setNombreUsuario((String) result[1]);
            usuario.setNombres((String) result[2]);
            usuario.setApellidos((String) result[3]);
            usuario.setDni((String) result[4]);
            usuario.setFechaNacimiento((Date) result[5]);
            usuario.setIdTipoDocumento((Integer) result[6]);
            usuario.setTipoDocumento(tipoDocumentoService.listarTipoDocumentoPorId((Integer) result[6]).get(0));
            usuario.setEmail((String) result[7]);
            usuario.setDireccion((String) result[8]);
            usuario.setIdPais((Integer) result[9]);
            usuario.setIdDepartamento((String) result[10]);
            usuario.setIdProvincia((String) result[11]);
            usuario.setIdDistrito((String) result[12]);
            usuario.setCodigoPostal((String) result[13]);
            usuario.setContrasena((String) result[14]);
            usuario.setCelular((String) result[15]);
            usuario.setIdTipoUsuario((Integer) result[16]);
            usuario.setTipoUsuario(tipoUsuarioService.listarTipoUsuarioPorId((Integer) result[16]).get(0));
            usuario.setActivo((Boolean) result[17]);

            usuarios.add(usuario);
        }

        return usuarios;
    }

    @Override
    public Integer nombreUsuarioExistente(String nombreUsuario) {
        Integer nombreUsuarioExist = repository.nombreUsuarioExistente(nombreUsuario);
        return nombreUsuarioExist;

    }

    @Override
    public Integer dniExistente(String dni) {
        Integer dniExist = repository.dniExistente(dni);
        return dniExist;
    }

    @Override
    public Integer correoExistente(String email) {
        Integer correoExist = repository.correoExistente(email);
        return correoExist;
    }

    @Override
    public ResponseModel loggeo(Usuario usuario) {
        String dniLocal = "98745632";
        String contrasenaLocal = "123456";

        String dniParam = usuario.getDni();
        String contrasenaParam = usuario.getContrasena();

        if(dniLocal.equals(dniParam) && contrasenaLocal.equals(contrasenaParam)){
            User user = new User(1, "Eduardo Tejada", "eduardotejada@mail.com");
            Data data = new Data("e183d1b1180f79c52f88f2a341ac887725a2cdbf", user);
            return new ResponseModel(data, true);
        }
        return null;
    }

    @Override
    public ResponseModel detalles() {
        User user = new User(1, "Eduardo Tejada", "eduardotejada@mail.com");
        Data data = new Data("e183d1b1180f79c52f88f2a341ac887725a2cdbf", user);
        return new ResponseModel(data, true);
    }

    //MSVC
    /*
    @Override
    public List<TicketSorteo> listarTicketSorteoPorDni(String dni) {
        try {
            return client.listarTicketSorteoPorDni(dni);
        } catch (FeignException e) {
            return client.listarTicketSorteoPorDniFallback(dni, e);
        }
    }*/


}

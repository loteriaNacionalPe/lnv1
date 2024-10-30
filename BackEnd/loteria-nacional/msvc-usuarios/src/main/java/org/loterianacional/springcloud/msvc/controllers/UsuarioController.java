package org.loterianacional.springcloud.msvc.controllers;

import jakarta.validation.Valid;
import org.loterianacional.springcloud.msvc.models.entities.ResponseModel;
import org.loterianacional.springcloud.msvc.models.entities.Usuario;
import org.loterianacional.springcloud.msvc.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api/usuarios/user")
public class UsuarioController {

    @Autowired
    private UsuarioService service;


    @PostMapping("/registroDeUsuario")
    public ResponseEntity<?> insertarUsuario (@Valid @RequestBody Usuario usuario, BindingResult result){

        Integer nombreUsuarioExist = service.nombreUsuarioExistente(usuario.getNombreUsuario());
        Integer emailExist = service.correoExistente(usuario.getEmail());
        Integer dniExist = service.dniExistente(usuario.getDni());

        if(result.hasErrors()){
            return validarInsertUpdate(result);
        }
        if(nombreUsuarioExist != 0)
        {
            return ResponseEntity.badRequest().body("El nombre de usuario ingresado ya se encuentra registrado.");
        }
        if(emailExist != 0)
        {
            return ResponseEntity.badRequest().body("El correo ingresado ya se encuentra registrado.");
        }
        if(dniExist != 0)
        {
            return ResponseEntity.badRequest().body("El dni ingresado ya se encuentra registrado.");
        }

        service.insertarUsuario(usuario);
        return ResponseEntity.ok("Se registró al usuario.");
    }

    @PutMapping("/actualizacionDeUsuario/{dni}")
    public ResponseEntity<?> actualizarUsuario (@PathVariable String dni, @RequestBody Usuario usuario, BindingResult result){

        service.actualizarUsuario(dni,usuario);
        return ResponseEntity.ok("Se actualizó al usuario.");
    }

    @DeleteMapping("/eliminacionDeUsuario/{dni}")
    public ResponseEntity<?> eliminarUsuario (@PathVariable String dni){
        service.eliminarUsuario(dni);
        return ResponseEntity.ok("Se eliminó al usuario.");
    }

    @GetMapping("/")
    public List<Usuario> listarUsuarios(){
        return service.listarUsuarios();
    }


    @GetMapping("/{dni}")
    public ResponseEntity<?> listarUsuarioPorDni(@PathVariable String dni) {
        List<Usuario> usuarios = service.listarUsuarioPorDni(dni);
        if (usuarios.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(usuarios);
    }

    @GetMapping("/authorized")
    public Map<String, Object> authorized(@RequestParam(name = "code") String code) {
        return Collections.singletonMap("code", code);
    }

    //VALIDACION DE USUARIOS
    private static ResponseEntity<Map<String, String>> validarInsertUpdate(BindingResult result) {
        Map<String, String> errores = new HashMap<>();
        result.getFieldErrors().forEach(err -> {
            errores.put(err.getField(), "El campo " + err.getField() + " " + err.getDefaultMessage());
        });
        return ResponseEntity.badRequest().body(errores);
    }


    //Simulacion Login
    @PostMapping("/loggeo")
    public ResponseEntity<ResponseModel> loggeo (@RequestBody Usuario usuario){

        ResponseModel result = service.loggeo(usuario);
        if(result == null){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/detalles")
    public ResponseEntity<ResponseModel> detalles (){

        ResponseModel result = service.detalles();
        if(result == null){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
        return ResponseEntity.ok(result);
    }

}

package org.loterianacional.springcloud.msvc.msvc_auth.controllers;

import jakarta.validation.Valid;
import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.DataToken;
import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.UsuarioLogin;
import org.loterianacional.springcloud.msvc.msvc_auth.models.entities.Usuario;
import org.loterianacional.springcloud.msvc.msvc_auth.services.AuthService;
import org.loterianacional.springcloud.msvc.msvc_auth.services.UsuarioLoginService;
import org.loterianacional.springcloud.msvc.msvc_auth.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @Autowired
    private UsuarioLoginService usuarioLoginService;
    @Autowired
    private UsuarioService service;


    @PostMapping("/registro")
    public ResponseEntity<?> insertarUsuarioTipoUSER (@Valid @RequestBody Usuario usuario, BindingResult result){

        Integer nombreUsuarioExist = usuarioLoginService.nombreUsuarioExistente(usuario.getNombreUsuario());
        Integer emailExist = usuarioLoginService.correoExistente(usuario.getEmail());
        Integer dniExist = usuarioLoginService.dniExistente(usuario.getDni());

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

        usuarioLoginService.insertarUsuarioTipoUSER(usuario);
        return ResponseEntity.ok("Se registró al usuario.");
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody UsuarioLogin usuarioLogin) {
        DataToken login = authService.login(usuarioLogin);
        if(login != null){
            return new ResponseEntity<>(login, HttpStatus.OK);
        }else
        {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Error de autenticación.");
        }
    }

    //VALIDACION DE USUARIOS
    private static ResponseEntity<Map<String, String>> validarInsertUpdate(BindingResult result) {
        Map<String, String> errores = new HashMap<>();
        result.getFieldErrors().forEach(err -> {
            errores.put(err.getField(), "El campo " + err.getField() + " " + err.getDefaultMessage());
        });
        return ResponseEntity.badRequest().body(errores);
    }


}

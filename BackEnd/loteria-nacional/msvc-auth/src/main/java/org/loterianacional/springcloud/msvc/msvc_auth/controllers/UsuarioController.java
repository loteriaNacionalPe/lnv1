package org.loterianacional.springcloud.msvc.msvc_auth.controllers;

import jakarta.servlet.http.HttpServletRequest;
import org.loterianacional.springcloud.msvc.msvc_auth.models.DTOs.UsuarioResponseDetail;
import org.loterianacional.springcloud.msvc.msvc_auth.services.JWTUtilityService;
import org.loterianacional.springcloud.msvc.msvc_auth.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/user")
public class UsuarioController {

    @Autowired
    private UsuarioService service;

    @Autowired
    private JWTUtilityService jwtUtilityService;

    //@PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/detalles")
    public List<UsuarioResponseDetail> listarUsuarios(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Integer idUsuario = jwtUtilityService.extractUserIdFromToken(token);
        return service.listarUsuariosPorId(idUsuario);
    }

}

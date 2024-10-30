package org.loterianacional.springcloud.msvc.msvc_auth.services;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jwt.JWTClaimsSet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.text.ParseException;

public interface JWTUtilityService {
    String generateJWT(Integer idUsuario, String rol) throws IOException, NoSuchAlgorithmException, InvalidKeySpecException, JOSEException;
    JWTClaimsSet parseJWT(String jwt) throws IOException, NoSuchAlgorithmException, InvalidKeySpecException, ParseException, JOSEException;
    Integer extractUserIdFromToken(String token);
    String extractRolesFromToken(String token);

}

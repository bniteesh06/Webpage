package com.glialiservices.backend.auth;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class JwtServiceTest {

    private final JwtService jwtService = new JwtService(
            "test-secret-key-for-unit-testing-only-1234567890",
            1800000,
            604800000
    );

    @Test
    void tokenRoundTrip_extractsCorrectEmail() {
        String token = jwtService.generateAccessToken("admin@glialiservices.com");
        assertEquals("admin@glialiservices.com", jwtService.extractEmail(token));
        assertTrue(jwtService.isTokenValid(token));
    }

    @Test
    void tamperedToken_isInvalid() {
        String token = jwtService.generateAccessToken("admin@glialiservices.com");
        String tampered = token.substring(0, token.length() - 5) + "aaaaa";
        assertFalse(jwtService.isTokenValid(tampered));
    }
}
package com.example.app;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class SimpleMathTest {

    @Test
    @DisplayName("Phép cộng hai số nguyên")
    void additionWorks() {
        assertEquals(5, 2 + 3);
    }

    @Test
    @DisplayName("Chuỗi không rỗng sau khi trim")
    void stringIsNotBlank() {
        String name = "  IT209 DevOps  ".trim();
        assertTrue(name.startsWith("IT209"));
        assertEquals(12, name.length());
    }
}

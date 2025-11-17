# Advance-Encryption-Standard
This project implements the Advanced Encryption Standard (AES) for secure data encryption and decryption. It includes key expansion, substitution, shift operations, and round transformations for AES-128. The repository demonstrates the complete workflow of AES, including algorithm logic, code implementation, and test examples.

[AES architecture](https://app.eraser.io/workspace/wYab68FXb0LOXP4tVFE7?origin=share)

# AES-128 Encryption & Decryption — SystemVerilog Implementation

This repository contains a complete **AES-128 encryption & decryption hardware design** implemented in **SystemVerilog**, fully verified using **Testbench**.  
The project includes core AES modules, testbenches, algorithm PDFs, and a clean directory structure.

---

## 📁 Project Structure

```text
├── reference-data/
│   ├── AES.pdf
│   ├── Project_Plan.pdf
│   ├── aes_1.pdf
│   ├── aes_2.pdf
│
├── src/
│   ├── AES_ENC_DEC_CODE/
│   │   ├── decryption_128.sv
│   │   ├── decryption_128_tb.sv
│   │   ├── encryption_128.sv
│   │   ├── encryption_128_tb.sv
│   ├── aes_complete_128_algo.sv
│   ├── decryption_tb_complete_128.sv
│   ├── encryption_tb_complete_128.sv
│
└── README.md
```

---

## 🔐 AES-128 Algorithm Overview

This project implements the full AES-128 pipeline:

- **SubBytes** (S-Box)
- **ShiftRows**
- **MixColumns**
- **AddRoundKey**
- **Key Expansion** (128-bit key schedule)
- **10-round architecture**
- Encryption and decryption modules
- Complete AES-128 combined algorithm
- **Verified using TestBench**

---

## 🖼️ AES Algorithm Diagram

![AES_ALGO](https://github.com/user-attachments/assets/4eed149c-2a58-4754-817f-e70ee3908c84)

---

## 🧪 Encryption Test Output

```text
==========================================
 AES-128 ENCRYPTION TEST
==========================================

Test 1: NIST FIPS-197 Standard Vector
  Plaintext:  00112233445566778899aabbccddeeff
  Key:        000102030405060708090a0b0c0d0e0f
  Ciphertext: 69c4e0d86a7b0430d8cdb78070b4c55a
  Expected:   69c4e0d86a7b0430d8cdb78070b4c55a
  Result: PASS

Test 2: All-Zero Vector
  Plaintext:  00000000000000000000000000000000
  Key:        00000000000000000000000000000000
  Ciphertext: 66e94bd4ef8a2c3b884cfa59ca342b2e
  Expected:   66e94bd4ef8a2c3b884cfa59ca342b2e
  Result: PASS

Test 3: Custom Vector
  Plaintext:  3243f6a8885a308d313198a2e0370734
  Key:        2b7e151628aed2a6abf7158809cf4f3c
  Ciphertext: 3925841d02dc09fbdc118597196a0b32

==========================================
 TEST SUMMARY
==========================================
  Total:  3
  Passed: 3
  Failed: 0

  ALL TESTS PASSED!
==========================================
```

---

## 🔓 Decryption Test Output

```text
==========================================
 AES-128 DECRYPTION TEST
==========================================

Test 1: NIST FIPS-197 Standard Vector
  Ciphertext: 69c4e0d86a7b0430d8cdb78070b4c55a
  Key:        000102030405060708090a0b0c0d0e0f
  Plaintext:  00112233445566778899aabbccddeeff
  Expected:   00112233445566778899aabbccddeeff
  Result: PASS

Test 2: All-Zero Vector
  Ciphertext: 66e94bd4ef8a2c3b884cfa59ca342b2e
  Key:        00000000000000000000000000000000
  Plaintext:  00000000000000000000000000000000
  Expected:   00000000000000000000000000000000
  Result: PASS

Test 3: Additional NIST Vector
  Ciphertext: 3ad77bb40d7a3660a89ecaf32466ef97
  Key:        2b7e151628aed2a6abf7158809cf4f3c
  Plaintext:  6bc1bee22e409f96e93d7e117393172a
  Expected:   6bc1bee22e409f96e93d7e117393172a
  Result: PASS

==========================================
 TEST SUMMARY
==========================================
  Total:  3
  Passed: 3
  Failed: 0

  ALL TESTS PASSED!
==========================================
```

---

---

## 📜 License
This project is open for educational use.

---

// tb_decrypt.sv - Testbench for AES-128 Decryption
`timescale 1ns / 1ps

module tb_decrypt;

reg [127:0] ciphertext;
reg [127:0] key;
wire [127:0] plaintext;
integer passed, failed;

aes_128_decrypt uut (
    .ciphertext(ciphertext),
    .key(key),
    .plaintext(plaintext)
);

initial begin
    passed = 0;
    failed = 0;
    
    $dumpfile("decrypt.vcd");
    $dumpvars(0, tb_decrypt);
    
    $display("");
    $display("==========================================");
    $display(" AES-128 DECRYPTION TEST");
    $display("==========================================");
    $display("");
    
    // Test 1: NIST FIPS-197 Vector
    $display("Test 1: NIST FIPS-197 Standard Vector");
    ciphertext = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
    key = 128'h000102030405060708090a0b0c0d0e0f;
    #100;
    
    $display("  Ciphertext: %h", ciphertext);
    $display("  Key:        %h", key);
    $display("  Plaintext:  %h", plaintext);
    $display("  Expected:   00112233445566778899aabbccddeeff");
    
    if (plaintext == 128'h00112233445566778899aabbccddeeff) begin
        $display("  Result: PASS");
        passed = passed + 1;
    end else begin
        $display("  Result: FAIL");
        failed = failed + 1;
    end
    $display("");
    
    // Test 2: All-Zero Vector
    $display("Test 2: All-Zero Vector");
    ciphertext = 128'h66e94bd4ef8a2c3b884cfa59ca342b2e;
    key = 128'h00000000000000000000000000000000;
    #100;
    
    $display("  Ciphertext: %h", ciphertext);
    $display("  Key:        %h", key);
    $display("  Plaintext:  %h", plaintext);
    $display("  Expected:   00000000000000000000000000000000");
    
    if (plaintext == 128'h00000000000000000000000000000000) begin
        $display("  Result: PASS");
        passed = passed + 1;
    end else begin
        $display("  Result: FAIL");
        failed = failed + 1;
    end
    $display("");
    
    // Test 3: Additional NIST Vector
    $display("Test 3: Additional NIST Vector");
    ciphertext = 128'h3ad77bb40d7a3660a89ecaf32466ef97;
    key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
    #100;
    
    $display("  Ciphertext: %h", ciphertext);
    $display("  Key:        %h", key);
    $display("  Plaintext:  %h", plaintext);
    $display("  Expected:   6bc1bee22e409f96e93d7e117393172a");
    
    if (plaintext == 128'h6bc1bee22e409f96e93d7e117393172a) begin
        $display("  Result: PASS");
        passed = passed + 1;
    end else begin
        $display("  Result: FAIL");
        failed = failed + 1;
    end
    $display("");
    
    // Summary
    $display("==========================================");
    $display(" TEST SUMMARY");
    $display("==========================================");
    $display("  Total:  %0d", passed + failed);
    $display("  Passed: %0d", passed);
    $display("  Failed: %0d", failed);
    
    if (failed == 0) begin
        $display("");
        $display("  ALL TESTS PASSED!");
    end
    
    $display("==========================================");
    $display("");
    
    $finish;
end

endmodule

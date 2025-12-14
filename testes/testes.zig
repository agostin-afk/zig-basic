// Importa a biblioteca padrão do Zig
const std = @import("std");

// Função que adiciona 1 a um número
pub fn addOne(n: i32) i32 {
    return n +% 1; // +% também é wrap operator
}

// Teste 1: testa casos básicos
test "casos básicos" {
    // expect verifica se a condição é verdadeira
    try std.testing.expect(addOne(41) == 42); // 41 + 1 = 42
    try std.testing.expect(addOne(0) == 1); // 0 + 1 = 1
    try std.testing.expect(addOne(-5) == -4); // -5 + 1 = -4
}

// Teste 2: testa quando o número é muito grande
test "número muito grande" {
    const maior = std.math.maxInt(i32); // Maior número possível do tipo i32

    // Quando soma 1 ao maior número, volta para o menor número
    // Isso se chama "overflow" ou "transbordamento"
    try std.testing.expect(addOne(maior) == std.math.minInt(i32));
}

pub fn main() void {
    std.debug.print("addOne(45) = {}\n", .{addOne(45)}); // Mostra 46
    std.debug.print("addOne(-10) = {}\n", .{addOne(-10)}); // Mostra -9

}

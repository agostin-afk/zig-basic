const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // Vetores básicos
    const vec = @Vector(4, i32){ 1, 2, 3, 4 };
    const vec2 = @Vector(4, i32){ 5, 6, 7, 8 };

    print("Vetor 1: {any}\n", .{vec});
    print("Vetor 2: {any}\n", .{vec2});

    // Operações básicas
    print("Soma: {any}\n", .{vec + vec2});
    print("Subtração: {any}\n", .{vec2 - vec});
    print("Multiplicação: {any}\n", .{vec * vec2});

    // Operações com escalar (precisa de @splat)
    print("vec + 10: {any}\n", .{vec + @as(@Vector(4, i32), @splat(10))});

    // Acesso a elementos
    print("vec[0] = {}\n", .{vec[0]});
    print("vec[1] = {}\n", .{vec[1]});

    // Redução (vetor -> escalar)
    const soma = @reduce(.Add, vec);
    const maximo = @reduce(.Max, vec);
    print("Soma total: {}\n", .{soma});
    print("Máximo: {}\n", .{maximo});

    // Comparação
    const maior_que = vec > vec2;
    print("vec > vec2? {any}\n", .{maior_que});
}

const std = @import("std");
const print = std.debug.print;  // Correção: use std. já importado

pub fn main() void {
    // Operadores aritméticos
    const y: i32 = 10;
    const x: i32 = 15;
    var result: i32 = 0; 
    
    // 1. Adição normal
    result = y + x;  // 25
    print("1. Adição: y + x = {}\n", .{result});
    
    // 2. Adição com wrapping (evita overflow panic)
    result = y +% x;  // 25 (não muda para esses valores)
    print("2. Adição wrapping: y +% x = {}\n", .{result});
    
    // 3. Adição saturante (não existe em Zig - você inventou)
    // Correção: Zig não tem +|, só + e +%
    result = y +% x;  // Usamos wrapping como substituto
    print("3. Adição (não existe saturante em Zig): {}\n", .{result});
    
    // 4. Subtração normal
    result = y - x;  // -5
    print("4. Subtração: y - x = {}\n", .{result});
    
    // 5. Subtração com wrapping
    result = y -% x;  // -5 (não muda)
    print("5. Subtração wrapping: y -% x = {}\n", .{result});
    
    // 6. Subtração saturante (não existe em Zig)
    // Correção: Zig não tem -|, só - e -%
    result = y -% x;  // Usamos wrapping
    print("6. Subtração (não existe saturante): {}\n", .{result});
    
    // 7. Negação normal
    result = -y;  // -10
    print("7. Negação: -y = {}\n", .{result});
    
    // 8. Negação com wrapping
    result = -%y;  // -10
    print("8. Negação wrapping: -%y = {}\n", .{result});
    
    // 9. Multiplicação normal
    result = y * x;  // 150
    print("9. Multiplicação: y * x = {}\n", .{result});
    
    // 10. Multiplicação com wrapping
    result = y *% x;  // 150
    print("10. Multiplicação wrapping: y *% x = {}\n", .{result});
    
    // 11. Multiplicação saturante (não existe *| em Zig)
    result = y *% x;  // Usamos wrapping
    print("11. Multiplicação (não existe saturante): {}\n", .{result});
    
    // 12. Divisão inteira (floor division)
    result = @divFloor(y, x);  // 0 (10 ÷ 15 = 0.666, floor = 0)
    print("12. Divisão floor: @divFloor(y, x) = {}\n", .{result});
    
    // 13. Módulo/resto
    result = @mod(y, x);  // 10 (10 % 15 = 10)
    print("13. Módulo: @mod(y, x) = {}\n", .{result});
    
    // 14. Deslocamento de bits para esquerda
    result = y << 2;  // 40 (10 * 2²)
    print("14. Shift left: y << 2 = {}\n", .{result});
    
    // 15. Shift left saturante (não existe <<| em Zig)
    result = y << 2;  // Shift normal
    print("15. Shift left (não existe saturante): {}\n", .{result});
    
    // 16. Deslocamento de bits para direita
    result = y >> 1;  // 5 (10 ÷ 2¹)
    print("16. Shift right: y >> 1 = {}\n", .{result});
    
    // Operadores bitwise
    // 17. Bitwise AND
    result = y & x;  // 10 & 15 = 10 (1010 & 1111 = 1010)
    print("17. Bitwise AND: y & x = {}\n", .{result});
    
    // 18. Bitwise OR
    result = y | x;  // 10 | 15 = 15 (1010 | 1111 = 1111)
    print("18. Bitwise OR: y | x = {}\n", .{result});
    
    // 19. Bitwise XOR
    result = y ^ x;  // 10 ^ 15 = 5 (1010 ^ 1111 = 0101)
    print("19. Bitwise XOR: y ^ x = {}\n", .{result});
    
    // 20. Bitwise NOT
    result = ~y;  // ~10 = -11 (em complemento de 2)
    print("20. Bitwise NOT: ~y = {}\n", .{result});
    
    // Operadores de optional/error
    const maybe_num: ?i32 = 10;
    const maybe_null: ?i32 = null;
    _ = maybe_null; // autofix
    const num_or_null = maybe_num orelse 99;  // 10
    print("21. Optional unwrap (orelse): {}\n", .{num_or_null});
    
    // Operadores lógicos (trabalham com bool, não i32!)
    const verdadeiro = true;
    const falso = false;
    
    // 22. AND lógico
    const resultado_and = verdadeiro and falso;  // false
    print("22. AND lógico: true and false = {}\n", .{resultado_and});
    
    // 23. OR lógico
    const resultado_or = verdadeiro or falso;  // true
    print("23. OR lógico: true or false = {}\n", .{resultado_or});
    
    // 24. NOT lógico
    const resultado_not = !verdadeiro;  // false
    print("24. NOT lógico: !true = {}\n", .{resultado_not});
    
    // Operadores de comparação (retornam bool)
    // 25. Igualdade
    const igual = y == x;  // false
    print("25. Igualdade: y == x = {}\n", .{igual});
    
    // 26. Desigualdade
    const diferente = y != x;  // true
    print("26. Desigualdade: y != x = {}\n", .{diferente});
    
    // 27. Maior que
    const maior = y > x;  // false
    print("27. Maior que: y > x = {}\n", .{maior});
    
    // 28. Maior ou igual
    const maior_igual = y >= x;  // false
    print("28. Maior ou igual: y >= x = {}\n", .{maior_igual});
    
}
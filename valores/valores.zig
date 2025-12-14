const std = @import("std");
const print = std.debug.print;
const mem = std.mem;
const ascii = std.ascii;

pub fn main() void {
    // ===== 1. DECLARAÇÕES EXPLICATIVAS =====
    const texto = "Agosto"; // []const u8 (string UTF-8)
    const numero_inteiro: i32 = 45; // Inteiro com sinal de 32 bits
    const numero_float: f32 = 45.45; // Ponto flutuante 32-bit (IEEE-754)
    const caractere = 'e'; // Char literal (comptime_int → u8)

    // ===== 2. ANÁLISE DE TIPOS COM @TypeOf =====
    print("\n=== ANÁLISE DE TIPOS ===\n", .{});

    // Método 1: Direto (mais comum)
    print("1. Tipo de 'texto': {}\n", .{@TypeOf(texto)});
    print("2. Tipo de 'numero_inteiro': {}\n", .{@TypeOf(numero_inteiro)});
    print("3. Tipo de 'numero_float': {}\n", .{@TypeOf(numero_float)});
    print("4. Tipo de 'caractere': {}\n", .{@TypeOf(caractere)});

    // Método 2: Nome do tipo como string
    print("\n5. Nome do tipo 'texto': {s}\n", .{@typeName(@TypeOf(texto))});
    print("6. Nome do tipo 'numero_float': {s}\n", .{@typeName(@TypeOf(numero_float))});

    // ===== 3. EXPLORANDO STRINGS COMO ARRAYS =====
    print("\n=== ANÁLISE DA STRING ===\n", .{});

    // Tamanho em bytes (não caracteres!)
    print("7. Tamanho de 'texto': {} bytes\n", .{texto.len});

    // Acessando bytes individuais
    print("8. texto[0] (byte): {d} | como char: {c}\n", .{ texto[0], texto[0] });
    print("9. texto[3] (byte): {d} | como char: {c}\n", .{ texto[3], texto[3] });


    // ===== 4. COMPARAÇÕES E CONVERSÕES =====
    print("\n=== COMPARAÇÕES ===\n", .{});

    // Comparação direta
    print("11. 'e' == '\\x65'? {}\n", .{'e' == '\x65'}); // true

    // Verificando se é dígito/letra
    print("12. 'e' é letra minúscula? {}\n", .{ascii.isLower('e')});
    print("13. 'e' é dígito? {}\n", .{ascii.isDigit('e')});
    print("14. '4' é dígito? {}\n", .{ascii.isDigit('4')});

    // ===== 5. MANIPULAÇÃO DE STRINGS =====
    print("\n=== MANIPULAÇÃO ===\n", .{});

    // Fatiamento (slicing)
    print("15. Primeiros 3 chars: {s}\n", .{texto[0..3]});
    print("16. Do índice 2 ao final: {s}\n", .{texto[2..]});

    // ===== 6. TIPOS NUMÉRICOS =====
    print("\n=== OPERAÇÕES NUMÉRICAS ===\n", .{});

    // Conversões seguras
    const float_para_int = @as(i32, @intFromFloat(numero_float));
    print("18. Float {d} → Inteiro: {d}\n", .{ numero_float, float_para_int });

    // Operações com diferentes tipos
    const resultado = numero_inteiro + @as(i32, @intFromFloat(numero_float));
    print("19. {d} + {d} = {d}\n", .{ numero_inteiro, numero_float, resultado });

    // ===== 7. DETALHES AVANÇADOS =====
    print("\n=== DETALHES TÉCNICOS ===\n", .{});

    // Tamanho dos tipos em bytes
    print("20. Tamanho de i32: {} bytes\n", .{@sizeOf(i32)});
    print("21. Tamanho de f32: {} bytes\n", .{@sizeOf(f32)});
    print("22. Tamanho de 'texto' tipo: {} bytes\n", .{@sizeOf(@TypeOf(texto))});

    // Alinhamento de memória
    print("23. Alinhamento de i32: {}\n", .{@alignOf(i32)});

    // ===== 8. EXPERIMENTOS INTERESSANTES =====
    print("\n=== EXPERIMENTOS ===\n", .{});

    // Strings são imutáveis, mas podemos criar modificações
    // CORREÇÃO: mem.copyForwards retorna void, então não podemos usar seu retorno
    var buffer: [10]u8 = undefined;
    mem.copyForwards(u8, &buffer, texto); // Apenas copia, retorna void
    print("24. Cópia em buffer: {s}\n", .{buffer[0..texto.len]}); // Usa texto.len

    // Char vs String de um caractere
    print("25. Tipo de 'e': {s}\n", .{@typeName(@TypeOf('e'))});
    print("26. Tipo de \"e\": {s}\n", .{@typeName(@TypeOf("e"))});

    // Unicode/UTF-8 básico
    const emoji = "😀";
    print("27. Emoji '{s}' tem {} bytes\n", .{ emoji, emoji.len });
    print("28. Primeiro byte do emoji: 0x{x}\n", .{emoji[0]});

    // ===== 9. USANDO A VARIÁVEL QUE REMOVEMOS (para evitar outro erro) =====
    print("\n=== EXTRA: Caractere por código ===\n", .{});
    const byte_especifico = '\x65'; // Agora usamos a variável
    print("29. Caractere por código 0x65: {c}\n", .{byte_especifico});
    print("30. É igual a 'e'? {}\n", .{byte_especifico == 'e'});
}

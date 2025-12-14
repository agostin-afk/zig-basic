const std = @import("std");
const print = std.debug.print;

// 1. FUNÇÃO SEM RETORNO (void) - apenas executa uma ação
fn digaOla() void {
    print("Olá!\n", .{});
}

// 2. FUNÇÃO COM PARÂMETRO - recebe um argumento do tipo string
fn digaOlaPara(name: []const u8) void {
    print("Olá, {s}!\n", .{name});
}

// 3. FUNÇÃO COM RETORNO - recebe um número e retorna seu dobro
fn dobro(numero: i32) i32 {
    return numero * 2;
}

// 4. FUNÇÃO COM MÚLTIPLOS PARÂMETROS - soma dois números
fn soma(num1: i32, num2: i32) i32 {
    return num1 + num2;
}

// Struct para configuração com valor padrão
const Config = struct {
    tentativas: u8 = 3,
};

// 5. FUNÇÃO QUE RETORNA UMA STRUCT - retorna uma struct com valores padrão
fn configPadrao() Config {
    return Config{};
}

// 6. FUNÇÃO RECURSIVA - calcula o fatorial de um número
fn fatorial(n: i32) i32 {
    if (n <= 1) {
        return 1;
    }
    return n * fatorial(n - 1);
}

// Struct para armazenar resultado de divisão
const ResultadoDiv = struct {
    quociente: i32,
    resto: i32,
};

// 7. FUNÇÃO COM MÚLTIPLOS RETORNOS - retorna quociente e resto da divisão
fn divisao(a: i32, b: i32) ResultadoDiv {
    return ResultadoDiv{
        .quociente = @divFloor(a, b),
        .resto = @mod(a, b),
    };
}

// 8. FUNÇÃO COM PARÂMETRO OPCIONAL - aceita um nome ou null
fn saudacaoOpcional(nome: ?[]const u8) void {
    if (nome) |n| {
        print("Olá, {s}!\n", .{n});
    } else {
        print("Olá, visitante!\n", .{});
    }
}

// 9. FUNÇÃO QUE RETORNA ERRO (error union type) - pode falhar com erro de divisão por zero
fn dividir(a: i32, b: i32) !i32 {
    if (b == 0) {
        return error.DivisaoPorZero;
    }
    return @divFloor(a, b);
}

pub fn main() void {
    print("=== DEMONSTRAÇÃO DE FUNÇÕES ===\n\n", .{});

    // 1. Chamando função sem parâmetros
    digaOla();

    // 2. Chamando função com parâmetro string
    digaOlaPara("Carlos");

    // 3. Chamando função que retorna o dobro de um número
    const d = dobro(7);
    print("Dobro de 7: {}\n", .{d});

    // 4. Chamando função com múltiplos parâmetros
    const s = soma(10, 20);
    print("Soma de 10 e 20: {}\n", .{s});

    // 5. Chamando função que retorna struct com valor padrão
    const cfg = configPadrao();
    print("Tentativas padrão: {}\n", .{cfg.tentativas});

    // 6. Chamando função recursiva (fatorial)
    const fat = fatorial(5);
    print("Fatorial de 5: {}\n", .{fat});

    // 7. Chamando função que retorna múltiplos valores (via struct)
    const div = divisao(10, 3);
    print("Divisão 10 ÷ 3: quociente = {}, resto = {}\n", .{ div.quociente, div.resto });

    // 8. Chamando função com parâmetro opcional
    saudacaoOpcional("Ana");
    saudacaoOpcional(null);

    // 9. Chamando função que pode retornar erro
    const resultado1 = dividir(20, 4);
    if (resultado1) |valor| {
        print("20 ÷ 4 = {}\n", .{valor});
    } else |err| {
        print("Erro: {s}\n", .{@errorName(err)});
    }

    const resultado2 = dividir(5, 0);
    if (resultado2) |valor| {
        print("5 ÷ 0 = {}\n", .{valor});
    } else |err| {
        print("5 ÷ 0 -> Erro: {s}\n", .{@errorName(err)});
    }

    print("\n=== FIM ===\n", .{});
}

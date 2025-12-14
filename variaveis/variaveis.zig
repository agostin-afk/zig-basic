// ====================================================
// NÍVEL 1: IMPORTAÇÕES (nível container)
// ====================================================
// São as primeiras porque tudo depende delas
// Existem durante TODO o tempo de vida do programa
const std = @import("std");
const expect = std.testing.expect;

// Pode ser usada em qualquer lugar do arquivo

// ====================================================
// NÍVEL 2: FUNÇÃO (nível container)
// ====================================================
// Também é de nível container - existe em todo o arquivo
// Pode ser declarada em qualquer ordem (não depende de variáveis)
fn add(a: i32, b: i32) i32 {
    // 'a' e 'b' são de NÍVEL FUNÇÃO - só existem dentro de 'add'
    // São criadas quando 'add' é chamada, destruídas quando retorna
    return a + b;
}

// ====================================================
// NÍVEL 3: VARIÁVEIS DE CONTAINER (nível container)
// ====================================================
// IMPORTANTE: Zig processa o arquivo DE CIMA PARA BAIXO
// Variáveis são inicializadas NA ORDEM EM QUE APARECEM

// 'x' deve vir ANTES porque 'y' precisa dela
const x: i32 = add(12, 33); // x = 45
// 'x' existe durante TODO o programa, pode ser usada em qualquer função

// 'y' vem DEPOIS porque usa 'x' (que agora já existe)
var y: i32 = add(10, x); // y = 10 + 45 = 55
// 'y' também existe durante TODO o programa

// ====================================================
// NÍVEL 4: TESTE (nível container, mas com escopo interno)
// ====================================================
test "container level variables" {
    // Dentro das chaves {} temos um NOVO NÍVEL DE ESCOPO
    // 'x' e 'y' são visíveis aqui (nível container)
    // 'expect' também é visível (foi importada no nível container)

    try expect(x == 45); // 12 + 33 = 45
    try expect(y == 55); // 10 + 45 = 55

    // Podemos criar variáveis LOCAIS ao teste:
    const resultado_local = add(1, 2); // Só existe dentro destas chaves
    _ = resultado_local; // autofix
    // 'resultado_local' NÃO pode ser usada fora deste bloco
}

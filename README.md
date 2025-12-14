# Zig Basic
![GitHub repo size](https://img.shields.io/github/repo-size/agostin-afk/zig-basic?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/agostin-afk/zig-basic?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/agostin-afk/zig-basic?style=for-the-badge)
![Bitbucket open issues](https://img.shields.io/bitbucket/issues/agostin-afk/zig-basic?style=for-the-badge)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/agostin-afk/zig-basic?style=for-the-badge)

> Repositório de estudos e exemplos básicos da linguagem Zig

## 🚀 Funcionalidades
- 📚 **Fundamentos da linguagem**: Variáveis, tipos de dados, operadores
- 🔄 **Controle de fluxo**: Estruturas condicionais e loops (for, while)
- 🏗️ **Estruturas de dados**: Arrays, slices, vetores SIMD, structs
- 📝 **Funções**: Definição, parâmetros, retornos, recursividade
- 🧪 **Testes unitários**: Exemplos de testes integrados na linguagem
- ⚡ **Performance**: Exemplos com vetores SIMD para operações paralelas

## ⚙️ Requisitos
- [Zig](https://ziglang.org/download/) versão 0.11.0 ou superior
- Conhecimento básico de programação (recomendado)

## 🛠️ Instalação e Execução
1. Clone o repositório:
```bash
git clone https://github.com/agostin-afk/zig-basic.git
cd zig-basic
```

2. Execute qualquer arquivo .zig:
```bash
# Para executar um programa
zig run exemplo.zig

# Para executar testes
zig test exemplo.zig

# Para compilar em modo release
zig build-exe exemplo.zig -O ReleaseSafe
```

3. Explore os exemplos por categoria:
```bash
# Exemplos de variáveis e tipos
zig run variaveis.zig

# Exemplos de loops
zig run loops.zig

# Exemplos de funções
zig run funcoes.zig

# Exemplos de structs
zig run structs.zig

# Exemplos de vetores SIMD
zig run vetores.zig
```

## 💻 Exemplos de Código

### Variáveis e Tipos Básicos
```zig
const std = @import("std");

pub fn main() void {
    const nome = "Zig";           // String
    const idade: u8 = 25;         // Inteiro sem sinal
    var saldo: f32 = 100.50;      // Float mutável

    std.debug.print("Nome: {s}, Idade: {}, Saldo: {d:.2}\n",
        .{nome, idade, saldo});
}
```

### Loops e Controle de Fluxo
```zig
// For loop com range
for (1..6) |i| {
    std.debug.print("{} ", .{i});  // 1 2 3 4 5
}

// While com condição
var i: u32 = 0;
while (i < 5) {
    std.debug.print("{} ", .{i});  // 0 1 2 3 4
    i += 1;
}
```

### Funções e Recursividade
```zig
// Função recursiva - fatorial
fn fatorial(n: i32) i32 {
    if (n <= 1) return 1;
    return n * fatorial(n - 1);
}

// Uso
const resultado = fatorial(5);  // 120
```

### Structs e Métodos
```zig
const Pessoa = struct {
    nome: []const u8,
    idade: u8,

    fn apresentar(self: Pessoa) void {
        std.debug.print("Olá, sou {s} e tenho {} anos\n",
            .{self.nome, self.idade});
    }
};

// Uso
const pessoa = Pessoa{ .nome = "Ana", .idade = 30 };
pessoa.apresentar();
```

## 🧪 Testes Unitários
```zig
const std = @import("std");
const expect = std.testing.expect;

test "soma básica" {
    try expect(soma(2, 3) == 5);
}

fn soma(a: i32, b: i32) i32 {
    return a + b;
}
```
Execute com: `zig test exemplo_teste.zig`

## 📁 Estrutura do Projeto
```
zig-basic/
├── variaveis.zig      # Exemplos de variáveis e tipos
├── loops.zig          # Exemplos de loops (for, while)
├── funcoes.zig        # Exemplos de funções
├── structs.zig        # Exemplos de structs
├── vetores.zig        # Exemplos de vetores SIMD
├── testes.zig         # Exemplos de testes unitários
└── README.md          # Este arquivo
```

## 🧑‍💻 Tecnologias Utilizadas
- **Zig 0.11+**: Linguagem de programação de sistemas com foco em otimização e segurança
- **Sistema de Build Integrado**: Compilador e gerenciador de dependências embutido
- **Testes Unitários Nativos**: Suporte a testes integrado na linguagem

## 💡 Dicas para Estudo
1. Comece pelos exemplos de variáveis e tipos básicos
2. Pratique com os exemplos de controle de fluxo (if, for, while)
3. Entenda como funcionam funções e structs
4. Explore os exemplos de vetores SIMD para performance
5. Use `zig test` para validar seu aprendizado

## 📌 Observações
- Este repositório é focado em exemplos didáticos para iniciantes em Zig
- Todos os exemplos são executáveis e testados com Zig 0.11+
- Para dúvidas ou sugestões, abra uma issue no repositório

## 🤝 Como Contribuir
1. Faça um fork deste repositório
2. Crie um branch para sua feature: `git checkout -b minha-feature`
3. Adicione exemplos claros e comentados
4. Certifique-se que os exemplos compilam: `zig build-exe exemplo.zig`
5. Envie suas alterações: `git push origin minha-feature`
6. Abra um pull request

---
**Nota**: Zig é uma linguagem em desenvolvimento ativo. Consulte a [documentação oficial](https://ziglang.org/documentation/master/) para informações atualizadas.

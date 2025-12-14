const std = @import("std");
const print = std.debug.print;

const Pessoa = struct {
    nome: []const u8,
    idade: u8,
    ativo: bool,
};

const Retang = struct {
    largura: i32,
    altura: i32,

    fn area(self: Retang) i32 {
        return self.largura * self.altura;
    }

    fn getAltura(self: Retang) void {
        print("A Area: {}\n", .{self.area()});
    }
};

pub fn main() void {
    const joao = Pessoa{
        .nome = "Joao",
        .idade = 22,
        .ativo = true,
    };
    print("nome: {s}\n", .{joao.nome});
    print("idade: {}\n", .{joao.idade});
    print("ativo: {}\n", .{joao.ativo});

    var maria = Pessoa{
        .nome = "Maria",
        .idade = 25,
        .ativo = false,
    };

    maria.ativo = true;

    const ret = Retang{ .largura = 4, .altura = 5 };

    print("Retangulo {}x{}\n", .{ ret.largura, ret.altura });

    ret.getAltura();
}

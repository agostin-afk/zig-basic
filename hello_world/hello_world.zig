const std = @import("std");
const print = @import("std").debug.print;

pub fn main() void {
     try std.fs.File.stdout().writeAll("Hello, World!\n"); // #para esse funcionar precisa da negaçao void (!void()) -> por conta do writeAll
     // std
     //   └── fs                    // File System - operações com arquivos
     //        └── File             // Tipo que representa um arquivo
     //             └── stdout()    // Função que retorna o arquivo padrão de saída
     //                  └── writeAll() // Método para escrever dados
    
     std.debug.print("Hello, {s}!\n", .{"World"});
    
    
     print("Hello, world!\n", .{}); // #para esse funcionar precisa declarar o print no import. nota: semelhante a C++
     
     
}

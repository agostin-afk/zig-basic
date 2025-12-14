const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const message = [_]u8{ 'A', 'g', 'o', 's', 't', 'o' }; // posso colocar um int [x] para definir o tamanho
    print("matriz: {s}\n", .{message});
    const mat4x5 = [4][5]f32{
        [_]f32{ 1.0, 0.0, 0.0, 0.0, 0.0 },
        [_]f32{ 0.0, 1.0, 0.0, 0.0, 0.0 },
        [_]f32{ 0.0, 0.0, 1.0, 0.0, 0.0 },
        [_]f32{ 0.0, 0.0, 0.0, 1.0, 9.9 },
    };

    for (mat4x5) |row| {
        for (row) |cell| {
            print("{} ", .{cell});
        }
        print("\n", .{});
    }
    for (mat4x5, 0..) |row, row_idx| {
        for (row, 0..) |cell, col_idx| {
            print("[{},{}]={} ", .{ row_idx, col_idx, cell });
        }
        print("\n", .{});
    }
}

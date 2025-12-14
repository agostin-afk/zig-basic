const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    for (1..6) |i| {
        print("{} ", .{i});
    }
    print("\n\n", .{});
    const numbers = [_]i32{ 10, 20, 30, 40 };
    for (numbers) |i| {
        print("{} ", .{i});
    }
    print("\n\n", .{});
    for (numbers, 0..) |val, idx| {
        print("[{}]: {}\n", .{ idx, val });
    }
    print("\n\n", .{});
    const name = "Agosto";
    for (name) |value| {
        print("{c} ", .{value});
    }
    print("\n\n", .{});

    print("Com while:\n", .{});

    var contador: i32 = 0;
    while (contador < 45) {
        print("{} \n", .{contador});
        contador += 1;
    }
    print("\n\n", .{});
    var i: i32 = 0;
    while (i <= 10) {
        i += 1;
        if (i > 5) {
            break;
        }
        if (@mod(i, 2) == 0) {
            continue;
        }
    }
}

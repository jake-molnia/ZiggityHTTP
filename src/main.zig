const std = @import("std");

/// "Imports" used from zig stdlib
const net = std.net;
const Address = net.Address;
const Stream = net.Stream;

pub fn main() !void {
    const addr = try Address.parseIp("127.0.0.1", 9669);
    var server = try addr.listen(.{});

    while (true) {
        const connection = try server.accept();
        try connection.stream.writer().print("Ur mum sucks!", .{});
    }
}

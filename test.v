module alu (input zx, nx, zy, ny, f, no, input[3:0] x, y, output o1, o2, o3, o4);
    wire[3:0] _x = 8; // temp inputs while stuff isn't soldered yet
    wire[3:0] _y = 7;
    wire _zx = 0;
    wire _nx = 1;
    wire _zy = 0;
    wire _ny = 0;
    wire _f  = 1;
    wire _no = 1;
    wire[3:0] zxr;
    wire[3:0] nxr;
    wire[3:0] zyr;
    wire[3:0] nyr;
    wire[3:0] fr;
    wire[3:0] nr;
    wire[3:0] out;

    always @(_zx or _x)
    begin
        if (_zx == 1)
            zxr = 0;
        else
            zxr = _x;
    end

    always @(_zy or _y)
    begin
        if (_zy == 1)
            zyr = 0;
        else
            zyr = _y;
    end

    always @(_nx or zxr)
    begin
        if (_nx == 1)
            nxr = ~zxr;
        else
            nxr = zxr;
    end

    always @(_ny or zyr)
    begin
        if (_ny == 1)
            nyr = ~zyr;
        else
            nyr = zyr;
    end

    always @(_f or nyr or nxr)
    begin
        if (_f == 1)
            fr = nyr + nxr;
        else
            fr = nyr & nxr;
    end

    always @(_no or fr)
    begin
        if (_no == 1)
            out = ~fr;
        else
            out = fr;
    end

    wire[3:0] r = out;

    assign o1 = r[0];
    assign o2 = r[1];
    assign o3 = r[2];
    assign o4 = r[3];
endmodule

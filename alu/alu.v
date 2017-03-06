module alu (input zx, nx, zy, ny, f, no, input[3:0] x, y, output[3:0] out, output zr, ng, o1, o2, o3, o4);
    wire[3:0] zxr;
    wire[3:0] nxr;
    wire[3:0] zyr;
    wire[3:0] nyr;
    wire[3:0] fr;
    wire[3:0] nr;

    always @(zx or x)
    begin
        if (zx == 1)
            zxr = 0;
        else
            zxr = x;
    end

    always @(zy or y)
    begin
        if (zy == 1)
            zyr = 0;
        else
            zyr = y;
    end

    always @(nx or zxr)
    begin
        if (nx == 1)
            nxr = ~zxr;
        else
            nxr = zxr;
    end

    always @(ny or zyr)
    begin
        if (ny == 1)
            nyr = ~zyr;
        else
            nyr = zyr;
    end

    always @(f or nyr or nxr)
    begin
        if (f == 1)
            fr = nyr + nxr;
        else
            fr = nyr & nxr;
    end

    always @(no or fr)
    begin
        if (no == 1)
            out = ~fr;
        else
            out = fr;
    end

    always @(out)
    begin
        if (out == 0)
            zr = 1;
        else
            zr = 0;
    end

    wire[3:0] r = out;

    assign o1 = r[0];
    assign o2 = r[1];
    assign o3 = r[2];
    assign o4 = r[3];
endmodule

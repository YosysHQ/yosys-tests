module top
#(parameter WIDTH = 64, C_WIDTH = 8, DE = 4)
(
   input clk,
   input reset,
   input [C_WIDTH*WIDTH-1:0] c_data_in_port,
   input [DE*C_WIDTH -1:0] d_one_hot,
   input [C_WIDTH      -1:0] c_data_in_en,

   output reg [DE*WIDTH-1:0] d_data_out_port,
   output reg [DE-1:0]       d_data_out_en
);

reg  [ WIDTH-1:0] clients_data_in                [ C_WIDTH-1:0];
reg  [ C_WIDTH-1:0] devices_one_hot_client_sel     [ DE-1:0];
reg  [ WIDTH-1:0] devices_data_out               [ DE-1:0];

reg  [ WIDTH-1:0] clients_data_in_s              [ C_WIDTH-1:0];
reg  [ C_WIDTH-1:0] devices_one_hot_client_sel_s   [ DE-1:0];

wire [ WIDTH-1:0] devices_data_out_p             [ DE-1:0];

wire [ C_WIDTH-1:0] clients_data_rotate            [ WIDTH-1:0];
wire [ DE-1:0]  devices_data_rotate            [ WIDTH-1:0];

reg  [ DE-1:0]  clients_one_hot_device_sel     [ C_WIDTH-1:0];

wire [ DE-1:0]  dev_en;
wire [ DE-1:0]  data_out_en;

integer client, device;

always @*
begin
    for(client = 0; client < C_WIDTH; client = client + 1) begin
        clients_data_in[client] = c_data_in_port[client*WIDTH+:WIDTH];
    end
end

always @*
begin
    for(client = 0; client < C_WIDTH; client = client + 1) begin
        clients_one_hot_device_sel[client] = d_one_hot[client*DE+:DE];
    end
end

always @*
begin
    for (device = 0; device < DE; device = device + 1) begin
       for(client = 0; client < C_WIDTH; client = client + 1) begin
           devices_one_hot_client_sel[device][client] = clients_one_hot_device_sel[client][device];
       end
    end
end

genvar k;
integer rowsel;
genvar i, j, nw;

always @(posedge clk or negedge reset)
    if (!reset)
        for (rowsel = 0; rowsel < DE;  rowsel=rowsel+1)
            devices_data_out[rowsel][WIDTH-1:1] <= 'b0;
    else begin
        for (rowsel = 0; rowsel < DE;  rowsel=rowsel+1)
            if (dev_en[rowsel]==1'b1)
                devices_data_out[rowsel][WIDTH-1:1] <= devices_data_out_p[rowsel][WIDTH-1:1];
    end

always @(posedge clk or negedge reset)
    if (!reset)
        for (rowsel = 0; rowsel < DE;  rowsel=rowsel+1)
            devices_data_out[rowsel][0] <= 1'b0;
    else
        for (rowsel = 0; rowsel < DE;  rowsel=rowsel+1)
            devices_data_out[rowsel][0] <= devices_data_out_p[rowsel][0];

always @*
begin
    for(rowsel = 0; rowsel < C_WIDTH; rowsel=rowsel+1) begin
            clients_data_in_s[rowsel][WIDTH-1:0] = clients_data_in[rowsel];
    end
end

always @*
begin
    for(rowsel = 0; rowsel < DE;  rowsel=rowsel+1) begin
        devices_one_hot_client_sel_s[rowsel][C_WIDTH-1:0] = devices_one_hot_client_sel[rowsel][C_WIDTH-1:0];
    end
end

generate
    for (i = 0; i < DE; i=i+1) begin:gen_i3
        assign dev_en[i] = |devices_one_hot_client_sel_s[i][C_WIDTH-1:0];
    end
endgenerate

generate
    for (i = 0; i < DE; i=i+1) begin:gen_i4
        assign data_out_en[i] = |devices_one_hot_client_sel[i][C_WIDTH-1:0];
    end
endgenerate

always @(posedge clk or negedge reset)
    if (!reset)
        for (rowsel = 0; rowsel < DE; rowsel=rowsel+1)
            d_data_out_en[rowsel] <= 1'b0;
    else
        for (rowsel = 0; rowsel < DE; rowsel=rowsel+1)
            d_data_out_en[rowsel] <= data_out_en[rowsel];

generate
  for (i = 0; i < C_WIDTH; i=i+1) begin:gen_i
     for (j = 0; j < WIDTH; j=j+1) begin:gen_j
        assign clients_data_rotate[j][i] = clients_data_in_s[i][j];
     end
  end
endgenerate

generate
  for (nw = 0; nw < WIDTH; nw=nw+1) begin  : gen_nw

        for (i = 0; i < DE; i=i+1) begin:gen_label
           assign devices_data_rotate[nw][i] = |(clients_data_rotate[nw] & devices_one_hot_client_sel_s[i]);
        end
  end
endgenerate

generate
  for (i = 0; i < WIDTH; i=i+1) begin:gen_i2
     for (j = 0; j < DE; j=j+1) begin:gen_j2
        assign devices_data_out_p[j][i] = devices_data_rotate[i][j];
     end
  end
endgenerate

always @*
begin
   for (device = 0; device < DE; device = device + 1) begin
       d_data_out_port[device*WIDTH+:WIDTH] = devices_data_out[device];
   end
end

endmodule

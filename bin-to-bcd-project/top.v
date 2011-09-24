`timescale 1ns / 1ps

// Updates Copyright (C) 2011 Andrew Schamp (schamp@gmail.com)
// removed 7-segment display drivers and exposed BCD output directly

// Original:
// Copyright (C) 2008 DJ Delorie <dj@delorie.com>
// Distributed under the terms of the GNU General Public License,
// either verion 2 or (at your choice) any later version.

module top(ibin, nen, en, bcd2, bcd1, bcd0, gnd);
    input [7:0] ibin;
    input nen;
    input en;
	 
	 output [1:0] bcd2;
	 output [3:0] bcd1;
	 output [3:0] bcd0;
	 
	 output gnd;

    wire nen;
    wire en;

    wire [1:0] bcd2;
    wire [3:0] bcd1;
    wire [3:0] bcd0;

	 reg gnd;
	 
    reg [7:0] ibinh;

// we use this gnd connection to ground 
// the 74hc595, so we need to make sure we don't use it for anything else
always
begin 
  gnd = 1'bz;
end

always @ (ibin, nen, en)
begin
  if (en & ~ nen)
    ibinh = ibin;
  else
    ibinh = ibinh;
end

bcd b0 (ibinh, bcd2, bcd1, bcd0);

endmodule

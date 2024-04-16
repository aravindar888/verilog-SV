class monitor;

transaction tr;
mailbox #(transaction) monscb;

function new(mailbox #(transaction) monscb);
this.monscb = monscb;
endfunction

virtual dff_if vif;

task run();
tr = new();
forever begin
repeat(2) @(posedge vif.clk);

tr.din = vif.din;
tr.dout = vif.dout;
monscb.put(tr);
tr.display("MON");
end
endtask

endclass


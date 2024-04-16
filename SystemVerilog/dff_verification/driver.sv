class driver;

transaction tr;
mailbox #(transaction) drvgen;

function new(mailbox #(transaction) drvgen);
this.drvgen = drvgen;
endfunction

virtual dff_if vif;

task run();
forever begin
drvgen.get(tr);
@(posedge vif.clk);
vif.din <= tr.din;
vif.rst <= tr.rst;
tr.display("DRV");
end
endtask

endclass





class generator;

transaction tr;
mailbox #(transaction) gendrv;
mailbox #(transaction) genscb;
int count;

function new(mailbox #(transaction) gendrv,mailbox #(transaction) genscb);
tr =new();
this.gendrv = gendrv;
this.genscb = genscb;
endfunction

event done;

event sconxt;

task run();
repeat(count) begin
assert(tr.randomize) else $error("[GEN] :randomization failed");
gendrv.put(tr.copy);
genscb.put(tr.copy);
tr.display("GEN");
@(sconxt);
end
->done;
endtask;

endclass

class scoreboard;

transaction tr;
transaction trref;
mailbox #(transaction) monscb;
mailbox #(transaction) genscb;


function new(mailbox #(transaction) monscb,mailbox #(transaction) genscb);
tr =new();
this.monscb = monscb;
this.genscb = genscb;
endfunction

event sconxt;

task run();
forever begin
  monscb.get(tr);
  genscb.get(trref);
  tr.display("SCB");
  tr.display("REF");
  
  if(tr.dout == trref.din)
    $display("[SCO] : DATA MATCHED");
  else
    $display("[SCO] : DATA MISMATCHED");
    $display("-------------------------------------------------");
  ->sconxt; 

end
endtask;

endclass

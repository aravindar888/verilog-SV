`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen; // Generator instance
  driver drv; // Driver instance
  monitor mon; // Monitor instance
  scoreboard scb; // Scoreboard instance
  event next;
  
  mailbox #(transaction) gendrv;
  mailbox #(transaction) genscb;
  mailbox #(transaction) monscb;
  virtual dff_if vif;
  function new(virtual dff_if vif);
    gendrv =new();
    genscb = new();
    monscb = new();

    gen = new(gendrv,genscb);
    drv = new(gendrv);
    mon = new(monscb);
    scb = new(monscb,genscb);
    
    this.vif = vif;
    drv.vif = this.vif;
    mon.vif = this.vif;
    gen.sconxt = next;
    scb.sconxt = next;
  endfunction
  task test();
   fork
    gen.run();
    drv.run();
    mon.run();
    scb.run();
   join_any
  endtask
  task posttest();
    wait(gen.done.triggered);
    $finish;
  endtask

  task run();
   test();
   posttest();
  endtask 

  
endclass

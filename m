Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA12503
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Oct 1999 20:24:19 -0600
Received: from milano.cup.hp.com (grundler@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id TAA10917
	for <parisc-linux@thepuffingroup.com>; Sat, 16 Oct 1999 19:25:06 -0700 (PDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id TAA25426 for parisc-linux@thepuffingroup.com; Sat, 16 Oct 1999 19:25:01 -0700 (PDT)
Date: Sat, 16 Oct 1999 19:25:01 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199910170225.TAA25426@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] rebuild of 53c7xx.o
List-ID: <linux-parisc.vger.kernel.org>

It was annoying me that 53c7xx.o was getting rebuilt on every
build....So I tried to figure out why.  The basic problem is
"dummy" target (from Rules.make?) is invoked and fails when comparing
time stamps. But I don't see where/why 53c7xx.o has dummy as a dependent.
I think fixing this should fix the problem.

Appended is relevant "make -d" output.
(The whole output is 531846 lines).
Does someone see the problem and/or know how to fix it?

thanks,
grant

...
    Considering target file `53c7xx.o'.
      Considering target file `53c7xx_d.h'.
        Considering target file `53c7xx.scr'.
         Looking for an implicit rule for `53c7xx.scr'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `53c7xx.scr.c'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `53c7xx.scr.o'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `53c7xx.scr,v'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `RCS/53c7xx.scr,v'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `RCS/53c7xx.scr'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `s.53c7xx.scr'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `SCCS/s.53c7xx.scr'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `53c7xx.scr.c'.
         Looking for a rule with intermediate file `53c7xx.scr.c'.
          Avoiding implicit rule recursion.
          Trying pattern rule with stem `53c7xx.scr'.
          Trying implicit dependency `53c7xx.scr.w'.
          Trying pattern rule with stem `53c7xx.scr.c'.
          Trying implicit dependency `53c7xx.scr.c,v'.
          Trying pattern rule with stem `53c7xx.scr.c'.
          Trying implicit dependency `RCS/53c7xx.scr.c,v'.
          Trying pattern rule with stem `53c7xx.scr.c'.
          Trying implicit dependency `RCS/53c7xx.scr.c'.
          Trying pattern rule with stem `53c7xx.scr.c'.
          Trying implicit dependency `s.53c7xx.scr.c'.
          Trying pattern rule with stem `53c7xx.scr.c'.
          Trying implicit dependency `SCCS/s.53c7xx.scr.c'.
          Trying pattern rule with stem `53c7xx.scr'.
          Trying implicit dependency `53c7xx.scr.w'.
          Looking for a rule with intermediate file `53c7xx.scr.w'.
           Avoiding implicit rule recursion.
           Avoiding implicit rule recursion.
           Trying pattern rule with stem `53c7xx.scr.w'.
           Trying implicit dependency `53c7xx.scr.w,v'.
           Trying pattern rule with stem `53c7xx.scr.w'.
           Trying implicit dependency `RCS/53c7xx.scr.w,v'.
           Trying pattern rule with stem `53c7xx.scr.w'.
           Trying implicit dependency `RCS/53c7xx.scr.w'.
           Trying pattern rule with stem `53c7xx.scr.w'.
           Trying implicit dependency `s.53c7xx.scr.w'.
           Trying pattern rule with stem `53c7xx.scr.w'.
           Trying implicit dependency `SCCS/s.53c7xx.scr.w'.
         Trying pattern rule with stem `53c7xx.scr'.
         Trying implicit dependency `53c7xx.scr.o'.
         Looking for a rule with intermediate file `53c7xx.scr.o'.
          Avoiding implicit rule recursion.
          Trying pattern rule with stem `53c7xx.scr'.
          Rejecting impossible implicit dependency `53c7xx.scr.c'.
          Trying pattern rule with stem `53c7xx.scr'.
          Trying implicit dependency `53c7xx.scr.s'.
          Trying pattern rule with stem `53c7xx.scr.o'.
          Trying implicit dependency `53c7xx.scr.o,v'.
          Trying pattern rule with stem `53c7xx.scr.o'.
          Trying implicit dependency `RCS/53c7xx.scr.o,v'.
          Trying pattern rule with stem `53c7xx.scr.o'.
          Trying implicit dependency `RCS/53c7xx.scr.o'.
          Trying pattern rule with stem `53c7xx.scr.o'.
          Trying implicit dependency `s.53c7xx.scr.o'.
          Trying pattern rule with stem `53c7xx.scr.o'.
          Trying implicit dependency `SCCS/s.53c7xx.scr.o'.
          Trying pattern rule with stem `53c7xx.scr'.
          Trying implicit dependency `53c7xx.scr.s'.
          Looking for a rule with intermediate file `53c7xx.scr.s'.
           Avoiding implicit rule recursion.
           Avoiding implicit rule recursion.
           Trying pattern rule with stem `53c7xx.scr'.
           Rejecting impossible implicit dependency `53c7xx.scr.c'.
           Trying pattern rule with stem `53c7xx.scr.s'.
           Trying implicit dependency `53c7xx.scr.s,v'.
           Trying pattern rule with stem `53c7xx.scr.s'.
           Trying implicit dependency `RCS/53c7xx.scr.s,v'.
           Trying pattern rule with stem `53c7xx.scr.s'.
           Trying implicit dependency `RCS/53c7xx.scr.s'.
           Trying pattern rule with stem `53c7xx.scr.s'.
           Trying implicit dependency `s.53c7xx.scr.s'.
           Trying pattern rule with stem `53c7xx.scr.s'.
           Trying implicit dependency `SCCS/s.53c7xx.scr.s'.
         No implicit rule found for `53c7xx.scr'.
         Finished dependencies of target file `53c7xx.scr'.
        No need to remake target `53c7xx.scr'.
        Considering target file `script_asm.pl'.
         Looking for an implicit rule for `script_asm.pl'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `script_asm.pl.c'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `script_asm.pl.o'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `script_asm.pl,v'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `RCS/script_asm.pl,v'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `RCS/script_asm.pl'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `s.script_asm.pl'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `SCCS/s.script_asm.pl'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `script_asm.pl.c'.
         Looking for a rule with intermediate file `script_asm.pl.c'.
          Avoiding implicit rule recursion.
          Trying pattern rule with stem `script_asm.pl'.
          Trying implicit dependency `script_asm.pl.w'.
          Trying pattern rule with stem `script_asm.pl.c'.
          Trying implicit dependency `script_asm.pl.c,v'.
          Trying pattern rule with stem `script_asm.pl.c'.
          Trying implicit dependency `RCS/script_asm.pl.c,v'.
          Trying pattern rule with stem `script_asm.pl.c'.
          Trying implicit dependency `RCS/script_asm.pl.c'.
          Trying pattern rule with stem `script_asm.pl.c'.
          Trying implicit dependency `s.script_asm.pl.c'.
          Trying pattern rule with stem `script_asm.pl.c'.
          Trying implicit dependency `SCCS/s.script_asm.pl.c'.
          Trying pattern rule with stem `script_asm.pl'.
          Trying implicit dependency `script_asm.pl.w'.
          Looking for a rule with intermediate file `script_asm.pl.w'.
           Avoiding implicit rule recursion.
           Avoiding implicit rule recursion.
           Trying pattern rule with stem `script_asm.pl.w'.
           Trying implicit dependency `script_asm.pl.w,v'.
           Trying pattern rule with stem `script_asm.pl.w'.
           Trying implicit dependency `RCS/script_asm.pl.w,v'.
           Trying pattern rule with stem `script_asm.pl.w'.
           Trying implicit dependency `RCS/script_asm.pl.w'.
           Trying pattern rule with stem `script_asm.pl.w'.
           Trying implicit dependency `s.script_asm.pl.w'.
           Trying pattern rule with stem `script_asm.pl.w'.
           Trying implicit dependency `SCCS/s.script_asm.pl.w'.
         Trying pattern rule with stem `script_asm.pl'.
         Trying implicit dependency `script_asm.pl.o'.
         Looking for a rule with intermediate file `script_asm.pl.o'.
          Avoiding implicit rule recursion.
          Trying pattern rule with stem `script_asm.pl'.
          Rejecting impossible implicit dependency `script_asm.pl.c'.
          Trying pattern rule with stem `script_asm.pl'.
          Trying implicit dependency `script_asm.pl.s'.
          Trying pattern rule with stem `script_asm.pl.o'.
          Trying implicit dependency `script_asm.pl.o,v'.
          Trying pattern rule with stem `script_asm.pl.o'.
          Trying implicit dependency `RCS/script_asm.pl.o,v'.
          Trying pattern rule with stem `script_asm.pl.o'.
          Trying implicit dependency `RCS/script_asm.pl.o'.
          Trying pattern rule with stem `script_asm.pl.o'.
          Trying implicit dependency `s.script_asm.pl.o'.
          Trying pattern rule with stem `script_asm.pl.o'.
          Trying implicit dependency `SCCS/s.script_asm.pl.o'.
          Trying pattern rule with stem `script_asm.pl'.
          Trying implicit dependency `script_asm.pl.s'.
          Looking for a rule with intermediate file `script_asm.pl.s'.
           Avoiding implicit rule recursion.
           Avoiding implicit rule recursion.
           Trying pattern rule with stem `script_asm.pl'.
           Rejecting impossible implicit dependency `script_asm.pl.c'.
           Trying pattern rule with stem `script_asm.pl.s'.
           Trying implicit dependency `script_asm.pl.s,v'.
           Trying pattern rule with stem `script_asm.pl.s'.
           Trying implicit dependency `RCS/script_asm.pl.s,v'.
           Trying pattern rule with stem `script_asm.pl.s'.
           Trying implicit dependency `RCS/script_asm.pl.s'.
           Trying pattern rule with stem `script_asm.pl.s'.
           Trying implicit dependency `s.script_asm.pl.s'.
           Trying pattern rule with stem `script_asm.pl.s'.
           Trying implicit dependency `SCCS/s.script_asm.pl.s'.
         No implicit rule found for `script_asm.pl'.
         Finished dependencies of target file `script_asm.pl'.
        No need to remake target `script_asm.pl'.
       Finished dependencies of target file `53c7xx_d.h'.
       Dependency `53c7xx.scr' is older than dependent `53c7xx_d.h'.
       Dependency `script_asm.pl' is older than dependent `53c7xx_d.h'.
      No need to remake target `53c7xx_d.h'.
      Considering target file `53c7xx.c'.
       Looking for an implicit rule for `53c7xx.c'.
       Trying pattern rule with stem `53c7xx'.
       Trying implicit dependency `53c7xx.w'.
       Trying pattern rule with stem `53c7xx.c'.
       Trying implicit dependency `53c7xx.c,v'.
       Trying pattern rule with stem `53c7xx.c'.
       Trying implicit dependency `RCS/53c7xx.c,v'.
       Trying pattern rule with stem `53c7xx.c'.
       Trying implicit dependency `RCS/53c7xx.c'.
       Trying pattern rule with stem `53c7xx.c'.
       Trying implicit dependency `s.53c7xx.c'.
       Trying pattern rule with stem `53c7xx.c'.
       Trying implicit dependency `SCCS/s.53c7xx.c'.
       Trying pattern rule with stem `53c7xx'.
       Trying implicit dependency `53c7xx.w'.
       Looking for a rule with intermediate file `53c7xx.w'.
        Avoiding implicit rule recursion.
        Trying pattern rule with stem `53c7xx.w'.
        Trying implicit dependency `53c7xx.w,v'.
        Trying pattern rule with stem `53c7xx.w'.
        Trying implicit dependency `RCS/53c7xx.w,v'.
        Trying pattern rule with stem `53c7xx.w'.
        Trying implicit dependency `RCS/53c7xx.w'.
        Trying pattern rule with stem `53c7xx.w'.
        Trying implicit dependency `s.53c7xx.w'.
        Trying pattern rule with stem `53c7xx.w'.
        Trying implicit dependency `SCCS/s.53c7xx.w'.
       No implicit rule found for `53c7xx.c'.
       Finished dependencies of target file `53c7xx.c'.
      No need to remake target `53c7xx.c'.
      Considering target file `/linux/linux/include/linux/module.h'.
      File `/linux/linux/include/linux/module.h' was considered already.
      Considering target file `/linux/linux/include/linux/types.h'.
      File `/linux/linux/include/linux/types.h' was considered already.
      Considering target file `/linux/linux/include/asm/setup.h'.
       Looking for an implicit rule for `/linux/linux/include/asm/setup.h'.
       Trying pattern rule with stem `setup.h'.
       Trying implicit dependency `/linux/linux/include/asm/setup.h,v'.
       Trying pattern rule with stem `setup.h'.
       Trying implicit dependency `/linux/linux/include/asm/RCS/setup.h,v'.
       Trying pattern rule with stem `setup.h'.
       Trying implicit dependency `/linux/linux/include/asm/RCS/setup.h'.
       Trying pattern rule with stem `setup.h'.
       Trying implicit dependency `/linux/linux/include/asm/s.setup.h'.
       Trying pattern rule with stem `setup.h'.
       Trying implicit dependency `/linux/linux/include/asm/SCCS/s.setup.h'.
       No implicit rule found for `/linux/linux/include/asm/setup.h'.
       Finished dependencies of target file `/linux/linux/include/asm/setup.h'.
      No need to remake target `/linux/linux/include/asm/setup.h'.
      Considering target file `/linux/linux/include/asm/dma.h'.
      File `/linux/linux/include/asm/dma.h' was considered already.
      Considering target file `/linux/linux/include/asm/io.h'.
      File `/linux/linux/include/asm/io.h' was considered already.
      Considering target file `/linux/linux/include/asm/system.h'.
      File `/linux/linux/include/asm/system.h' was considered already.
      Considering target file `/linux/linux/include/linux/delay.h'.
      File `/linux/linux/include/linux/delay.h' was considered already.
      Considering target file `/linux/linux/include/linux/signal.h'.
       Looking for an implicit rule for `/linux/linux/include/linux/signal.h'.
       Trying pattern rule with stem `signal.h'.
       Trying implicit dependency `/linux/linux/include/linux/signal.h,v'.
       Trying pattern rule with stem `signal.h'.
       Trying implicit dependency `/linux/linux/include/linux/RCS/signal.h,v'.
       Trying pattern rule with stem `signal.h'.
       Trying implicit dependency `/linux/linux/include/linux/RCS/signal.h'.
       Trying pattern rule with stem `signal.h'.
       Trying implicit dependency `/linux/linux/include/linux/s.signal.h'.
       Trying pattern rule with stem `signal.h'.
       Trying implicit dependency `/linux/linux/include/linux/SCCS/s.signal.h'.
       No implicit rule found for `/linux/linux/include/linux/signal.h'.
       Finished dependencies of target file `/linux/linux/include/linux/signal.h'.
      No need to remake target `/linux/linux/include/linux/signal.h'.
      Considering target file `/linux/linux/include/linux/sched.h'.
      File `/linux/linux/include/linux/sched.h' was considered already.
      Considering target file `/linux/linux/include/linux/errno.h'.
      File `/linux/linux/include/linux/errno.h' was considered already.
      Considering target file `/linux/linux/include/linux/proc_fs.h'.
      File `/linux/linux/include/linux/proc_fs.h' was considered already.
      Considering target file `/linux/linux/include/linux/string.h'.
      File `/linux/linux/include/linux/string.h' was considered already.
      Considering target file `/linux/linux/include/linux/malloc.h'.
      File `/linux/linux/include/linux/malloc.h' was considered already.
      Considering target file `/linux/linux/include/linux/vmalloc.h'.
       Looking for an implicit rule for `/linux/linux/include/linux/vmalloc.h'.
       Trying pattern rule with stem `vmalloc.h'.
       Trying implicit dependency `/linux/linux/include/linux/vmalloc.h,v'.
       Trying pattern rule with stem `vmalloc.h'.
       Trying implicit dependency `/linux/linux/include/linux/RCS/vmalloc.h,v'.
       Trying pattern rule with stem `vmalloc.h'.
       Trying implicit dependency `/linux/linux/include/linux/RCS/vmalloc.h'.
       Trying pattern rule with stem `vmalloc.h'.
       Trying implicit dependency `/linux/linux/include/linux/s.vmalloc.h'.
       Trying pattern rule with stem `vmalloc.h'.
       Trying implicit dependency `/linux/linux/include/linux/SCCS/s.vmalloc.h'.
       No implicit rule found for `/linux/linux/include/linux/vmalloc.h'.
       Finished dependencies of target file `/linux/linux/include/linux/vmalloc.h'.
      No need to remake target `/linux/linux/include/linux/vmalloc.h'.
      Considering target file `/linux/linux/include/linux/mm.h'.
      File `/linux/linux/include/linux/mm.h' was considered already.
      Considering target file `/linux/linux/include/linux/ioport.h'.
      File `/linux/linux/include/linux/ioport.h' was considered already.
      Considering target file `/linux/linux/include/linux/time.h'.
       Looking for an implicit rule for `/linux/linux/include/linux/time.h'.
       Trying pattern rule with stem `time.h'.
       Trying implicit dependency `/linux/linux/include/linux/time.h,v'.
       Trying pattern rule with stem `time.h'.
       Trying implicit dependency `/linux/linux/include/linux/RCS/time.h,v'.
       Trying pattern rule with stem `time.h'.
       Trying implicit dependency `/linux/linux/include/linux/RCS/time.h'.
       Trying pattern rule with stem `time.h'.
       Trying implicit dependency `/linux/linux/include/linux/s.time.h'.
       Trying pattern rule with stem `time.h'.
       Trying implicit dependency `/linux/linux/include/linux/SCCS/s.time.h'.
       No implicit rule found for `/linux/linux/include/linux/time.h'.
       Finished dependencies of target file `/linux/linux/include/linux/time.h'.
      No need to remake target `/linux/linux/include/linux/time.h'.
      Considering target file `/linux/linux/include/linux/blk.h'.
      File `/linux/linux/include/linux/blk.h' was considered already.
      Considering target file `/linux/linux/include/asm/spinlock.h'.
      File `/linux/linux/include/asm/spinlock.h' was considered already.
      Considering target file `/linux/linux/include/asm/pgtable.h'.
      File `/linux/linux/include/asm/pgtable.h' was considered already.
      Considering target file `/linux/linux/include/asm/irq.h'.
      File `/linux/linux/include/asm/irq.h' was considered already.
      Considering target file `/linux/linux/include/asm/pgtable.h'.
      File `/linux/linux/include/asm/pgtable.h' was considered already.
      Considering target file `/linux/linux/include/asm/pgtable.h'.
      File `/linux/linux/include/asm/pgtable.h' was considered already.
      Considering target file `/linux/linux/include/config/gecko/lasi.h'.
      File `/linux/linux/include/config/gecko/lasi.h' was considered already.
      Considering target file `/linux/linux/include/asm/gsc.h'.
       Looking for an implicit rule for `/linux/linux/include/asm/gsc.h'.
       Trying pattern rule with stem `gsc.h'.
       Trying implicit dependency `/linux/linux/include/asm/gsc.h,v'.
       Trying pattern rule with stem `gsc.h'.
       Trying implicit dependency `/linux/linux/include/asm/RCS/gsc.h,v'.
       Trying pattern rule with stem `gsc.h'.
       Trying implicit dependency `/linux/linux/include/asm/RCS/gsc.h'.
       Trying pattern rule with stem `gsc.h'.
       Trying implicit dependency `/linux/linux/include/asm/s.gsc.h'.
       Trying pattern rule with stem `gsc.h'.
       Trying implicit dependency `/linux/linux/include/asm/SCCS/s.gsc.h'.
       No implicit rule found for `/linux/linux/include/asm/gsc.h'.
       Finished dependencies of target file `/linux/linux/include/asm/gsc.h'.
      No need to remake target `/linux/linux/include/asm/gsc.h'.
      Considering target file `scsi.h'.
      File `scsi.h' was considered already.
      Considering target file `hosts.h'.
      File `hosts.h' was considered already.
      Considering target file `53c7xx.h'.
      File `53c7xx.h' was considered already.
      Considering target file `constants.h'.
      File `constants.h' was considered already.
      Considering target file `sd.h'.
      File `sd.h' was considered already.
      Considering target file `/linux/linux/include/linux/stat.h'.
      File `/linux/linux/include/linux/stat.h' was considered already.
      Considering target file `/linux/linux/include/linux/stddef.h'.
      File `/linux/linux/include/linux/stddef.h' was considered already.
      Considering target file `53c7xx_d.h'.
      File `53c7xx_d.h' was considered already.
      Considering target file `53c7xx_u.h'.
       Looking for an implicit rule for `53c7xx_u.h'.
       Trying pattern rule with stem `53c7xx_u.h'.
       Trying implicit dependency `53c7xx_u.h,v'.
       Trying pattern rule with stem `53c7xx_u.h'.
       Trying implicit dependency `RCS/53c7xx_u.h,v'.
       Trying pattern rule with stem `53c7xx_u.h'.
       Trying implicit dependency `RCS/53c7xx_u.h'.
       Trying pattern rule with stem `53c7xx_u.h'.
       Trying implicit dependency `s.53c7xx_u.h'.
       Trying pattern rule with stem `53c7xx_u.h'.
       Trying implicit dependency `SCCS/s.53c7xx_u.h'.
       No implicit rule found for `53c7xx_u.h'.
        Considering target file `53c7xx_d.h'.
        File `53c7xx_d.h' was considered already.
       Finished dependencies of target file `53c7xx_u.h'.
       Dependency `53c7xx_d.h' is older than dependent `53c7xx_u.h'.
      No commands for `53c7xx_u.h' and no dependencies actually changed.
      No need to remake target `53c7xx_u.h'.
      Considering target file `scsi_module.c'.
       Looking for an implicit rule for `scsi_module.c'.
       Trying pattern rule with stem `scsi_module'.
       Trying implicit dependency `scsi_module.w'.
       Trying pattern rule with stem `scsi_module.c'.
       Trying implicit dependency `scsi_module.c,v'.
       Trying pattern rule with stem `scsi_module.c'.
       Trying implicit dependency `RCS/scsi_module.c,v'.
       Trying pattern rule with stem `scsi_module.c'.
       Trying implicit dependency `RCS/scsi_module.c'.
       Trying pattern rule with stem `scsi_module.c'.
       Trying implicit dependency `s.scsi_module.c'.
       Trying pattern rule with stem `scsi_module.c'.
       Trying implicit dependency `SCCS/s.scsi_module.c'.
       Trying pattern rule with stem `scsi_module'.
       Trying implicit dependency `scsi_module.w'.
       Looking for a rule with intermediate file `scsi_module.w'.
        Avoiding implicit rule recursion.
        Trying pattern rule with stem `scsi_module.w'.
        Trying implicit dependency `scsi_module.w,v'.
        Trying pattern rule with stem `scsi_module.w'.
        Trying implicit dependency `RCS/scsi_module.w,v'.
        Trying pattern rule with stem `scsi_module.w'.
        Trying implicit dependency `RCS/scsi_module.w'.
        Trying pattern rule with stem `scsi_module.w'.
        Trying implicit dependency `s.scsi_module.w'.
        Trying pattern rule with stem `scsi_module.w'.
        Trying implicit dependency `SCCS/s.scsi_module.w'.
       No implicit rule found for `scsi_module.c'.
       Finished dependencies of target file `scsi_module.c'.
      No need to remake target `scsi_module.c'.
      Considering target file `dummy'.
       File `dummy' does not exist.
       Finished dependencies of target file `dummy'.
      Must remake target `dummy'.
      Successfully remade target file `dummy'.
     Finished dependencies of target file `53c7xx.o'.
     Dependency `53c7xx_d.h' is older than dependent `53c7xx.o'.
     Dependency `53c7xx.c' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/module.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/types.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/setup.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/dma.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/io.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/system.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/delay.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/signal.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/sched.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/errno.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/proc_fs.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/string.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/malloc.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/vmalloc.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/mm.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/ioport.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/time.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/blk.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/spinlock.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/pgtable.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/irq.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/pgtable.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/pgtable.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/config/gecko/lasi.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/asm/gsc.h' is older than dependent `53c7xx.o'.
     Dependency `scsi.h' is older than dependent `53c7xx.o'.
     Dependency `hosts.h' is older than dependent `53c7xx.o'.
     Dependency `53c7xx.h' is older than dependent `53c7xx.o'.
     Dependency `constants.h' is older than dependent `53c7xx.o'.
     Dependency `sd.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/stat.h' is older than dependent `53c7xx.o'.
     Dependency `/linux/linux/include/linux/stddef.h' is older than dependent `53c7xx.o'.
     Dependency `53c7xx_d.h' is older than dependent `53c7xx.o'.
     Dependency `53c7xx_u.h' is older than dependent `53c7xx.o'.
     Dependency `scsi_module.c' is older than dependent `53c7xx.o'.
     Dependency `dummy' does not exist.
    Must remake target `53c7xx.o'.
make[3]: Entering directory `/linux/linux/drivers/scsi'
...

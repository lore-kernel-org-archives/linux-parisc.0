Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 411DF4857
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 01:00:41 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 28CCC298054
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 01:00:37 -0600 (MDT)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 03438-03 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 01:00:35 -0600 (MDT)
Date: Wed, 14 Apr 2004 01:00:35 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040414070035.GB2657@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PA8800 support issues
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,
I just committed the first bit of PA8800 support while poking
at a cast off PA8800 prototype.  In addition to problems described
below, I need to fix (at least) two issues in sba_iommu driver:
1) need to add ZX1 IODC values so sba_probe() will claim the IOC(s)
2) IOVA is not zero based (we think) - need to read that from ZX1
   chips and use it to mask/OR values where we convert iopdir
   indexes to/from IOVAs.

But we haven't gotten that far yet.
The palinux kernel is now panicing nicely here:
...
Determining PDC firmware type: 64 bit PAT.
model 000088a0 00000491 00000000 00000002 d4936494c9f85489 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/785/C8000
Only equivalent aliasing supported
Kernel panic: SMP kernel required to avoid non-equivalent aliasing
In idle task - not syncing

This corresponds to arch/parisc/kernel/cache.c:
...
        if ((boot_cpu_data.pdc.capabilities & PDC_MODEL_NVA_MASK) ==
                                                PDC_MODEL_NVA_UNSUPPORTED) {
                printk(KERN_WARNING "Only equivalent aliasing supported\n");
#ifndef CONFIG_SMP
                panic("SMP kernel required to avoid non-equivalent aliasing");
#endif
        }


The PAT PDC ERS describes NVA bits like this:

| The NVA (Non-equivalent Virtual Aliasing) field is a two bit field
| which indicates whether non-equivalent virtual aliasing is supported
| on the platform, and if so, if it has a performance impact. NVA field
| values are shown in the following table:
| Key / Description
| 0b00 / Non-equivalent aliasing supported without performance penalty.
| 0b01 / Non-equivalent aliasing supported with performance penalty.
| 0b10 / Reserved
| 0b11 / Non-equivalent aliasing not supported. Data corruption or HPMCs
         may result.
| Superdome will set the NVA bits to 0b11.

And apperently PA8800 on ZX1.

So what are my choices?
1) get SMP working on 2.6.x
	o already working on that but can't figure out why set_bit()
          is crashing my single CPU a500.
	o long term, we still want to run UP kernels to narrow down SW bugs.
2) hack VM support so whatever magic makes NVA work on SMP=y is a
   build time option that works when CONFIG_SMP=n as well.
 	o way beyond my skill set and time I've got to hack on palinux. 
	o may not be feasible...

Any other ideas?


BTW, I found one more bit of documentation relevant to
non-equivalent aliases:
| PA-RISC, version 1.1, edition 3, described updated rules for
| non-equivalent aliasing in order to support Tornado in KittyHawk.
| In truth, Tornado did not require that those aliasing rules be strictly
| enforced, since it was overdesigned to increase debugability. However,
| any PA-RISC processor interfacing to a shared Merced bus definition
| requires strict adherence to those aliasing rules.
|
| Specifically, if a load miss transaction is ever issued that finds both
| a Shared copy and a Dirty copy of the same line, the transaction will
| hang in the snoop phase, until the transaction times out and crashes
| the system. This situation can be caused by allowing non-equivalent
| read translations to exist while there is an existing write translation,
| or by not flushing all dirty data out of the caches (and Syncing) before
| re-enabling the read translations. Flush-only translations, however,
| are safe, since it is illegal to respond Shared to a flush transaction.

I'm hoping that's relevant to the current work on better cache support.

thanks,
grant

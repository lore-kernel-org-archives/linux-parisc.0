Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA07621
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Feb 2000 00:09:12 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (Postfix) with ESMTP id EEF62C6D
	for <parisc-linux@thepuffingroup.com>; Wed,  9 Feb 2000 01:04:11 -0500 (EST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id WAA12699 for parisc-linux@thepuffingroup.com; Tue, 8 Feb 2000 22:05:07 -0800 (PST)
Date: Tue, 8 Feb 2000 22:05:07 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200002090605.WAA12699@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] ld: Unsatisfied symbols
List-ID: <linux-parisc.vger.kernel.org>


Hi folks,

The current tree builds and *almost* links.
(except for block/rd.c; used -rlinus2342 version)

ld: Unsatisfied symbols:
   up_read (code)
   uts_sem (data)
   get_task_struct (code)
   up_write (code)
   down_write (code)
   down_read (code)


get_task_struct (code)
	Other arches define get_task_struct() in include/asm/processor.h.
	We probably should too.
	I have only 1/2 a clue what it's supposed to do.

uts_sem (data)
	include/linux/utsname.h: extern struct rw_semaphore uts_sem;
	kernel/ksyms.c: EXPORT_SYMBOL(uts_sem);          /* UTS semaphore */
	kernel/sys.c:  DECLARE_RWSEM(uts_sem);

	Seems like another SOM kluge is needed.
	Or "DECLARE_RWSEM()" needs to be hacked for SOM.
	If someone knows where such "data" kluges are collected,
	please either fix it or let me know so we can keep such kluges
	all in one place.

up_read
up_write
down_read
down_write
	We seem to need them in asm-parisc/semaphore.h.
	I gather this is some form of R/W semaphore.
	Anyone who knows more is encouraged to make it happen.


FYI: I fixed the init_ext2_fs (code) and pcibios_enable_device() problems.

o init_ext2_fs() is declared "static" in fs/ext2/super.c but we have to invoke
  it directly in main.c because module_init(init_ext2_fs) can't work (yet).
  (because we are using SOM - not ELF - binaries.)

o pcibios_enable_device() *was* defined in drivers/pci/setup.c.
  But in 2.3.42,  setup.c no longer exists - split up into three files.
  pcibios_enable_device() moved to the arch specific code.
  (ie arch/parisc/kernel/pci.c)

later,
grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id D83E54A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Mar 2001 20:45:13 -0700 (MST)
Sender: rbrad@dsl2.external.hp.com
Message-ID: <3AA1BA3F.A7C79E31@uswest.net>
Date: Sat, 03 Mar 2001 20:45:03 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sym53c8xx driver with 64-bit kernel on C200.
List-ID: <linux-parisc.vger.kernel.org>

Hello parisc-linux hackers,

I have been working on writing the PDC Translation functions so a 64-bit

kernel will run using 32-bit firmware.  I believe I have this done, and
I
am trying to verify my work by actually booting my C200 with a 64-bit
kernel.  Currently I am stuck in the sym53c8xx driver with a HPMC that
I am unable to debug and was hopeing someone on this list could provide
some insight, help debugging, etc.

I have located the single command that causes the HPMC in the
ncr_snooptest function.

This is the scsi boot output:

SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER...(fix-up)
sym53c8xx: 53c875 detected
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 195
sym53c875-0: NCR clock is 40401KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xfffffffff2ffe000

 /*
 ** Start script (exchange values)
 */
 OUTL (nc_dsa, np->p_ncb);
 OUTL (nc_dsp, pc);         <-- This line of code causes the HPMC
 /*
 ** Wait 'til done (with timeout)
 */
 for (i=0; i<NCR_SNOOP_TIMEOUT; i++)
  if (INB(nc_istat) & (INTF|SIP|DIP))
   break;
 /*

When I run OUTL(nc_dsp,pc) through the preprocessor the statement gets
expanded into this:

_gsc_writel(((__builtin_constant_p((__u32)((((pc))))) ? ({ __u32 __x =
(((((pc))))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |
(((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) &
(__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >>
24) )); }) : __fswab32(((((pc))))))),(void *)((char *)np->reg +
(((size_t) &((struct ncr_reg *)0)->nc_dsp))));

The chassis codes for this HPMC are:
    0xcbf0          HPMC Occurred
    0x5002         Path Error: Processor 0
    0x7d03         Memory MSI read timeout
    0x5402         Path Error: IOA0
    0x5508         Broadcast Error: IOA1
    0xcbf4          Invalid HPMC checksum
    0xcbfc           PDCE_HPMC proccessing complete, but failed to branc
to OS_HPMC, halt this CPU

If I comment out that specific line of code, the cache test will fail,
but the boot process continues.
Here is the scsi output with the OUTL(nc_dsp,pc) commented out:

SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER...(fix-up)
sym53c8xx: 53c875 detected
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 195
sym53c875-0: NCR clock is 40401KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xfffffffff2ffe000
CACHE TEST FAILED: timeout.
CACHE INCORRECTLY CONFIGURED.
sym53c875-0: giving up ...
sim700: Configuring 53c710 (SCSI-ID 7) at ffffffffffd06100, IRQ 150,
options 0
scsi0: Revision 0x2

The sim700 HPMC is caused by the following line of code in the
sim700_init_host function.

#if 1
    NCR_write32(DSP_REG, TARGDATA(HOST_ID)->ba->script+Ent_test1/4+3);
<-- This line of code causes the HPMC
#else
    NCR_write32(DSP_REG, TARGDATA(HOST_ID)->ba->script+Ent_test1/4);
#endif

When I run the NCR_write32 line through the preprocessor the statement
gets expanded into this:

{ unsigned long a = (unsigned long)(host->base) + (unsigned long)(0x2c);
u32 v = (hostdata->options & 0x00000001) ?
(__builtin_constant_p((__u32)(((u32)(((struct sim700_target *)
(hostdata->targets + ((7) << 12)))->ba->script+0x000004a0/4+3)))) ? ({
__u32 __x = ((((u32)(((struct sim700_target *) (hostdata->targets + ((7)
<< 12)))->ba->script+0x000004a0/4+3)))); ((__u32)( (((__u32)(__x) &
(__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) <<
8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) &
(__u32)0xff000000UL) >> 24) )); }) : __fswab32((((u32)(((struct
sim700_target *) (hostdata->targets + ((7) <<
12)))->ba->script+0x000004a0/4+3))))) : (u32)(((struct sim700_target *)
(hostdata->targets + ((7) << 12)))->ba->script+0x000004a0/4+3); if
(sim700_debug & 0x0002) printk("NCR: %08x => %lx\n", v, a);
_gsc_writel((v),(void *)(a)); };


Also, the HPMC chassis codes are identical to the sym53c8xx problem.


Following the previous idea of commenting out the offending lines
produces this as the scsi boot up code:

SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER...(fix-up)
sym53c8xx: 53c875 detected
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 195
sym53c875-0: NCR clock is 40401KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xfffffffff2ffe000
CACHE TEST FAILED: timeout.
CACHE INCORRECTLY CONFIGURED.
sym53c875-0: giving up ...
sim700: Configuring 53c710 (SCSI-ID 7) at ffffffffffd06100, IRQ 150,
options 0
scsi0: Revision 0x2
Post test1, istat 00, sstat0 00, dstat 80
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: test 1 FAILED: dsps: exp 0xab93001d, got 0x00000000
scsi0: Chip register contents:
 (script[0] at virt 0000000011f20000, bus a8000)
 00  sien:  af  sdid:  00  scntl1:20  scntl0:cc
 04  socl:  00  sodl:  00  sxfer: 00  scid:  80
 08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
 0C  sstat2:00  sstat1:00  sstat0:00  dstat: 80
 10  dsa:   00000000
 14  ctest3:df  ctest2:21  ctest1:f0  ctest0:00
 18  ctest7:90  ctest6:00  ctest5:00  ctest4:00
 1C  temp:  00000000
 20  lcrc:  00  ctest8:20  istat: 02  dfifo: 00
 24  dbc:   00000000  dnad:  00000000  dsp:   00000000
 30  dsps:  00000000  scratch:00000000
 38  dcntl: c1  dwt:   00  dien:  3d  dmode: e0
 3C  adder: 00000000
Warning : device (10, 0x56, 0x0, 0x82, 0x0) NOT claimed by Lasi SCSI
53c710
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 67
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential

I have not taken this any further .... I just wanted to demonstrate that
line of code was causing the
HPMC.

Does anyone have any ideas on what might be causing this?  Any pointers
on how to continue
debugging this problem?

Thanks,

- Ryan

P.S. I have quite a bit of code in my local tree reguarding the
PDC translation and some 64-bit
driver cleanups.  I have been working on committing the 64-bit driver
cleanups ... I would
like to wait until I see the 64-bit kernel boot on the C200 before
I commit the PDC translation
code.  If anyone wants a patch from my local tree for the
PDC translation stuff, send me
email and I'll produce them a patch.

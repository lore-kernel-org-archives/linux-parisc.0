Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 246C7482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 15:27:53 -0700 (MST)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id g0TMRu404338
	for parisc-linux@lists.parisc-linux.org; Tue, 29 Jan 2002 17:27:56 -0500
Date: Tue, 29 Jan 2002 17:27:56 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020129172756.J1945@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sim700 Driver and 715/50's
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

parisc'ers,

I was recently playing with the SCSI drivers for the
LASI and without much sucess on some fronts.

After staring at some source for a few minutes, I changed
CONFIG_SCSI_LASI700 to CONFIG_SCSI_LASI to get the
older sim700 driver to compile for the latest kernel.

This is really only phase 1 of 2 steps:

1. Test new kernel with old driver
2. Test new kernel with new driver (but with tag queue tweaks)

The reason was to determine:

a. Random hangs on 715/50's (attributed to scsi driver)
	= Diskless nodes just keep on trucking.
b. Why certain scsi drives failed to work with new 53c700
   driver, but work with the old sim700.

--- Kernel with CONFIG_SCSI_LASI gives ---

sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
scsi0: test 1 FAILED: dsps: exp 0xab93001d, got 0x00000002
scsi0: Chip register contents:
 (script[0] at virt 10070000, bus 70000)
 00  sien:  af  sdid:  00  scntl1:20  scntl0:c4
 04  socl:  02  sodl:  00  sxfer: 00  scid:  80
 08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
 0C  sstat2:00  sstat1:00  sstat0:00  dstat: 80
 10
 14  ctest3:ae  ctest2:31  ctest1:f0  ctest0:00
 18  ctest7:00  ctest6:da  ctest5:00  ctest4:00
 1C  temp:  00000000
 20              ctest8:ff  istat: 04  dfifo: 00
 24  dbc:   00000002  dnad:  00000002  dsp:   080774ac
 30  dsps:  00000002
 34  dmode: 80
 38  dcntl: 80  dwt:   00  dien:  1d
 3C
scsi0: could not halt NCR chip, stage 2
Warning : device (10, 0xb, 0x0, 0x71) NOT claimed by Lasi SCSI

Tested on another machines also gives:

sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
scsi0: test 1 FAILED: dsps: exp 0xab93001d, got 0x00000002
scsi0: Chip register contents:
 (script[0] at virt 10070000, bus 70000)
 00  sien:  af  sdid:  00  scntl1:20  scntl0:c4
 04  socl:  02  sodl:  00  sxfer: 00  scid:  80
 08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
 0C  sstat2:00  sstat1:00  sstat0:00  dstat: 80
 10
 14  ctest3:00  ctest2:21  ctest1:f0  ctest0:00
 18  ctest7:00  ctest6:00  ctest5:00  ctest4:00
 1C  temp:  00000000
 20              ctest8:ff  istat: 04  dfifo: 00
 24  dbc:   00000002  dnad:  00000002  dsp:   080774ac
 30  dsps:  00000002
 34  dmode: 80
 38  dcntl: 80  dwt:   00  dien:  1d
 3C
scsi0: could not halt NCR chip, stage 2
Warning : device (10, 0x7, 0x0, 0x71) NOT claimed by Lasi SCSI

I'm not really sure what is going on here?

Does this mean:

- sim700 driver is not quite working proplerly with new kernel

I'm going to move into my second phase of testing, and
see if the new driver can hack it :)

Any suggestions would be appreciated.

c.

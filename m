Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8A764943
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Mar 2004 23:29:39 -0700 (MST)
Date: Tue, 9 Mar 2004 06:29:35 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Results of (IDE) kernel tests with modified io.c
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

I finally made the kernels tests I promised.
Sorry it took so long, but my serial null-modem cable was broken and I
had to get a new one ...


About the test:
---------------
It seems that currently Linux/PA-RISC doesn't support IDE-hard disks
with anything other than the onboard NS87415 chip of the B/Cxxx0.
Furthermore it seems that the onbard chip also doesn't use DMA
transfers and works for me only with 2.4 kernels.

Therefore I tried a Silicon Image Si680 PCI IDE controller, and a
Promise Ultra100 TX2 PCI IDE controller with both 2.4 and 2.6 kernels and
they didn't work either.


Recent discussions on p-l led to the assumption that io.c may be
broken and tests with a modified arch/parisc/io.c would be helpful.
Therefore I took out all references to leXX_to_cpu and cpu_to_leXX in io.c
and built various kernels and ran them.

I created four 2.4.25-pa0 kernel with the following configs:

- one with support for onboard NS87415 of my C3000
- one using the (new) Promise PDC202{68|69|70|71|75|76|77} driver
- one using the (old) Promise PDC202{46|62|65|67} driver
- one using the siimage driver

And then I did the same for the 2.6.4-rc1-pa1 kernel (also four configs).

N.B.
- I enabled "Use PCI DMA by default when available" for all kernels.
- I did a CVS update at March 03 22:00 GMT (for both 2.4 and 2.6 kernel
  sources) before built the kernels.
- The Silicon Image PCI card and the Promise PCI card where put in
  a PCI 33MHz slot (only one card at a time)
- I'm using a Seagate ST311022A 120GB IDE hard drive to test
  the IDE controllers.


Test results:
-------------

linux-2.4.25-pa0-io:
   - detects IDE controller: "NS87415: 100% native mode on irq 103"
   - detects hard disk wrongly as "TS130220A2", no access possible
   - NO "hda: lost interrupt" messages on boot up
   - NOTE: the unpatched vanilla kernel was correctly identifying hard
     disk as "ST3120022A" and also detects partitions correcty.
     works fine, but with merely 3.3 MB/s (obviously no DMA transfer used)

linux-2.4.25-pa0-io-promise:
   - detects IDE controller:
        "PDC20268: not 100% native mode: will probe irqs later"
   - detects hard disk wrongly as "TS130220A2", no access possible
   - "hda: lost interrupt" messages
   - NOTE: the unpatched vanilla kernel was correctly identifying hard
     disk as "ST3120022A" and also detects partitions correcty.
     However access is very slow (e.g. fdisk takes minutes), seems like
     problems with interrupts

linux-2.4.25-pa0-io-promiseold:
   - Stack dump while trying to detect IDE controller

linux-2.4.25-pa0-io-siimage:
   - detects IDE controller:
       "SiI680: not 100% native mode: will probe irqs later"
   - detects hard disk wrongly as "TS130220A2", no access possible
   - "hda: lost interrupt" messages
   - NOTE: the unpatched vanilla kernel was also identifying the hard disk
     wrongly as "TS130220A2"!

linux-2.6.4-rc1-pa1-io:
   - detects IDE controller: "NS87415: 100% native mode on irq 103"
   - detects hard disk wrongly as "TS130220A2", no access possible
   - stops booting with "Kernel panic: ide: default attach failed"
   - NOTE: an slightly older (unpatched) vanilla kernel was correctly
     identifying  hard disk as "ST3120022A" and also detects partitions
     correcty, but I wasn't able to use the hard disk
     (IIRC "lots interrupt" messages; sorry I didn't find a boot log)

linux-2.6.4-rc1-pa1-io-promise:
   - detects IDE controller: "PDC20268: 100% native mode on irq 128"
   - detects hard disk wrongly as "TS130220A2", no access possible
   - stops booting with "Kernel panic: ide: default attach failed"
   - NOTE: an unpatched, vanilla 2.6.3-pa2 kernel was correctly
     identifying hard disk as "ST3120022A" and also detects partitions correcty,
     but with lots of "lots interrupt messages"

linux-2.6.4-rc1-pa1-io-promiseold:
   - Stack dump while trying to detect IDE controller

linux-2.6.4-rc1-pa1-io-siimage:
   - detects IDE controller: "SiI680: 100% native mode on irq 128"
   - detects hard disk wrongly as "TS130220A2", no access possible
   - stops booting with "Kernel panic: ide: default attach failed"
   - NOTE: an unpatched, vanilla 2.6.0-test11-pa2 kernel was also
     identifying the hard disk wrongly as "TS130220A2", but stopped with
     "Your System ate a SPARC!"


The configs, boot logs and System.maps and the modified io.c can be found
here: http://www.cs.ucc.ie/~xam/io/

Some reports of old tests with unpatched kernels can be found in my
previous mails (search the p-l archive), and some info is also here:
http://www.cs.ucc.ie/~xam/siimage/
http://www.cs.ucc.ie/~xam/promise/


Hope that helps,
  Max

Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B7154843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 25 Feb 2004 17:52:41 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.12.10/8.12.10) with ESMTP id i1Q0qd5a024642
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Feb 2004 00:52:39 GMT
Date: Thu, 26 Feb 2004 00:52:37 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

It's me again ;)
As so often, I try to get a IDE hard disk working on Linux/PA-RISC.

My last attempts failed (using a no-name IDE controller based on the
Silicon Image Si-680 chipset).

It occurs to me that the driver has some big endian issues (and probably
some other issues aswell). I've given up hope to get it working after
I didn't receive any replies from the maintainer, linux-ide or even lkml.


Now I stumbled across several messages (on the parisc-linux mailing list)
of users who want to get Promise IDE controllers working in Linux/PA-RISC.
Since this type of IDE controller is obviously much more popular, and
since it appears to work on PPC, I thought it is "promising" to try it ;)

NB.:
I'm still using the same Seagate ST312022A hard disk (20GB IDE Ultra100)
It works fine under 2.4 and the onboard IDE of the C3k, but only at
about 3MB/s, since DMA is not working.
I still haven't gotten any success with the 2.6 kernel to work with the
onboard IDE controller (tried with and without DMA support).


First of all, I have the same symptoms on both 2.4.25-pa0 and 2.6.3-pa2:

- I get LOTS of "hda: lost interrupt messages"

- trying to access the hda is slow or hangs the process trying to access
  the IDE hard disk (and results in issuing the above mentioned messages)

- the hard disk is eventually detected correctly on boot up
  (but it takes long time - minutes - and many "hda: lost interrupt" messages)

- fdisk shows the correct information about the partitions

- using "ide=nodma", "hda=nodma" and "nodma" as kernel options doesn't
  make any difference.


So far it seems that the driver is 'somewhat' working, but it has
some kind of 'interrupt conflict', ie. it has the typical symptoms of it
(and of course the warning messages indicate that aswell).

Looking at the lkml and googling around suggested it might be related with
DMA not working, therefore I tried to disable it; no difference.
Other than that I didn't find any other clues.



BTW, linux-2.6.3-pa2 tells

---
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
PDC20268: IDE controller at PCI slot 0000:03:02.0
PDC20268: chipset revision 2
PDC20268: ROM enabled at 0xf7004000
PDC20268: 100% native mode on irq 192
    ide0: BM-DMA at 0x3c000-0x3c007, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x3c008-0x3c00f, BIOS settings: hdc:pio, hdd:pio
hda: ST3120022A, ATA DISK drive
---

whereas linux-2.4.25-pa0 said instead

"PDC20268: not 100% native mode: will probe irqs later"

(but the rest is basically the same)


One very interesting thing is that the "hda: lost interrupt" messages
also appeared when I tried the siimage IDE controller on 2.4 kernels!
(see http://www.cs.ucc.ie/~xam/siimage/bootlog-2.4.23-pa3.txt)
Perhaps the siimage problem might be related to this problem?

Any suggestions what could be the problem or how to debug it any further?


Thanks,
  Max


PS: 2.6.3-pa2 boot log can be found here:
http://www.cs.ucc.ie/~xam/promise/bootlog-2.6.3-pa2

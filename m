Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65DC24837
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 13:16:48 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by interzone.ucc.ie (8.9.3/8.9.3) with ESMTP id UAA03676
	for <parisc-linux@lists.parisc-linux.org>; Tue, 2 Jul 2002 20:16:55 +0100 (BST)
Date: Tue, 2 Jul 2002 20:16:47 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0207021953230.16680-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C240 and PCI (PC) graphics card
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

Hi,

I just tested a Voodoo3 3000 (PCI, 16MB SGRAM, universal PCI signaling)
in my C240 without success.

Obviously I can't use the Linux-FB drivers since they expect that the
graphics card was initialized by a PC BIOS. Therefore I (re)compiled -pa45
(32bit, PA8000, unofficial modutils-deb; thanks Grant!) without STIcon,
STI-fb or any other Framebuffer device.

I took out the Visualize-FX2 (in a PCI 64bit slot) and replaced it with
the Voodoo. After a reboot I could see the Voodoo card in /proc (device
PCI:1:4:0), and even X -scanpci found it. Unfortunately when trying to
start X it reported an error (attached: XFree86.0.log, pci64.txt).

Therefore I put the Voodoo card into a 'normal' PCI (32bit) slot. The
device is now PCI:0:3:0, the IO-ports changed and now XFree seemed to
be able to use it (X -probeonly worked), but whenever I started X it
crashed and the Monitor remained dark. Not only X crashes (at a random
point at initialization), but it causes a HPMC (attached files: hpmc.txt,
hpmc2.txt, pci.txt).

Since the Voodoo is found by the kernel and XFree86, it seems that this
card is h/w compatible, but there is some (hopefully small) software issue
that prevents it from working correctly.

Does anybody have a hint what's going wrong here ?
Or does anybody have a (PC, non-HP) PCI card that works on Linux/PARISC ?
Why is the card not working in a 64bit slot ?

Thanks in advance for your answers,

greetings max


PS: if I can't use the Voodoo in my HP, I'll put it in my Alpha ...

Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95A1548EB
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 00:29:13 -0700 (MST)
Date: Mon, 8 Mar 2004 23:29:17 -0800
From: Randolph Chung <randolph@tausq.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Results of (IDE) kernel tests with modified io.c
Message-ID: <20040309072917.GN1113@tausq.org>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> But what I'm wondering about is why the Silicon Image driver
> (always) detects the Seagate ST311022A hard drive as "TS130220A2".
> Since it uses mmio instead of PIO as the other drivers, maybe there is
> some big-endian problem in the Linux/PA-RISC mmio code? But then this
> problem must be somewhere in the IDE code, since all mmio in general
> seems to be working fine!

oh, for mmio you need to fix the macros in include/asm-parisc/ide.h. the
ones in io.c are for pio access. the mmio ones are new, i think, and 
haven't been fixed properly (__ide_mm_insw, etc) -- you can try 
replacing readw with __raw_readw, etc.

can you also try the native-mode fixup? something like this (sorry 
it's not in patch format, my tree is a bit of a mess right now and it's
late....)

in arch/parisc/kernel/pci.c, change:

struct pci_fixup pcibios_fixups[] = {
        { PCI_FIXUP_HEADER, PCI_ANY_ID, PCI_ANY_ID, parisc_fixup_ide },
        { 0 }
};

parisc_fixup_ide is something like this:

static void __devinit parisc_fixup_ide(struct pci_dev *dev)
{
    u8 prog;

    if ((dev->class >> 8) != PCI_CLASS_STORAGE_IDE)
        return;

    pci_read_config_byte(dev, 8, &prog);
    pci_write_config_byte(dev, 8, prog | 0x5);
    dev->class |= 0x5;
}

not tested, YMMV :)

Grant tells me that he suspects there's a bug somewhere in the pci
config accessor functions tho... on my box i saw that, using something
similar to the above sequence, i read 0x8a into prog (this is the 
default), but after the write if i read it again the value is still 
0x8a :(

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

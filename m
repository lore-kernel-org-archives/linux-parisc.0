Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5557E486E
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 02:07:22 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
Date: Mon, 19 Jan 2004 10:07:19 +0100
References: <200401182059.34270.deller@gmx.de>
	<1074469497.1805.25.camel@mulgrave>
In-Reply-To: <1074469497.1805.25.camel@mulgrave>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Message-Id: <200401191007.19929.deller@gmx.de>
Cc: James Bottomley <James.Bottomley@steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Monday 19 January 2004 00:44, James Bottomley wrote:
> On Sun, 2004-01-18 at 14:59, Helge Deller wrote:
> > Dino fff80000: stuck interrupt 4
> > cs IO ports 0x0-0x7 allocated in parent Dino I/O Port
> 
> Erk, I assume this is a yenta socket with two PCMCIA slots?

Yes.
 
> I wasn't sure what the setting should be when I constructed the code in
> the pa patch set (I only did it to get my PCI<->cardbus bridge working
> with a single slot yenta PCI card).
> 
> What information does the Yenta driver print?

dmesg gives:
Dino parisc8:0 version 3.1 found at 0xfff80000
PCI: Bus 1, cardbus bridge: 0000:00:02.0
PCI: Bus 5, cardbus bridge: 0000:00:02.1
SCSI subsystem initialized
Linux Kernel Card Services
  options:  [pci] [cardbus]
....
Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
Yenta: ISA IRQ mask 0x0000, PCI irq 98
Socket status: 30000007
Yenta: CardBus bridge found at 0000:00:02.1 [0000:0000]
Yenta: ISA IRQ mask 0x0000, PCI irq 99
Socket status: 30000007

rdi:~# lspci -v
00:02.0 CardBus bridge: Cirrus Logic PD 6832 PCMCIA/CardBus Ctrlr (rev c1)
        Flags: bus master, medium devsel, latency 168, IRQ 98
        Memory at f0800000 (32-bit, non-prefetchable) [size=4K]
        Bus: primary=00, secondary=01, subordinate=04, sec-latency=176
        Memory window 0: f0900000-f09ff000
        Memory window 1: f0a00000-f0aff000
        I/O window 0: 00000400-000004ff
        I/O window 1: 00000800-000008ff
        16-bit legacy interface ports at 0001

00:02.1 CardBus bridge: Cirrus Logic PD 6832 PCMCIA/CardBus Ctrlr (rev c1)
        Flags: bus master, medium devsel, latency 168, IRQ 99
        Memory at f0801000 (32-bit, non-prefetchable) [size=4K]
        Bus: primary=00, secondary=05, subordinate=08, sec-latency=176
        Memory window 0: f0b00000-f0bff000
        Memory window 1: f0c00000-f0cff000
        I/O window 0: 00000c00-00000cff
        I/O window 1: 00001000-000010ff


Helge

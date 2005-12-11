From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 19:55:09 +0100
Message-ID: <200512111955.09892.deller@gmx.de>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051211175004.GA22449@colo.lackof.org>
	<1134324062.3367.9.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: parisc-linux@lists.parisc-linux.org,
 Russell King <rmk+pcmcia@arm.linux.org.uk>,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1134324062.3367.9.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 11 December 2005 19:01, James Bottomley wrote:
> Well, I pulled out the mem probe and left in the PCMCIA_PROBE config
> setting based on !PARISC.
> 
> Everything seems to work.  Here's the relevant dmesg output 
> Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
> PCI: Bus 1, cardbus bridge: 0000:00:02.0
>   IO window: 00000400-000005ff
>   IO window: 00000800-000009ff
>   PREFETCH window: f0c00000-f0ffffff
>   MEM window: f0900000-f09fffff
> Yenta: Enabling burst memory read transactions
> Yenta: Using CSCINT to route CSC interrupts to PCI
> Yenta: Routing CardBus interrupts to PCI
> Yenta TI: socket 0000:00:02.0, mfunc 0x00000000, devctl 0x66
> Yenta TI: socket 0000:00:02.0 probing PCI interrupt failed, trying to
> fix
> Yenta TI: socket 0000:00:02.0 falling back to parallel PCI interrupts
> Yenta TI: socket 0000:00:02.0 parallel PCI interrupts ok
> Yenta: ISA IRQ mask 0x0000, PCI irq 23
> Socket status: 30000010
> pcmcia: parent PCI bridge I/O window: 0x0 - 0xffff
> pcmcia: parent PCI bridge Memory window: 0xf0800000 - 0xf0ffffff
> pccard: PCMCIA card inserted into slot 0
> [...]
> cs: memory probe 0xf0800000-0xf0ffffff: excluding 0xf0800000-0xf087ffff
> 0xf0900000-0xf09fffff 0xf0c00000-0xf0ffffff
> pcmcia: registering new device pcmcia0.0
>
> As you can see, we do get the cis memory probe occuring within the
> correct boundaries now.
> 
> Helge, I think the next test is over to you, could you see how CVS tree
> head fares on your tadpole?

Hi James,

Seems ok, but I still have the "stuck IRQ" problem:

Dec 11 19:46:11 rdi kernel: Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
Dec 11 19:46:11 rdi kernel: PCI: Bus 1, cardbus bridge: 0000:00:02.0
Dec 11 19:46:11 rdi kernel:   IO window: 00000400-000005ff
Dec 11 19:46:11 rdi kernel:   IO window: 00000800-000009ff
Dec 11 19:46:11 rdi kernel:   PREFETCH window: f0c00000-f0ffffff
Dec 11 19:46:11 rdi kernel:   MEM window: f0900000-f09fffff
Dec 11 19:46:12 rdi kernel: Dino 0xfff80000: stuck interrupt 2
Dec 11 19:46:12 rdi last message repeated 7 times
Dec 11 19:46:12 rdi kernel: Yenta: ISA IRQ mask 0x0000, PCI irq 25
Dec 11 19:46:12 rdi kernel: Socket status: 30000007
Dec 11 19:46:12 rdi kernel: pcmcia: parent PCI bridge I/O window: 0x0 - 0xffff
Dec 11 19:46:12 rdi kernel: pcmcia: parent PCI bridge Memory window: 0xf0800000 - 0xf0ffffff
Dec 11 19:46:12 rdi kernel: Yenta: CardBus bridge found at 0000:00:02.1 [0000:0000]
Dec 11 19:46:12 rdi kernel: PCI: Bus 5, cardbus bridge: 0000:00:02.1
Dec 11 19:46:12 rdi kernel:   IO window: 00000c00-00000dff
Dec 11 19:46:12 rdi kernel:   IO window: 00001000-000011ff
Dec 11 19:46:12 rdi kernel:   PREFETCH window: f0a00000-f0afffff
Dec 11 19:46:12 rdi kernel:   MEM window: f0b00000-f0bfffff
Dec 11 19:46:12 rdi kernel: Dino 0xfff80000: stuck interrupt 4
Dec 11 19:46:12 rdi last message repeated 7 times
Dec 11 19:46:12 rdi kernel: Yenta: ISA IRQ mask 0x0000, PCI irq 26
Dec 11 19:46:12 rdi kernel: Socket status: 30000811
Dec 11 19:46:12 rdi kernel: pcmcia: parent PCI bridge I/O window: 0x0 - 0xffff
Dec 11 19:46:12 rdi kernel: pcmcia: parent PCI bridge Memory window: 0xf0800000 - 0xf0ffffff
Dec 11 19:46:13 rdi kernel: pccard: PCMCIA card inserted into slot 1

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

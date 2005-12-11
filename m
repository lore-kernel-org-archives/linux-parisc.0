From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 09:14:33 -0600
Message-ID: <1134314073.3367.5.camel@mulgrave>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<1133829923.3262.1.camel@mulgrave>
	<20051206093643.GA1706@flint.arm.linux.org.uk>
	<1133876209.3267.2.camel@mulgrave>
	<20051207122129.GA31601@isilmar.linta.de>
	<20051211065023.GA7987@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Russell King <rmk+pcmcia@arm.linux.org.uk>,
 parisc-linux@lists.parisc-linux.org,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051211065023.GA7987@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2005-12-10 at 23:50 -0700, Grant Grundler wrote:
> Could post the /proc/iomem output?

Sure, it's below

> It just occurred to me that you shouldn't need to bring down the network.
> We can verify if an IO range resource didn't get parented correctly or
> otherwise failed to get registered.

Well, yes I do.  I still need to verify that the kernel works without
the probe prevention hack.  The problem years ago wasn't the parenting,
it was PCMCIA looking for things like ISA memory regions.  I know the
card currently gets the correct parenting and regions (because it
works).  The question is would it without the pcmcia hack?

James

00000000-1fffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-002b8fff : Kernel code
  002b9000-003efe0b : Kernel data
f0190001-f0190001 : led_data
f0800000-f0ffffff : Dino LMMIO 0
  f0800000-f0800fff : 0000:00:02.0
    f0800000-f0800fff : yenta_socket
  f0801000-f0801fff : 0000:00:13.0
    f0801000-f0801fff : sym53c8xx
  f0802000-f08020ff : 0000:00:13.0
    f0802000-f08020ff : sym53c8xx
  f0803000-f080307f : 0000:00:01.0
  f0804000-f080407f : 0000:00:14.0
    f0804000-f080407f : tulip
  f0805000-f0805fff : pcmcia_socket0
  f0900000-f09fffff : PCI CardBus #01
  f0a00000-f0afffff : PCI CardBus #01
f8000000-f8000fff : sti
f8100000-f84fffff : stifb mmio
f9000000-f917ffff : stifb fb
ffd00000-ffdfffff : Lasi
  ffd00000-ffd00fff : Lasi
  ffd05800-ffd05807 : serial
  ffd08000-ffd08fff : GSC PS2
fff80000-fffaffff : Central Bus
  fff80000-fff80fff : Dino
  fff83800-fff83807 : serial
fffb0000-fffdffff : Local Broadcast
  fffbe000-fffbefff : CPU
fffe0000-ffffffff : Global Broadcast


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

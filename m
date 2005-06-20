From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Mon, 20 Jun 2005 14:45:19 -0600
Message-ID: <200506201445.19818.bjorn.helgaas@hp.com>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<20050615190616.GA29652@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050615190616.GA29652@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 15 June 2005 1:06 pm, Grant Grundler wrote:
> The HPMC occurs when tridentfb.c tries to poke at:
>         if (chip_id == TGUI9660) {
>                 outb(RevisionID,0x3C4);
>                 revision = inb(0x3C5);
> ...	
> 
> This generally can't work on parisc.
> Only if the trident card is plugged in under PCI bus 0.
> The driver needs to map the hard coded address to some PCI resource.

0x3C4 and 0x3C5 are in the legacy VGA port range.  Does Astro have
programmable routing for that range?  If so, this could probably
be made to work with enough kernel support.  I'm working on some
similar stuff for ia64.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

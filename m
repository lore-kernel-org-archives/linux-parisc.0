From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Wed, 15 Jun 2005 13:06:16 -0600
Message-ID: <20050615190616.GA29652@colo.lackof.org>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "J. L. Lee" <jllee@singnet.com.sg>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jun 15, 2005 at 10:59:21PM +0800, J. L. Lee wrote:
...
> The B2000 booted past the initial RAM disk, discovered the built-in 
> hardware and the PCI Trident card, then disaster struck. Kernel panic after 
> the discovery of the Trident card.

Thanks for the good problem description - I know those take a long
time to write up.

But this isn't a "kernel panic" - it's a "High Priority Machine Check" (HPMC).
The difference is the platform chipset detected an error vs something
in the kernel. Fortunately the register dump and other console
output gives enough clues.
The HPMC occurs when tridentfb.c tries to poke at:
        if (chip_id == TGUI9660) {
                outb(RevisionID,0x3C4);
                revision = inb(0x3C5);
...	

This generally can't work on parisc.
Only if the trident card is plugged in under PCI bus 0.
The driver needs to map the hard coded address to some PCI resource.
What does your "lspci -v" output say?

You could hack around this with "#ifndef CONFIG_PARISC"
and hardcode the "chip_id" to the model you have.
You could then find out if the rest of the code has a chance of working.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

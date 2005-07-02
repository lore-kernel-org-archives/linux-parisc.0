From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Sat, 2 Jul 2005 01:44:42 -0600
Message-ID: <20050702074442.GB14091@colo.lackof.org>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<5.1.1.6.1.20050701204720.02abaec0@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "J. L. Lee" <jllee@singnet.com.sg>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050701204720.02abaec0@pop.singnet.com.sg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 01, 2005 at 08:55:21PM +0800, J. L. Lee wrote:
> >Only if the trident card is plugged in under PCI bus 0.
> >The driver needs to map the hard coded address to some PCI resource.
> >What does your "lspci -v" output say?

Lee,
Can you please post the "lspci -v" output?

> Pls adv if by 'PCI bus 0' you mean the first (counting from the top of the 
> box) available PCI slot (4 slots in mine) in my B2000?

No. PCI Bus != slot. Normally parisc machines don't have
slots on PCI bus 0 - that's usually reserved for "built-in" devices.

> >You could hack around this with "#ifndef CONFIG_PARISC"
> >and hardcode the "chip_id" to the model you have.
> >You could then find out if the rest of the code has a chance of working.
> 
> Where can I find the line "#ifndef CONFIG_PARISC" and how to hardcode the 
> "chip_id" to the model I have? Where can I get the "chip_id" info? by 
> 'lspci -v' & 'cat /proc/iomem'?

Sorry, sounds like my advice is a bit beyond your current skill level.
Can someone cook up a patch for him to try?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

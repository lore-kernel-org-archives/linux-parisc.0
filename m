From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] B2000 PCI resource problem
Date: Sun, 9 Apr 2006 20:34:56 -0600
Message-ID: <20060410023456.GA25141@colo.lackof.org>
References: <wrp7j62jz7e.fsf@wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Marc Zyngier <maz@misterjones.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <wrp7j62jz7e.fsf@wild-wind.fr.eu.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Apr 06, 2006 at 09:12:05PM +0200, Marc Zyngier wrote:
> People,
> 
> I recently added a Sun dual gigabit, dual scsi PCI card to one of my
> B2000s. This board contains 2 cassini chips, and a 53c896, all sitting
> behind an Intel (well, Digital) 21154 PCI bridge.
> 
> The system works fine, but I'm seeing the following problems:
> 
> Whel probing the SCSI part of the board, the kernel spits the
> following:
> 
> PCI: resource not parented! [2000-2fff]
> PCI: resource not parented! [fb000000-fb5fffff]

Which kernel version?

>   00002000-00002fff : PCI Bus #02
> [... ad nauseam].

This is definitely a bug.

> 0000:01:02.0 PCI bridge: Intel Corporation 21154 PCI-to-PCI Bridge (prog-if 00 [Normal decode])
...
>         I/O behind bridge: 00002000-00002fff
>         Memory behind bridge: fb000000-fb5fffff

Looks like PCI bridge support isn't parenting the allocation
of these resources correctly.

> 0000:02:00.0 Ethernet controller: National Semiconductor Corporation DP83065 [Saturn] 10/100/1000 Ethernet Controller (rev 30)
...
>         Region 0: Memory at fb200000 (32-bit, non-prefetchable) [size=2M]

Wow! 2M? That's a fair chunk of space for a NIC.
Any special about that RAM or what it's used for?
(Just curious)

> 0000:02:02.0 SCSI storage controller: LSI Logic / Symbios Logic 53C896/897 (rev 07)
...
>         Region 0: I/O ports at 12100 [size=256]
>         Region 1: Memory at fb405000 (64-bit, non-prefetchable) [size=1K]
>         Region 3: Memory at fb402000 (64-bit, non-prefetchable) [size=8K]

Is CONFIG_SCSI_SYM53C8XX_MMIO enabled in your kernel?
(again just curious)

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

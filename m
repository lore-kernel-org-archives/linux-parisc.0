Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 6 Oct 2003 08:31:44 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Derek Engelhaupt <derekengelhaupt@rocketmail.com>,
	Joel Soete <soete.joel@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] L2000/N4000 smp devices/boot compare??
Message-ID: <20031006143144.GA19370@dsl2.external.hp.com>
References: <3F5CB6FB0000C2D7@ocpmta1.freegates.net> <20031002233801.23113.qmail@web12508.mail.yahoo.com> <20031003001810.GH24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031003001810.GH24824@parcelfarce.linux.theplanet.co.uk>
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

On Fri, Oct 03, 2003 at 01:18:10AM +0100, Matthew Wilcox wrote:
> I once downloaded an N-class PDF which I've subsequently lost.
> If I remember correctly, it looked like:
> 
>      CPU --+-- CPU          RAM          CPU --+-- CPU
>           DEW              |||||              DEW
>   +--------+--------+---- Stretch ----+--------+------+
>  IKE               DEW               DEW             IKE
> |||||         CPU --+-- CPU     CPU --+-- CPU       |||||
> Ropes                                               Ropes
> 
> (Elroys on the end of the ropes, of course).

I thought Ike was hanging off of "Stretch" like this:
   CPU --+-- CPU              RAM             CPU --+-- CPU
        DEW                  |||||                 DEW
         +----------------- Stretch ----------------+
        DEW                  |   |                 DEW
   CPU --+-- CPU           IKE   IKE          CPU --+-- CPU
                       ||...||   ||...||
                      12 ropes   12 ropes

DEW == Runway to Merced bus converter
IKe == I/O Controller (DMA Coherency and IO MMU)

10 PCI slots are "Twin Turbo" (Double Rope) and two are "Turbo" (singl
rope). "Core I/O" gets the remaining two ropes.


However, the original N-class has been replaced with rp7410.
Not sure if when the switchover took place.
rp7410 is now kin to Superdome (HalfDome) and rp8400 (QuarterDome)
and is based on a follow-on chipset.
URL's here:
http://www.hp.com/products1/servers/mid_range/index.html
http://www.hp.com/products1/servers/rackoptimized/rp7410/infolibrary/rp7410_wp.pdf

grant

ps. We are completely under representing the complexity of "RAM" and all
the memory controllers that made this such a hot box 4 years ago.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B99A48A3
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 Oct 2003 10:40:36 -0600 (MDT)
Date: Thu, 16 Oct 2003 12:36:13 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Joel Soete <soete.joel@tiscali.be>, hinzen@blah.pl,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031016163613.GA13008@systemhalted>
References: <3F8A29A2000025F8@ocpmta1.freegates.net> <Pine.LNX.4.58.0310161708130.15082@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0310161708130.15082@sal.ucc.ie>
Subject: [parisc-linux] Use and ATI 7xxx PCI in a c3k? (Will buy cards)
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

On Thu, Oct 16, 2003 at 05:10:39PM +0100, M. Grabert wrote:
> On Thu, 16 Oct 2003, Joel Soete wrote:
> > Thanks a lot, you config file was very helpfull to make it work:
> > root@fw02:~# modprobe atyfb
> > atyfb: using auxiliary register aperture
> > atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL,
> > 230 MHz PLL, 83 Mhz MCLK, 63 Mhz XCLKConsole: switching to colour frame buffer
> > device 80x30
> > fb0: ATY Mach64 frame buffer device on PCI
> 
> I wonder whether you can also use more recent ATI Radeon graphic cards.
> So far I've only seen reports about ATI Rage XL, but does this patch
> work with any kind of ATI card?

The core chipsets are different, ranging from R100 -> R300. The
development teams were not the same. I've tried to bringup an R300
(Radeon 9700) on a non-x86 arch and it was a big pain. I do not think
that this patch will work for R200's (7xxx series, and 8xxx) or R300's 
(9xxx series). Having said that I've seen seen weirder things work... I
have an R200 AGP and thus I can't try it on my C3K. If anyone has a PCI
ATI 7xxx card I would love to buy it from them for testing :)

c.

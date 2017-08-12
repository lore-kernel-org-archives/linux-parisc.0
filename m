From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: PCI resource problem on C360
Date: Sat, 12 Aug 2017 23:15:43 +0200
Message-ID: <20170812211543.GA24661@alpha.franken.de>
References: <20170803140717.GA7380@alpha.franken.de>
 <89A4641B-DE37-41B1-9F9C-B6312F8F0C84@bell.net>
 <4d46bfba-170f-2c79-cf69-45d02ccc5a9f@gmx.de>
 <20170808134012.GA7601@alpha.franken.de>
 <7312dbc6-bfba-a25b-a639-6ff7bad35e11@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7312dbc6-bfba-a25b-a639-6ff7bad35e11@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 08, 2017 at 05:48:33PM +0200, Helge Deller wrote:
> Maybe the drivers of such NIC/SCSI cards don't request all available
> resources? 

log is clear that the pci probing stuff is not able to setup pci resources.
And that's nothing a driver fix up later (without dirty tricks of course).
The problem is that dino code doesn't set the space_offset of the host
bridge correctly for 64bit kernels. Will send a patch later.

Now aty driver is happy with the mach64 card:

atyfb 0000:00:03.0: runtime IRQ mapping not provided by arch
atyfb 0000:00:03.0: enabling device (0082 -> 0083)
atyfb 0000:00:03.0: enabling SERR and PARITY (0083 -> 01c3)
atyfb: ATI264VT2 (A4) (Mach64 VT) [0x5654 rev 0x40]
atyfb: 512K RESV, 14.31818 MHz XTAL, 200 MHz PLL, 67 Mhz MCLK, 67 MHz XCLK
Console: switching to colour frame buffer device 80x30
atyfb: fb0: ATY Mach64 frame buffer device on PCI

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

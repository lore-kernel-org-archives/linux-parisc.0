From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Matrox Mystique & C3000
Date: Tue, 22 Jun 2004 20:55:53 +0100
Message-ID: <20040622195553.GA27440@sal.ucc.ie>
References: <Pine.LNX.4.58.0406221657130.18505@leopard.stud.ntnu.no>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@parisc-linux.org
To: Ivar <orskaug@stud.ntnu.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0406221657130.18505@leopard.stud.ntnu.no>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jun 22, 2004 at 05:15:44PM +0200, Ivar wrote:
> Hello list,
> I recently got my mystique working with matroxfb and kernel 2.4.24 by
> modifying the write/read functions in mga.h. Everything seems
> fine when passing noinit to the module.

Actually I have "matroxfb=init" in my /etc/palo.conf, and my old
Matrox Millenium works fine. Dmesg says:

 kernel: matroxfb_base: falsely claims to have parameter mtrr
 kernel: matroxfb: Matrox Millennium (PCI) detected
 kernel: matroxfb: 640x480x8bpp (virtual: 640x13081)
 kernel: matroxfb: framebuffer at 0xF6000000, mapped to 0xf6000000,
                   size 8388608
 kernel: fb0: MATROX frame buffer device
 kernel: fb0: initializing hardware

However the driver sometimes doesn't init the matrox properly:
e.g. when I shut down and reboot the C3000 by hitting the On/Off button,
the machine will reboot, the matroxfb will initialize the card,  but
xdm will cause a kernel oops.
However when I physically disconnect the machine from the power
for a few seconds before I reboot, it always initializes the
graphics card fine.

> Standard card initialization however,  fails. Has anyone else
> observed the same problem with other matrox cards
> (Millenium etc)?

I have tried the same with Voodoo2, Voodoo3 3000 and a ATI Rage XL
(however none of them recently), and all failed.

> I really do not understand why, it fails while probing the
> video memory (writing then reading the same address).

Well, in my case the cards produced either a kernel oops (non-fatal),
or a crash or just no visible result (ie. blank screen).


Greetings,
  Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] NIC & "searching for devices"
Date: Tue, 22 Feb 2005 06:34:58 +0000
Message-ID: <e6eae02905022122345edc35f7__3841.18255828998$1416624534$gmane$org@mail.gmail.com>
References: <FHEGKPBPFFGIFBGOANOKEELDEPAA.h.cochran@comcast.net>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: Harry Cochran <h.cochran@comcast.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <FHEGKPBPFFGIFBGOANOKEELDEPAA.h.cochran@comcast.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 21 Feb 2005 14:48:32 -0500, Harry Cochran <h.cochran@comcast.net> wrote:
> Hi,
> 
>         I have two problems I'm hoping to get help with:
> 
> 1. I need to add a NIC to my C3600. I discovered that there is no driver for
> the 3COM 3C905C and I don't recognize the drivers that are there. Could
> someone please tell me if there is a driver I can download for the 3C905C
> (the 3COM site has a "Linux" driver, but it's only for x86 platforms), or
> alternatively, what's the best 10/100 NIC I can buy and put in for which
> there is a Debian hppa driver.

As willy described, the driver for your 3Com card is in the 'vortex' driver.
I usually recommend Intel ExterExpress 100 and DEC/Intel Tulip cards;
those cards are usually more expensive, but the h/w is not as brain-dead
as the rest of the 100MBit NICs out there.
Personally I use a Intel EtherExpress 100 Pro as a second NIC in my
C3000 (with the e100 driver) and it works fine. I had less success with
a noname RealTek 8139 card, but I haven't tried that one for some years.

> 2. I upgraded my J6000 to 2.4.27 and added usb support. Now when I boot it
> gets to "Page-cache table entries ..." and then says "Searching for Devices"
> and says "Searching for Devices". This never times out ... it just sits
> there. I did get the machine to boot by adding an EG-PCI and a usb keyboard
> (it automatically went to pa con Graphics(3)), but the graphics are screwy
> (color dummy paints the right half of the screen with the boot lines and it
> dies somewhere along the way that isn't readable). I did get it to boot by
> brining it up in graphics mode, putting it into serial mode (pa con
> Serial_1) and then booting, but now when I boot again in serial mode with no
> keyboard and monitor attached, it says "Searching for Devices" again. I
> would like to get back to the point where it would just boot in serial
> console mode.

I have a C3000 that uses serial console, but it has a USB keyboard/mouse
attached. I use X with it (using an old Matrox Millenium card) which works
quite nicely with lastest CVS kernels from cvs.p-l.org (both 2.4 and 2.6).
I was definitely able to boot without USB keyboard/mouse attached and
with USB support built-in, but OTOH I haven't used 2.4 lately and I usually
boot with keyboard/mouse plugged in.

You might want to switch to 2.6, since apparently most of the PA hackers 
are no longer interested in 2.4 (the latest CVS version on cvs.p-l.org 
is 2.4.27 which has known security vulnerabilities; CVS 2.4 hasn't
been touched for about half a year now. I don't know about the debian
kernels).

Greetings,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

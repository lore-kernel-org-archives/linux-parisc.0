From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] Get your Matrox PCI cards out of the basement ...
Date: Thu, 3 Jun 2004 11:07:32 -0500
Message-ID: <200406031107.32388.mszick@goquest.com>
References: <20040602221734.GA26176@solo.franken.de>
	<200406030835.25787.mszick@goquest.com>
	<20040603151347.GB23488@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "M. Grabert" <xam@cs.ucc.ie>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040603151347.GB23488@sal.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu June 3 2004 10:13, you wrote:
> On Thu, Jun 03, 2004 at 08:35:25AM -0500, Michael S. Zick wrote:
> > On Wed June 2 2004 22:23, M. Grabert wrote:
>
> SGI Multisync Monitor (NOT sync-on-green capable AFAIK, works fine
> with the Voodoo2 and also with PCs, with the 'normal' VGA cable).

General Rule -
Anything recent enough to call itself "multisync" can sense and use
"sync-on-green" (My limited experience is that anything properly
named "multisync" with an SVGA connector will accept any of the three.)

>
> This monitor doesn't display a "out-of-sync" (you will just hear
> a clicking noise), so just to get sure I also connected it to a
> analogue SVGA LCD display, that tells you if it is out-of-sync.

Ah...
I had that sort of monitor - the noise is relays used to select
sync ranges.
So the monitor is sensing sync pulses (however they get there)
but can't find a matching range (or the pulses aren't stable
enough).
So suspect software setup of the card first -
Sounds like you have (unusable) sync to the monitor.

>
> BTW, I thought that the 'seperate' is actually using the normal
> VGA cable signalling, but seperates each signal/wire physically and
> uses BNC connectors.

I don't have any handy reference for VGA cable/connector - SVGA
connector has them all.

> Eg. I have a PC MultiSync (not here in Ireland) that accepts two
> inputs, VGA connector and 5 BNC.

If you ever get the chance - disconnect the H & V BNCs - it will probably
still work (VGA, 5-BNC and 3-BNC)

> Yeah, I know. I had a SUN Monitor (using sync-on-green), for which
> I built a VGA-to-SyncOnGreen adapter. That was pretty easy to do.
>
> Unfortunately the old HP monitors/graphics cards are using a much more
> complicated, proprietary sync-on-green signalling (and voltage)
> much unlike the SUNs, so building a VGA converter is much more
> complicated. IIRC. (I remember that I found a schematic for those
> HP VGA converters some time ago and I was scared).

I didn't know that - thanks for the info.
I have driven several different Sony multisync monitors with the 720
(and a custom - wire only - cable) - they survived the experience;
but based on the above - it might be good that I didn't do it for
very long.

>
> However Milleniums have (undocumented) hardware SyncOnGreen support,
> and most OSS drivers (eg. XFree86) can enable it, but it is
> disabled by default, at least on the PC version (which I have).

Those messages about not getting the cards PLLs to lock are more
likely to be the lead to getting a picture - but something else might
not be getting its setup also.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

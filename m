Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D79F4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 21:38:57 -0600 (MDT)
Date: Sun, 18 Aug 2002 04:38:50 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo3 PCI on C200 experiment pending!
In-Reply-To: <3D5E0430.2000407@charter.net>
Message-ID: <Pine.LNX.4.44.0208180419120.1348-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 17 Aug 2002, B. Douglas Hilton wrote:

> I just scarfed up a somewhat used Voodoo3 PCI graphics
> card from Ebay and intend to try it out with Debian/HPPA
> and a custom built kernel.
>
> I hope to compile a tdfx.o drm module and get the card
> recognized via a PALO boot command. I will use a dumb
> terminal for the system console during initial booting.

I think I have to disappoint you. I doesn't work for me :-(

I did exactly the same thing, I got a Voodoo 3 3000 from ebay and put it
into my C240 (it's very similar to the C200 series).
I tried both 32bit and 64bit PCI slots, but XFree86's Voodoo driver
seems to have some problems with 64bit PCI (at least some guru from
the p-l mailing list suggested this after reading my XFree86 logs).

But unfortunately sticking the Voodoo into a 32bit PCI slot doesn't get
much further: starting XFree86 will cause a HPMC shortly after a message
like "Lasi: barking without apparent reason" (obviously from gsc/lasi.c).
This is just before it is about to initialize the Voodoo3 (with the
Intel emulator in XFree86). At least the messages printed on the console
seem to be like the last messages XFree86 usually prints out just before
activating the graphics card on other platforms.

Finally I even took out the (not yet supported) HP Visualize-FX2 card
(64bit slot), just to get sure that there were no conflict with other PCI
hardware. I'm using (or should I say: I have to use) the serial console
anyway.

BTW, of course you must not compile the Voodoo FrameBuffer device, and
I don't use the DRI driver either (just to be sure); just use XFree86
driver.

I recently found a message on the debian-alpha mailing list (this month)
were some tried to get a Voodoo3 running on a AlphaStation. He succeeded
by adding 'Option "NoINT10"' to XF86Config, but this didn't work for me.
This would have been very surprising, since Alpha and HPPA are totally
different architectures anyway, but who knows ...

My last attempt was with 2.4.19-pa2; still the same error.

greetings max

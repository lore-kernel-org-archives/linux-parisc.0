From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] IBM GXT6000P on parisc linux
Date: Sun, 30 Sep 2007 13:35:34 -0600
Message-ID: <20070930193534.GA15729__33468.0551350631$1416624443$gmane$org@colo.lackof.org>
References: <200709211949.21664.b.gunreben@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Berthold Gunreben <b.gunreben@web.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200709211949.21664.b.gunreben@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 21, 2007 at 07:49:21PM +0200, Berthold Gunreben wrote:
> Hi,
> 
> I got a used HP parisc workstation, and found a GXT6000P video card in 
> there. The card was detected and initialized by the firmware of this machine 
> (a C3750).

wow..that's odd. I didn't see any web page which shows HP ever
supported GXT6000P with HPUX. I suspect someone sold you the wrong card.
Can you explain in more detail what you mean with "detected and initialized
by the firmware"?

I suspect magic BIOS code isn't getting run. (It _might_ run under
a C8000 but I don't expect it to work).

>  I just wanted to give it a try and compiled a module gxt4500 to 
> try this card. Here are my results:
> 
> o The module builds  without errors after adding PARISC to Kconfig for this 
> module
> o when loading the module, dmesg contains this:
>   Console: switching to colour frame buffer device 160x64
>   fb0: IBM GXT6000P frame buffer device

Ok. that's good.

...
> However - the monitor stays in powersave mode, and no signal reaches the 
> monitor, neither in text mode (console) nor in X11 mode. For some reason, the 
> interrupt for this device (according to lspci it is IRQ 70) does not appear 
> in /proc/interrupts, but I don't know if this is even necessary for this 
> driver.
> 
> lspci -vn gives me the following for this card:
> 03:02.0 Class 0300: 1014:0170 (rev 02) (prog-if 00 [VGA])
>         Subsystem: 1092:0173
>         Flags: bus master, 66MHz, medium devsel, latency 255, IRQ 70
>         Memory at f7000000 (32-bit, non-prefetchable) [size=128K]
>         Memory at f8000000 (32-bit, non-prefetchable) [size=64M]
>         Expansion ROM at f7040000 [disabled] [size=256K]

You can determine if it's necessary by looking at the driver source code.
Try to find where it registers the IRQ handler with request_irq().
Sounds like either it doesn't or it can't (but should print something
to dmesg buffer in that case).

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

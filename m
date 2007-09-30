From: Berthold Gunreben <b.gunreben@web.de>
Subject: Re: [parisc-linux] IBM GXT6000P on parisc linux
Date: Sun, 30 Sep 2007 22:22:11 +0200
Message-ID: <200709302222.11909.b.gunreben__9811.82291075147$1416624443$gmane$org@web.de>
References: <200709211949.21664.b.gunreben@web.de>
	<20070930193534.GA15729@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070930193534.GA15729@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Am Sonntag, 30. September 2007 21:35 schrieb Grant Grundler:
> On Fri, Sep 21, 2007 at 07:49:21PM +0200, Berthold Gunreben wrote:
> > Hi,
> >
> > I got a used HP parisc workstation, and found a GXT6000P video card in
> > there. The card was detected and initialized by the firmware of this
> > machine (a C3750).
>
> wow..that's odd. I didn't see any web page which shows HP ever
> supported GXT6000P with HPUX. I suspect someone sold you the wrong card.
> Can you explain in more detail what you mean with "detected and initialized
> by the firmware"?
>
> I suspect magic BIOS code isn't getting run. (It _might_ run under
> a C8000 but I don't expect it to work).

Well, what can I say. The workstation boots up and displays the usual firmware 
messages like press Tab to choose resolution (only 640x480 seems to be 
supported at that stage) and I can also enter commands at this console. The 
card does not seem to be wrong in this respect.

After booting linux, the messages of the kernel are displayed until the 
console switches:

console handover: boot [ttyB0] -> real [tty0]

Then it takes some more seconds, until the display goes dark and I was not yet 
successful in bringing it to life again.

> You can determine if it's necessary by looking at the driver source code.
> Try to find where it registers the IRQ handler with request_irq().
> Sounds like either it doesn't or it can't (but should print something
> to dmesg buffer in that case).

The driver has no occurence of irq, and it only handles framebuffer (normally, 
this card also should have 3D capabilities. It looks like it just does not 
need IRQs.

It looks like the card is switched off by using 
pdc_cons.flags &= ~CON_PRINTBUFFER

At least if I comment this line, booting continues with messages until some 
point where the machine just hangs. 

I am sorry, that I did not post more information in the first place, but I 
don't have much experience with graphics on parisc-linux ... 

Thanks for your efforts anyway.

Berthold
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

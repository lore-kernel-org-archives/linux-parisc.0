From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] NCR_700 problems on 715/64 with 2.6.11-rc4-pa1
Date: Sat, 19 Feb 2005 09:20:23 -0600
Message-ID: <200502190920.23475.mszick@wolfbutter.com>
References: <200502191234.30310.deller@gmx.de>
	<200502190800.44901.mszick@wolfbutter.com>
	<200502191559.26297.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200502191559.26297.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat February 19 2005 08:59, Helge Deller wrote:
> Hi Michael,
> 
> On Saturday 19 February 2005 15:00, Michael S. Zick wrote:
> > On Sat February 19 2005 05:34, Helge Deller wrote:
> > > I get random messages from the 53c700 scsi driver (see below). 
> > > Any ideas ?
> > > Helge
> > > 
> > Looks like more udev/irq balance/irq routing problems,
> > see concurrent thread "BUG 2.6.11-rc4..."
> > 
> > try: 'noudev pci=routeirq' options on the command line
> > to change behavior in generic code.
> 
> I will try, but I'm not sure that this is the cause.
> Looks to me more like a missing ioremap() call.
> 
> Even the sti framebuffer does not work since weeks - I think it's due to ioremap() as well.
> 
With 2.6.11 the device drivers are responsible for registering
their irq handling, not the bus driver...
Could that also be the cause for your missing ioremap() calls?

The above is a general description - perhaps not exact.
I am afraid I will learn more than I ever wanted to know about
this change before I get this *&%^&  tulip driver working under 2.6.11

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

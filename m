From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] NCR_700 problems on 715/64 with 2.6.11-rc4-pa1
Date: Sat, 19 Feb 2005 15:59:26 +0100
Message-ID: <200502191559.26297.deller@gmx.de>
References: <200502191234.30310.deller@gmx.de>
	<200502190800.44901.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
Cc: "Michael S. Zick" <mszick@wolfbutter.com>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200502190800.44901.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Michael,

On Saturday 19 February 2005 15:00, Michael S. Zick wrote:
> On Sat February 19 2005 05:34, Helge Deller wrote:
> > I get random messages from the 53c700 scsi driver (see below). 
> > Any ideas ?
> > Helge
> > 
> Looks like more udev/irq balance/irq routing problems,
> see concurrent thread "BUG 2.6.11-rc4..."
> 
> try: 'noudev pci=routeirq' options on the command line
> to change behavior in generic code.

I will try, but I'm not sure that this is the cause.
Looks to me more like a missing ioremap() call.

Even the sti framebuffer does not work since weeks - I think it's due to ioremap() as well.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

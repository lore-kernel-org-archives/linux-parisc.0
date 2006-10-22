From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Mux Updates.
Date: Sun, 22 Oct 2006 15:41:32 -0600
Message-ID: <20061022214131.GC25210@parisc-linux.org>
References: <e739902b0610192236u61d76952l942d4f9caac066c6@mail.gmail.com>
	<20061020060335.GT2602@parisc-linux.org>
	<e739902b0610221020h4843e5f2x3ca44a273bea47f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Ryan Bradetich <rbradetich@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e739902b0610221020h4843e5f2x3ca44a273bea47f@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Oct 22, 2006 at 10:20:57AM -0700, Ryan Bradetich wrote:
> >+        mmio_region.name = "Mux";
> >> +        mmio_region.flags = IORESOURCE_MEM;
> >> +        mmio_region.start = dev->hpa.start + MUX_OFFSET;
> >> +        mmio_region.end = dev->hpa.start + MUX_OFFSET + (ports *
> >MUX_LINE_OFFSET) - 1;
> >> +        insert_resource(&iomem_resource, &mmio_region);
> >
> >If you want to go this way, you want IORESOURCE_BUSY on the flags, but
> >you don't need to do that.  Just:
> >
> >        request_mem_region(dev->hpa.start + MUX_OFFSET,
> >                                ports * MUX_LINE_OFFSET, "Mux");
> 
> 
> I changed the Mux to use this, but it did not work as expected:
> 
> Here are the relevant lines from the boot messages:
> 
> Enabling regular chassis codes support v0.05
> 
> CPU(s): 1 x PA7100LC (PCX-L) at 64.000000MHz
> Setting cache flush threshold to 9e0 (1 CPUs
> online)
> Lasi version 0 at 0xf0100000
> found.
> LED display at f010c000
> registered
> Found GeckoBoa at
> 0xfffb8000
> 
> drivers/parisc/hppb.c: failed to claim HP-PB bus space (fff00000,
> fff7ffff)

This isn't related to the Mux though ...

> Here are the relevant lines from /proc/iomem:

The wrapping was a bit strange; i've fixed it for this reply.

> f0100000-f0100fff : 60
> f0107000-f0107fff : 60:6
> f010c000-f010c000 : led_data
> fff74000-fff74fff : 56:52
> fff75000-fff75fff : 56:53
> fff78000-fff78fff : 56:56
>  fff78800-fff78fff : Mux
> fff7c000-fff7cfff : 56:60
> 
> 
> My understanding of the error message indicates that since Lasi and the LEDS
> already reserved portions of the space
> HP-PB wants, it caused the resource failure.   This has me a bit confused on
> how the bus walk code works ... I thought the probe function on the parent
> device should have been called before the probe function on any of the
> children ... so it seem the Gecko Boa should probe function should have been
> called before the LASI and LED probe functions.
> 
> Still looking into why this happens, but hints are welcome :)

Right.  So, what's happening here is that we call
ccio_request_resource() for the region that HPPB forwards, but that
fails.  I'd like you to trace through and find out why it's failing.  It
ought to succeed -- the ranges don't seem to overlap, and the
insert_resource() should succeed.  I'd look at ccio_get_iommu() and
check that it's returning NULL on your E35.

> Thanks for the reminder.  I had to re-work this a bit since we didn't have
> the dev and ports variable in this function.  I am

Oops ;-)

> working on expanding this to handle multiple Mux cards as well.

Cool.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

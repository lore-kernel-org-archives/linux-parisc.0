Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08F86482A
	for <parisc-linux@parisc-linux.org>; Thu,  9 Aug 2001 09:08:56 -0600 (MDT)
Message-Id: <200108091506.JAA13380@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 06 Aug 2001 02:05:17 BST." <20010806020517.A14978@parcelfarce.linux.theplanet.co.uk>
Date: Thu, 09 Aug 2001 09:06:43 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> This is a summary and a design document for building an iotree in PA/Linux.
> Grant, Ryan, if I mis-remembered / misunderstood something, do shout.

Cool!

...
> In a related matter, the ABW will pick up serial ports (and other things)
> which aren't activated.  Grant said there was a PDC call to determine
> whether a device is inactive -- I'm not sure which one that is yet.

Yes. AFAIK, LASI sub-devices are listed by PDC. For Dino HPUX makes
a special hvers PDC call. Need to look at the HPUX code or Raven PDC ERS.

> 
> Here's my plan:
> 
>  * From setup_arch, call PDC to get a list of devices.  Put them in a
>    table (marked __init, will be freed later).

Why not start building a tree with "place holder" nodes directly?
Do we need the intermediate table because of memory issues?

ie build a "sparse" tree and have Native Bus walk fill in (or update
wrong) info for devices it finds.

>  * In the badly-named gsc_init, or perhaps in pcibios_init, start the
>    ABW at 0xFFF80000 -- this seems to be the defined location for the
>    central bus.

My long term goal is to be able to build a kernel w/o CONFIG_PCI defined.
And renaming gsc_init to native_bus_init() sounds like a good idea.

>  * Start creating the tree with devices that we find in the ABW.
>    Each device which is a bus adapter / converter will do an ABW for its
>    children, and add in any PDC-discovered devices in the table which are
>    its immediate children.  The add-in is done by copy, not by reference.
>  * At some indeterminate time after this, the table of PDC-reported drivers
>    gets freed along with all the other __init data & code.
> 
> We'll have to be careful with CPU `drivers' since they will have stale
> pointers which must be updated.  Perhaps this is where a ->remove method
> would come in handy; or perhaps we just magically make them cope with
> their ->probe function being called a second time on the same device
> (same HPA).

The latter sounds easier but more like a hack...maybe it's ok though.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253

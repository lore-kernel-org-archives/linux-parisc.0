Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DCA24482A
	for <parisc-linux@parisc-linux.org>; Sun,  5 Aug 2001 19:05:18 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15TYpZ-0001US-00
	for parisc-linux@parisc-linux.org; Mon, 06 Aug 2001 02:05:17 +0100
Date: Mon, 6 Aug 2001 02:05:17 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010806020517.A14978@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] iotree thoughts
List-ID: <linux-parisc.vger.kernel.org>

This is a summary and a design document for building an iotree in PA/Linux.
Grant, Ryan, if I mis-remembered / misunderstood something, do shout.

There are two sources of information about what devices are in the
machine.  There's an Architected Bus Walk, which basically says `probe
devices at the following addresses'.  Code to do this already exists
in do_native_bus_walk.  The other way of finding devices is to ask PDC.
All non-architected devices (ie devices which won't be discovered by an
ABW) are known to PDC.

PDC also knows about other devices, including some PCI devices and some
of the architected devices, so some devices may get discovered twice.
Also, PDC occasionally has bugs (see the J2240 Dino and 715/Scorpio
card-mode Dino entries for examples).  And there are three types of PDC
to deal with -- PAT PDC on some 64-bit boxes, PDC which supports the
PDC_SYSTEM_MAP call, and PDC which predates the PDC_SYSTEM_MAP call.

In a related matter, the ABW will pick up serial ports (and other things)
which aren't activated.  Grant said there was a PDC call to determine
whether a device is inactive -- I'm not sure which one that is yet.

Here's my plan:

 * From setup_arch, call PDC to get a list of devices.  Put them in a
   table (marked __init, will be freed later).
 * In the badly-named gsc_init, or perhaps in pcibios_init, start the
   ABW at 0xFFF80000 -- this seems to be the defined location for the
   central bus.
 * Start creating the tree with devices that we find in the ABW.
   Each device which is a bus adapter / converter will do an ABW for its
   children, and add in any PDC-discovered devices in the table which are
   its immediate children.  The add-in is done by copy, not by reference.
 * At some indeterminate time after this, the table of PDC-reported drivers
   gets freed along with all the other __init data & code.

We'll have to be careful with CPU `drivers' since they will have stale
pointers which must be updated.  Perhaps this is where a ->remove method
would come in handy; or perhaps we just magically make them cope with
their ->probe function being called a second time on the same device
(same HPA).

Feedback welcome.

-- 
Revolutions do not require corporate support.

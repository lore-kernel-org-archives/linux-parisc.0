Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B561482A
	for <parisc-linux@parisc-linux.org>; Sat, 25 Aug 2001 00:02:07 -0600 (MDT)
Message-Id: <200108250559.XAA24615@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Wed, 22 Aug 2001 01:50:02 BST." <20010822015002.F21643@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 24 Aug 2001 23:59:25 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> I looked through the Raven ERS, it wasn't too helpful.  I managed to find
> the Dino driver in the HPUX source tree.... it doesn't seem to make the
> call itself, but instead:

[...]


I was confused. The Dino built-in discovery doesn't make PDC calls.

HPUX 11.01 (9905 release?) does make PDC calls in the boot initialization
sequence.  IIRC, This associates PCI device numbers with slot numbers
printed on the back of the machine. Useful for defective FRU ("Field
Replacable Unit") isolation/error reporting.  AFAIK, This only works
for platforms with bridge-mode Dino - ie B1XX/CXXX workstations.
(Calls are appended for interested folks).

...
> So it seems to me that we shouldn't do bus-walks underneath Dino, but
> rely on PDC telling us about the device if it's attached.

Uhm, "underneath" is ambiguous since both built-ins and PCI devices
are heirarchially below "dino" (iotree view - not HW view).
We need to do PCI bus walks for PCI devices.

I'll assume your statement only refers to Dino built-ins and agree.
FWIW, same is true for LASI devices.

grant


Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253

    /*
     * Get physical platform information
     */
    status = hversion_pdc_call(
                 3,(u_int)PDC_ARG2_IS_RADDR, 10, (ulong_t)PDC_PCI,
                 (ulong_t)PDC_PCI_GET_IFACE_INFO, (ulong_t)&(DINO(this)->ifinfo)
,
                 (ulong_t)this->base_addr,(ulong_t)0,(ulong_t)0,(ulong_t)0,
                 (ulong_t)0,(ulong_t)0,(ulong_t)0);
...
    /*
     * Total number of devices to get "slot info" for - all the slots plus
     *   all the built-ins
     */
    num_devs = DINO(this)->ifinfo.num_slots + DINO(this)->ifinfo.num_built_ins;
...
    for (slot_idx = 0; slot_idx < num_devs; slot_idx++) {
        ulong_t slot_path[32];
        status = hversion_pdc_call(
                     4, (u_int)PDC_ARG2_IS_RADDR, 32, (ulong_t)PDC_PCI,
                     (ulong_t)PDC_PCI_GET_SLOT_INFO, (ulong_t) slot_path,
                     (ulong_t)this->base_addr, (ulong_t)slot_idx,(ulong_t)0,
                     (ulong_t)0, (ulong_t)0, (ulong_t)0, (ulong_t)0);
...

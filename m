Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4142E482A
	for <parisc-linux@parisc-linux.org>; Wed,  1 Aug 2001 09:59:06 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15RyOl-0004sX-00
	for parisc-linux@parisc-linux.org; Wed, 01 Aug 2001 16:59:03 +0100
Date: Wed, 1 Aug 2001 16:59:03 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010801165903.B4199@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] A general cleanup & overhaul of native device handling
List-ID: <linux-parisc.vger.kernel.org>

I've been unhappy with the way we handle native devices for a while.
Grant pushed me to do something about it instead of just whining, and
I was inspired after seeing the hotplug talk at OLS.  Yes, there are PA
machines out there whch support Hotplug... Superdome certainly does and
there may be other machines which do.

So here's what I've done:

 * `hpa' is now `unsigned long' everywhere in the core code.  Some drivers
   cast it to a struct pointer, and while I disapprove of this, that's
   really up to the individual maintainers.
 * we now have a `struct parisc_device_id'.  This parallels the similarly
   named structures for pci, isapnp & usb.  The ids I decided were useful
   are: hw_type, hversion, hversion_rev & sversion.  sversion_rev & opt are
   not included.  If anyone feels the need for them, ask nicely.
 * hp_device has become parisc_device.  The individual hversion,
   sversion, etc elements have become an embedded struct parisc_device_id.
   I've added parent, sibling, child pointers for future use in an iotree.
 * pa_iodc_driver is replaced by parisc_driver.  This parallels
   pci_driver.  It has a pointer to a table of parisc_device_id.
   The `callback' element has been renamed to `probe' and now takes only
   the struct parisc_device which is being probed for.
 * We no longer have a bitfield of things to check; instead we use
   HVERSION_ANY_ID (and similarly named values) to indicate a `don't care'.

The complete patch is something over 110k, so I decline to post it to the
list.  You can find it at ftp://puffin.external.hp.com/pub/parisc/src/parisc_device.diff .  I'll give a sample though, and I've decided to pick on... harmony.
I'm only going to post the interesting bits; there's more to it in the full
diff.

-/* This is the PDC signature to load up the driver. */
-static struct pa_iodc_driver harmony_drivers_for[] = 
-{
-       {HPHW_FIO, 0x01B, 0, 0x0007B, 0x0, 0x0, 
-               DRIVER_CHECK_HWTYPE + DRIVER_CHECK_SVERSION,
-               "Lasi Harmony", "Harmony", harmony_driver_callback},
-       {0, }
+static struct parisc_device_id harmony_tbl[] = {
+       { HPHW_FIO, HVERSION_REV_ANY_ID, 0x01B, 0x0007B },
+       { 0, }
 };
 
+MODULE_DEVICE_TABLE(parisc, harmony_tbl);
+
+static struct parisc_driver harmony_driver = {
+       name:           "Lasi Harmony",
+       id_table:       harmony_tbl,
+       probe:          harmony_driver_callback,
+};
 
 static int __init init_harmony(void)
 {
-       pdc_register_driver(harmony_drivers_for);
-       return 0;
+       return register_parisc_driver(&harmony_driver);
 }

As you can see, the new form is quite compact and readable.

At some point, I'm going to try booting a machine with this patch applied
and see what happens.  I expect it to explode messily right now, tbh, but
at least it compiles.  I'm interested in criticism of this architecture.
After I get this hunk of work done, I'll move on to an iotree, and maybe
then to actually doing hotplug for native devices... that isn't high on
my priority list and I'd be happy to leave it to somebody else :-)

-- 
Revolutions do not require corporate support.

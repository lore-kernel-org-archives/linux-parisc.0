From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: HIL panic on boot with 2.6.9-rc4-pa2
Date: 12 Oct 2004 17:00:01 -0500
Message-ID: <1097618407.2044.420.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-Path: <James.Bottomley@SteelEye.com>
List-ID: <linux-parisc.vger.kernel.org>

I got this on a 64bit kernel on a C360 ... it looks like the driver
detach path is causing a problem (HIL needs to be built in for a
standard kernel to run on any machine).

James


HP SDC: : IRQ not found for SDC IO=0xffffffffffe01000 IRQ=0x0
NMI=0xffffffff
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
kfree_debugcheck: bad ptr 104bf828h.
kernel BUG at mm/slab.c:1851!
Backtrace:
 [<00000000101161a8>] dump_stack+0x18/0x28
 [<0000000010175a60>] kfree_debugcheck+0xb8/0xf8
 [<000000001017722c>] kfree+0x3c/0x128
 [<00000000102432b4>] serio_release_port+0x14/0x20
 [<0000000010251368>] device_release+0x30/0xa0
 [<00000000101f4cac>] kobject_cleanup+0xc4/0xd0
 [<00000000101f4ccc>] kobject_release+0x14/0x20
 [<00000000101f51d0>] kref_put+0xa0/0x128
 [<00000000101f4cfc>] kobject_put+0x24/0x30
 [<00000000102517fc>] put_device+0x14/0x20
 [<000000001025191c>] device_unregister+0x2c/0x40
 [<000000001024346c>] serio_destroy_port+0xf4/0x110
 [<00000000102439b8>] serio_unregister_port+0x58/0xb0
 [<0000000010247c44>] hil_mlc_unregister+0xf4/0x158
 [<000000001044e6bc>] hp_sdc_mlc_init+0x144/0x180
 [<0000000010438a88>] do_initcalls+0xb0/0x188

Kernel panic - not syncing: BUG!
 

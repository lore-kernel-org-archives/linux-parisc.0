Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E40264A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 08:57:23 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA05356
	for <parisc-linux@puffin.external.hp.com>; Sat, 24 Feb 2001 08:52:38 -0700
Received: from pc5158a.esiee.fr (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id 41CCDD1585
	for <parisc-linux@thepuffingroup.com>; Sat, 24 Feb 2001 16:56:08 +0100 (CET)
Received: from localhost
	([127.0.0.1] helo=esiee.fr ident=delahaym)
	by pc5158a.esiee.fr with esmtp (Exim 3.12 #1 (Debian))
	id 14Wh3I-0008IL-00
	for <parisc-linux@thepuffingroup.com>; Sat, 24 Feb 2001 16:56:08 +0100
Sender: delahaym@esiee.fr
Message-ID: <3A97D998.5D019AAB@esiee.fr>
Date: Sat, 24 Feb 2001 16:56:08 +0100
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Unregister driver patch
List-ID: <linux-parisc.vger.kernel.org>

Hi all!

Here is a patch which implements the unregister_driver() function.

I had to change a field in struct hp_device:
The field "manage" (bool) become "driver" (pointer on a pa_iodc_driver),

since unregister_driver has to know by which driver a device was managed
to make unregister proper.
unregister_driver() first remove the driver from the list. Then, it
looks for devices managed by this driver and changed their "driver"
field to NULL.


More over, some drivers call register_driver at least two times, e.g.
the gsc parallel port driver. When it append, BUG() is called and a
warning is send to give the name of the driver.

NOTE: Since the structure pa_iodc_driver is used to maintain the list of
the registered drivers, I think this do not have to be put in data.init
section.


Regards,

Matthieu Delahaye
ESIEE Team
http://www.esiee.fr/~puffin

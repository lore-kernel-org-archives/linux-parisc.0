Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fileserv2.Cologne.DE (unknown [62.145.23.107])
	by dsl2.external.hp.com (Postfix) with SMTP id 7F451482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 09:39:52 -0600 (MDT)
Received: from localhost (2312 bytes) by fileserv2.Cologne.DE
	via rmail with P:stdio/R:bind/T:smtp
	(sender: <excalibur.cologne.de!karsten>) (ident <excalibur.cologne.de!karsten> using unix)
	id <m156wSI-0007gGC@fileserv2.Cologne.DE>
	for <parisc-linux@parisc-linux.org>; Mon, 4 Jun 2001 17:39:46 +0200 (CEST)
	(Smail-3.2.0.101 1997-Dec-17 #5 built 1998-Jan-19)
Date: Mon, 4 Jun 2001 17:39:24 +0200
From: Karsten Merker <parisc-linux@excalibur.cologne.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problems with 0.9 ISO Images from mkhppa1.esiee.fr
Message-ID: <20010604173924.A1043@excalibur.cologne.de>
References: <20010604170841.A8900@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010604170841.A8900@solo.franken.de>; from tsbogend@alpha.franken.de on Mon, Jun 04, 2001 at 05:08:41PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 04, 2001 at 05:08:41PM +0200, Thomas Bogendoerfer wrote:

> maybe it just me, but I burned all three iso images from the France mirror
> and none of it is bootable (tried on 712, C200 and J282). I get IPL checksum
> error (C200/J282) or just dropping back to the bootprom (712). I could
> mount them on my PC. The 0.5 ISO CD I've burned sometime ago works. So 
> before more people burn coasters, could someone check, whether the images
> are broken or I made an error buring the CDs.

I have also burnt the ISO-image from the french mirror
(http://mkhppa1.esiee.fr/archive/install/palinux-0.9-32sti.iso.gz)
and it works for me on a 712/80:

bash> md5sum palinux-0.9-32sti.iso.gz
8ec6565d49172302a39e844cea64c47b  palinux-0.9-32sti.iso.gz

I had some difficulties after the installation (with certain operations in
vi I could repeatably crash the kernel and I got kernel panics on bootup
when booting from harddisk), but both problems could be solved by using a
current cvs kernel instead.

The only problem I had with the installation itself was that the dialog
boxes looked a bit weird when using sticon.

HTH,
Karsten
-- 
#include <standard_disclaimer>
Nach Paragraph 28 Abs. 3 Bundesdatenschutzgesetz widerspreche ich der Nutzung
oder Uebermittlung meiner Daten fuer Werbezwecke oder fuer die Markt- oder
Meinungsforschung.

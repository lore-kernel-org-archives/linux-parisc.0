Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35226482A
	for <parisc-linux@parisc-linux.org>; Thu, 31 Jan 2002 11:01:17 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GQTE2401.0MQ for
          <parisc-linux@parisc-linux.org>; Thu, 31 Jan 2002 09:01:16 -0900
Date: Thu, 31 Jan 2002 08:55:52 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Odd kernel error
In-Reply-To: <20020130221939.A3166@solo.franken.de>
Message-ID: <Pine.LNX.4.33.0201310851400.6397-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> On Tue, Jan 29, 2002 at 08:00:21PM -0900, Tom wrote:
> > Compiling the latest from CVS (-pa16, I think) and at the final make, when
> > gcc is actually doing the '-o vmlinux' I'm getting:
> >
> > drivers/video/video.o: In function 'L1260':
> > drivers/video/video.o(.init.text+0x2554): undefined reference to
> > 'fbcon_sti'
> > drivers/video/video.o(.init.text+0x255c): undefined reference to
> > 'fbcon_sti'
> > make: *** [vmlinux] Error 1
>
> On Wed, 30 Jan 2002, Thomas Bogendoerfer wrote:
> are you using " Advanced low level driver options" ? If yes, there is
> a bug in driver/video/Config.in, which doesn't let you select fbcon sti
> for advanced config. Turn off the Advanced low level thing and the link
> error should go away.

Okay - FTR, enabling PCI and disabling the 'advanced low-level driver
options' allows a clean compile, which happily boots a 715/100 and runs
KDE using the aforementioned XF86Config-4 file.Thanks to all who chipped
in - this gives me hope to get X running on the C180, now that I've got
space to set it up! :-)

BTW, anyone have any feedback on some of the places selling PA-RISC
machines on eBay? Southwest Computer Solutions seems to have a lot of them
at reasonable prices, ditto a few other places, but some seem to have no
idea what these things are and tend to say 'untested-as-is' with a minimum
$200+sh on a C110...

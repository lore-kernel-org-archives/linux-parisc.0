Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69135491D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Oct 2003 05:57:17 -0600 (MDT)
Date: Wed, 15 Oct 2003 13:57:04 +0200
Message-ID: <3F8A29A2000018C3@ocpmta1.freegates.net>
In-Reply-To: <Pine.LNX.4.58.0310141949150.17639@gustlik.softwired.wfc>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] ATI rage xl and C360 (it works!)
To: "Hin.Zen" <hinzen@blah.pl>, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Hin,

Sorry but on the b180L on wich card is pluged in, i boot a kernel with module
support and build the new atyfb module and when I modprobe it the system
crash (without oops message :( ).
The only message I got is:
atyfb: using auxiliary register aperture
atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL,
230K

which seems more relevant then previous test (with original atyfb support).

Never the less, I would like very much that it works and so ask you the favor
to send me your .config file to be sure I do not lost anything :) (btw with
your XF86Config-4 :) )

Thanks in advance,
    Joel

>-- Original Message --
>From: "Hin.Zen" <hinzen@blah.pl>
>To: parisc-linux@lists.parisc-linux.org
>Date: Tue, 14 Oct 2003 20:20:14 +0200 (CEST)
>Subject: [parisc-linux] ATI rage xl and C360 (it works!)
>
>
>Hello List,

last night I accidentally found this:
http://ftp.fi.muni.cz/pub/linux/sgi/people/ppopov/aty_nobiosinit.patch

and patched 2.4.22-pa12 on my C360.
After that the rage xl seems to work just fine [minor problems with
colors and XFree (
>bdev mode) running 1280x1024].

Could anybody who owns such a card (or can easily get one) test it please?
(maybe Joel?)

thanks,

-- 
hinzen
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc
>linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr

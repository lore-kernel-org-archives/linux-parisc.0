Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5D244829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Dec 2002 00:27:57 -0700 (MST)
Date: Tue, 24 Dec 2002 08:27:49 +0100
Message-ID: <3DED9A6600002FAC@ocpmta3.freegates.net>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] 2.4.20-paxx Config problem (follow-up)
To: "Ryan Bradetich" <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
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

Hi Ryan,
>
>The PDC Console should work for this box as it is really a firmware
>console.

I though too but seems to cause a problem with pci-ide cdrom?

>  The firmware console talks to /dev/ttyB0 instead of
>/dev/ttyS0, so that might be your problem?  Also in recent kernels the
>major number of /dev/ttyB0 changed from 60 to 11 so make sure the
>device file is correct.

IMHO it doesn't matter, as mentionned in previous mail, the system hang
very earlier at 'Search devices ...' step and the cdrom green led stay co=
ntiniously
light. Even TOC (I try it to get a piminfo) doesn't work at this stage.
Additionally, on a another b180 the problem doesn't occurs with the same
kernel?

>
>Finally, out of curiosity, why are you trying to use the PDC console?
>The B2k should have a 16550 port (off the suckyio chip???) that should
>work for you.
>
Yes usual serial console works fine for this model.
In fact the first goal was not to test PDC console but it was to test the=

basic config files suggested in arch/parisc/debian-configs (32 bits becau=
se
I test it in parallel on a 180).
AFAIK it is the config used to build install CD and network boot lifimage=
?
So, in case of problem (test corrupting system, disk broken, ...) and for=

the newbies, I would be sure that config is also relevant to (re-)build
_quickly_ a system of this model.

Thanks for your attention and advises (it will be usefull for futur test)=
.

Merry Christmas,
    Joel

PS: For 32 bit release UP release, I also find strange that DEBUG SPINLOC=
K
option was selected and selectable. I was also convinced that it had only=

matter with SMP config?


********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be

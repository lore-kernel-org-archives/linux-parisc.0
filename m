Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D966487A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 04:10:50 -0700 (MST)
Date: Mon, 10 Nov 2003 12:10:46 +0100
Message-ID: <3F969FFE00009E0B@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] C110 builtin nic slow?
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
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

Hello Grant,

> netperf home is netperf.org.

Yes I check and the sources in debian (non-free tree) are the last one alailable
near netperf.org.

> It does run/build on parisc. I've used it before.

Yes, I check it at the office on a b180 :) (dpkg-buildpackage after
an apt-get source netperf; i don't see why it is not pre-build, well doesn't
matter)

>Note that with B180, I can only get about 1MB/s throughput max.
The same here at the office.

>With C3000 I get about 5 or 6 MB/s 100BT link.
What's up, if you connect it via a 10BT hub (but don't reboot and don't
restart or reset the interface). That should be what hapen on my pc box
(but I couldn't verify).

>Your network performance numbers are pretty far off from that but
>there might be other factors involved.

Well trying to help to fix fdisk in 2.6, I don't have time to install netperf
on my C110, sorry.
Any way, a big part of the problem should come from the bad auto-configuration:
As explained before, I start up first my pc (to get a minicom 'console').
As it is setup with auto-negociation and the c110 is not yet pw up, the
nic should be set at 100/full-duplex. Then when I boot the c110, the nic
is setup with the best of its availability: 10/half-duplex.

That seems to be confirm when I launch '/etc/init.d/networking stop and
latter start (restart don't seems to have same effect but again I couldn't
verify yet) on the pc,then I can log peack of 350k/s (that is already better
but that should be the limit of the adsl at this moment).
Another limits seems then to come from squid's caching which drop down flow
to about 100K/s.

So I still have to test ft without squid on the pc, with midle and big size
file, with get and put with various protocol from the two platform to confirm
this hypothesis (obvioulsy another way would be to use a 100bt router or
switch, but I couldn't get any one, and it would need to much time for me
to learn this
os).


>I expect mem copy routines are saturating the CPU and thrashing
>the data cache.  The tulip driver copies the entire buffer from
>where the card DMA'd to the skbuff in order to "bias" the buffer
>by 2 bytes. This avoids un-aligned data access in the "common" TCP case.
>Adding "unaligned access" macros to the "common" networking code
>path has been discussed and rejected (again) in the past month or so.
>Linus himself has rejected such proposals in the past to.
>
>If you twiddle the tulip driver to NOT copy all the data for
>packets > 512 bytes, the kernel will tell you when/where the network
>stack makes unaligned accesses. You can fix those and keep that as
>a local patch. I'd be interested in hearing the netperf (or httperf)
>numbers with such a patch when compared to the current behavior.
>
Ok I will try it first.

>thanks,
>grant
>
Thanks to your attention,
    Joel





-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr

From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: [PATCH] parisc: Improve LWS-CAS performance
Date: Mon, 12 May 2014 17:04:58 +0200
Message-ID: <trinity-da579718-e250-4165-8589-2d57702fcd21-1399907098483@3capp-gmx-bs31>
References: <BLU0-SMTP178D56FBECCDEE0B3D0BE6974A0@phx.gbl>
 <5283741.MSteB7R1e7@caliban.sf-tec.de>,
 <BLU0-SMTP37135E46D3493CE552217097350@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Rolf Eike Beer" <eike-kernel@sf-tec.de>,
	"linux-parisc List" <linux-parisc@vger.kernel.org>,
	"James Bottomley" <James.Bottomley@hansenpartnership.com>
To: "John David Anglin" <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP37135E46D3493CE552217097350@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 5/12/2014 2:11 AM, Rolf Eike Beer wrote:
> > Am Sonntag, 11. Mai 2014, 18:40:50 schrieb John David Anglin:
> >> The attached change significantly improves the performance of the LWS-
> >> CAS code in syscall.S.
> >> This allows a number of packages to build (e.g., zeromq3, gtest and
> >> libxs) that previously failed because
> >> slow LWS-CAS performance under contention.  In particular, interrupts
> >> taken while the lock was taken
> >> degraded performance significantly.
> > Sounds cool ;)
> >
> > The label cas_wouldblock would now only be defined in SMP case, which looks
> > odd. Since I can't find any references to it I think it should just be dropped.

> I was aware when I sent the change that the label cas_wouldblock is not 
> used.  Possibly, it should change to a comment but maybe that's a separate cleanup.

I left it in when I pushed your patch to my git tree:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

I think it makes sense to leave it in because it makes this piece clear.
In addition I added CC to push it backwards into kernels 3.13 and 3.14 too.

Helge

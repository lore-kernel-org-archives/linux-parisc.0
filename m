From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] SMP kernels for an HP J5600
Date: Tue, 24 Aug 2004 18:58:15 +0200
Message-ID: <412135A800004CED@ocpmta3.freegates.net>
References: <20040824150049.GC16318@mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: parisc-linux@parisc-linux.org
To: kyle@mcmartin.ca,
 "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040824150049.GC16318@mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> On Mon, Aug 23, 2004 at 11:01:11PM -0600, Grant Grundler wrote:
> > But the same bugs jejb found still exist in 2.4 kernels.
> > Kyle McMartin is looking at back porting those fixes and could
> > probably use help with the N4K and "mb() in spinlock()" patches.
> > 
> I passed the torch to Joel for this, :)
> 
Need a bit help:
_atomic_spin_[...], _raw_spin[...] are not in 2.4, exact?

in 2.4
I meet:
#define spin_lock(x) do { \
	while (__ldcw (&(x)->lock) =3D=3D 0) \
		while ((x)->lock =3D=3D 0) ; \
} while (0)

may I suggest to replace such thing by:
static inline void spin_lock(spinlock_t *x)
{
	volatile unsigned int *a;

	mb();
	a =3D __ldcw_align(x);
	while (__ldcw(a) =3D=3D 0)
		while (*a =3D=3D 0);
	mb();
}

Thanks in advance for feedback,
    Joel



-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

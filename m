From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] bitops.h: fls(unsigned long )
Date: Wed, 25 Aug 2004 08:41:03 +0200
Message-ID: <41213586000050F2@ocpmta2.freegates.net>
References: <20040824172230.GA16196@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: parisc-linux@parisc-linux.org
To: "Matthew Wilcox" <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040824172230.GA16196@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> On Tue, Aug 24, 2004 at 02:51:59PM +0200, Joel Soete wrote:
> > Sorry for this auto-reply but I just reboot with success my N4k (smp
64bit
> > kernel 2.6.8.1-pa7) with this patch and all works fine :)
> > 
> > If Ok for everybody can somebody ci for me (no cvs access :) )?
> 
> > > -static __inline__ int fls(int x)
> > > +static __inline__ int fls(unsigned long x)
> 
> This is absolutely not OK.  fls is prototyped to have an int parameter,=

> not an unsigned long.  Why do you want to do this, anyway?
> 
Oops: the original idea was to propose the equivalence of  __ffs(unsingne=
d
long). 

My bad.

Anyway it's tested fully ok and if we need it later, it's at least availa=
ble
in the list ;)

Thanks for advise,
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

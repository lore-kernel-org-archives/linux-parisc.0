From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: FW: Re: [parisc-linux] k-2.6.8-rc2-pa0 failled to boot in
	multi-user
Date: Wed, 28 Jul 2004 17:08:47 +0200
Message-ID: <40FB9ACA000045A9@ocpmta1.freegates.net>
References: <40FB87C400003EB8@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40FB87C400003EB8@ocpmta3.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


A small followup:

> > And I test it obiously (I just move cron atd and inetd with a .SAV ex=
tension;
> > that should be enough?) but unfortunately it doesn't help (the system=

> always
> > do an hpmc at the same palce:( ).
> > Even if I DECONFIGURE the second CPU?
> >
> > I haven't any more idea. (was it a pb already in 2.6.7>pa7 which I mi=
ssed
> > because I didn't realized enough test after that; or a new pb coming
with
> > 2.6.8? I laready tried to revert patches step by step from 2.6.7-pa15=

> to
> > pa8 against 2.6.8-rc2-pa1, but it didn't help yet :( )
> >
I revert 2.6.8-pa1 from 2.6.7-pa15 until 2.6.7-pa7 (the last know running=

2.6.7)  on this N4k with the n4000_defconfig and that's working. I mean
it is definitely not the upgrade 2.6.7 to 2.6.8 the cause of this pb, not=

more the n4000_defconfig.
So the weird stuff is in 'CONFIG_DISCONTIGMEM' patch even if the pb occur=
es
when this option is selected or not.

It's perfectly runing on the b2k (64bit kernel) (I suppose also on the n4=
k
that Randolph test also but with more ram than I)
but not on this n4k in particular?

Randolph may be have you another idea, the last DISCONTIGMEM patch runnin=
g
on this system was the first that you called 'try2' then diepest changes
occurs (the most difficult to understand for me are allways *.S :( ). 
umm I don't think that it's possible to split it in smallest hunk?

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

From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ncr53c8xx patch for c110
Date: Mon, 21 Jun 2004 18:11:30 +0200
Message-ID: <40BD9F870000CE2A@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: parisc-linux@parisc-linux.org
To: "Andy Walker" <ajwalker@broadpark.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> -- Original Message --
> Date: Mon, 21 Jun 2004 15:40:06 +0200 (CEST)
> From: "Andy Walker" <ajwalker@broadpark.no>
> To: "Joel Soete" <soete.joel@tiscali.be>
> Cc: parisc-linux@parisc-linux.org
> Subject: Re: [parisc-linux] ncr53c8xx patch for c110
>
>
> >>
> >> Patch works fine on the B132L too :-) As far as I know there wasn't
> >> a problem here before (only Ravens seemed affected), but the patch
> >> certainly didn't break anything!
> >
> > Umm you have right to check according
> > <http://www.openpa.net/systems/b-class.html>
> > model B132L (not B132L+) ,B160L are also equiped wuth NCR53C720 (as
well
> > as:
> >     *  735, 755 (ASP2)
> >     * B132L, B160L
> >     * C100, C110, C132L, C160L, C160, C180
> >     * D-Class
> >     * J200, J210, J210XC, J280, J282
> >     * K-Class
> >     * R380, R390  )
>
> Well, I know it has 720, but it doesn't have U2/U-turn which
> means ccio-dma.c isn't used (so the merge size hack wasn't
> needed on B-class).
ah yes I understand, it was very the couple U2/U-turn+NCR53C720 which was=

broken.

> Obviously its good to check that the fixed
> driver works properly,
Yes always ;)

> but this machine didn't have the Raven
> problem before your patch.
>
 ;)

> Incidentally, I spotted a report on the Gentoo forums of a 712
> with similar sounding lockups (stopped sometimes, usually when
> calculating module dependencies which is the first disk
> intensive thing the Gentoo boot process does assuming fsck
> doesn't need to run). But 712 only has 53C710 on LASI (using
> the 53C700 driver) so I guess it can't be related.

It should be. The c110 also have such LASI ASIC chip ;) and on its scsi
port I connected a CRW drive. This week-end I tried to uncompress-untar
the src of my working kernel tree burned on a cd. but the operation faill=
ed
with an i/o error.
At this moment, I didn't check more (too much focused on the ncr 720 patc=
h)
but I just check on my hpux b180 and there  is any pb to read the cd. So
either the drive is realy broken (but I already reach to burn and scan a
full 600Mb cd-rwwith a previous kernel) or there is a pb with 53c7[01]0
driver too?

James can you give us your opinion about this ?

Welcome,
    Joel


-------------------------------------------------------------------------=
--
NEW: Tiscali ADSL LIGHT, 28,95 EUR/mois, c'est le moment de faire le pas!=

http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from khan.acc.umu.se (khan.acc.umu.se [130.239.18.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1E86482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 May 2002 08:39:32 -0600 (MDT)
Date: Tue, 21 May 2002 16:39:11 +0200 (MET_DST)
From: Mattias Wadenstein <maswan@acc.umu.se>
To: Armijn Hemel <armijn@nl.linux.org>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] installing on b2600 fails
In-Reply-To: <20020521155220.A28518@humbolt.geo.uu.nl>
Message-ID: <Pine.A41.4.44.0205211630470.17882-100000@stalin.acc.umu.se>
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

On Tue, 21 May 2002, Armijn Hemel wrote:

> On Fri, May 17, 2002 at 09:49:23AM -0600, Grant Grundler wrote:
>
> > > I did try an unoffical ISO (Debian 3.0), but that also didn't work.
> > > Best to just wait for Debian 3.0?
> >
> > I can't answer this and will bug someone else here to do that.
> > Can you be more specific (and cc the mailing list) where
> > you got the ISO from (ie file name)?
>
> Sorry it took so long (no connectivity in the weekend and it was an extra
> long weekend here due to holidays). I got it from here:
>
> http://cdimage-unofficial.debian.net/
>
> [click click click]
>
> http://ftp.acc.umu.se/mirror/trasno.net/unofficial-debian-cds/woody-hppa/woody-hppa-1.raw

Please note that the guy doing these has run out of space and they are
starting to get quite old. I have in another place (
http://ftp.acc.umu.se/mirror/debian-cd/3.0-pre2/ ) some newer images, and
a pre-release for the actual woody images. I know there has been a few
bugs here and there, but I don't know of any hppa-specific.

Otherwise, I would suggest looking at the ftp.parisc-linux.org mirror I
have, there are some isos around there too, and they are probably better
tested for parisc-functionality. There is also a fairly small one for
doing netinstalls in that directory.

Personally, I don't have any experience in doing cd boots though. I have
only done netboot installs. (Setting up bootp+tftp and give it the
lifimage in the boot-floppies directory.)

/Mattias Wadenstein

Return-Path: <david.everly@mci.com>
Received: from pmesmtp01.mci.com (pmesmtp01.wcom.com [199.249.20.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62D14482D
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Apr 2004 11:13:19 -0600 (MDT)
Received: from pmismtp02.wcomnet.com ([166.38.62.37])
	by firewall.mci.com (Iplanet MTA 5.2)
	with ESMTP id <0HVW00EHLYI6DG@firewall.mci.com> for
	parisc-linux@lists.parisc-linux.org;
	Fri, 09 Apr 2004 17:13:18 +0000 (GMT)
Date: Fri, 09 Apr 2004 11:13:16 -0600
From: David Everly <david.everly@mci.com>
Subject: Re: [parisc-linux] Re: 0.9 release (HP 9000/800/K580 install problem)
In-reply-to: <20040409184921.7cf1f5a5.varenet@esiee.fr>
To: Thibaut VARENE <varenet@esiee.fr>
Message-id: <20040409171316.GC2405@csu6223286.mcilink.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; x-action=pgp-signed
References: <20040408231826.GB32148@csu6223286.mcilink.com>
	<20040409094050.639494f0.puffin@esiee.fr>
	<20040409113100.GA1716@csu6223286.mcilink.com>
	<20040409184921.7cf1f5a5.varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ah yes! I've been searching the archives for something like that, but
apparently not the right search terms.  I will try this and report back.

Thanks.

On Fri, Apr 09, 2004 at 10:49:21AM MDT, Thibaut VARENE wrote:
> I have just checked on a system installed using that particular netinst,
> ttyB0 is well created:
> 
> varenet@Tigrou:~$ ls -l /dev/ttyB0 
> crw-rw----    1 root     dialout   60,   0 Jun  7  2002 /dev/ttyB0
> 
> You're the second person to report that problem on the mailing list (check
> the archive) and I just can't figure out what's wrong with your setup.
> 
> I don't have any box requiring the use of ttyB0 handy to make some tests
> here, but the ttyB0 stuff has been in the netinsts for quite a while now
> and has been reported to work fine.
> 
> Anyway, check that mail, it seems that's there's a solution with newer
> kernels, with a new major number for /dev/ttyB0:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2004-April/022830.html
> 
> HTH,
> 
> 
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://www.pateam.org/

- -- 
David.Everly@mci.com
      IM: deckrider@jabber.org
   GnuPG: E1B6 40B6 B73F 695E 0D3B  644E 6427 DD74 8527 B9AF

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAdtmsZCfddIUnua8RAo3RAJ9ewYF41xrgfoswP5hr5Yf/jvzzKACfUjVI
BjSPi8JTGTrGV+U1f8bF1ok=
=0xhg
-----END PGP SIGNATURE-----

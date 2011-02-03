From: Meelis Roos <mroos@linux.ee>
Subject: Re: 2.6.38-rc3 regression on parisc: segfaults
Date: Fri, 4 Feb 2011 00:36:32 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1102040018390.16704@math.ut.ee>
References: <alpine.SOC.1.00.1102012342200.25944@math.ut.ee> <1296598360.18277.11.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1296598360.18277.11.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I have been testing devel kernels on SMP L1000 successfully until=20
> > 2.6.38-rc2-00324-g70d1f36 included. The testing means booting the n=
ew=20
> > kernel and running aptitude to update to current debian unstable.
> >=20
> > Now I tried 2.6.38-rc3 and got a crash from aptitude on 2 out of 2=20
> > tries. Maybe aptitude was broken inbetween but it looks like a kern=
el=20
> > bug. Retried 2.6.38-rc2-00324-g70d1f36 and that seemed to work fine=
 so=20
> > it's more likely a kernel problem.
> >=20
> > What additional information can I provide?
>=20
> Probably a bisection, if you could.  There have been no parisc patche=
s
> between -rc2 and -rc3, so it's coming from outside the architecture.

The result is strange :(

6b28405395f7ec492ea69f541cc774adcb9e00ca is the first bad commit
commit 6b28405395f7ec492ea69f541cc774adcb9e00ca
Author: Axel K=C3=B6llhofer <AxelKoellhofer@web.de>
Date:   Sat Jan 22 14:33:50 2011 -0600

    staging: r8712u: Add new device IDs

    This patch adds several new device ids to the r8712u staging driver=
=2E
    The new ids were retrieved from latest vendor driver (v2.6.6.0.2010=
1111)
    downloadable from www.realtek.com.tw

    Signed-off-by: Axel Koellhofer <AxelKoellhofer@web.de>
    Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
    Cc: Stable <stable@kernel.org> [2.6.37]
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

:040000 040000 185c3d2c1e98cc99009bfb772ed0779410784110 f5aa903931116f2=
8f803003f594fec3b2a29a6f6 M      drivers

Seems absolutely unrelated - I do not have staging enabled so so no=20
CONFIG_R8712U either.

The "bad" bisects were clearly bad and failed quicky during aptitude=20
list update but the good ones might have needed more stress... or it is=
=20
some alignment-like problem. Will try again starting from these bad=20
bisects to narrow it down, and stress seemingly good ones better.

--=20
Meelis Roos (mroos@linux.ee)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

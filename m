Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from u1snd02p.us.fortis.com (smtp02p.us.fortis.com [167.79.54.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B1DA4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Apr 2003 08:16:49 -0700 (MST)
Received: from W1PMM02.us.fortis.com (twbymime02.us.fortis.com [165.245.9.58])
	by u1snd02p.us.fortis.com (8.11.6+Sun/8.11.6) with ESMTP id h32FGl801422
	for <parisc-linux@lists.parisc-linux.org>; Wed, 2 Apr 2003 09:16:48 -0600 (CST)
Message-Id: <se8aaa7f.074@internal.us.fortis.com>
Date: Wed, 02 Apr 2003 09:16:05 -0600
From: "Derek Ellis" <Derek.Ellis@us.fortis.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] soft power and power light on 712/60
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

I wonder if the problem is with the precompiled 2.4.20-pa32 kernel, since=
=20that is what I am using.

Last night I also put my old 500MB HP drive back in and the light & power=
=20switch worked correctly with the 2.4.18 kernel.  I then used the netwo=
rk install CD (with kernel 2.4.20-pa32) to reinstall that drive.  After t=
he install the light & power didn't work, so this leads me to believe the=
re is something with that kernel.

Derek

>>> root <root@cdc712-9.cdc.polimi.it> 04/02/03 05:38AM >>>
On Wed, Apr 02, 2003 at 11:23:52AM +0200, Michael Wood wrote:
> On Tue, Apr 01, 2003 at 08:59:43AM -0600, Derek Ellis wrote:

I've got a problem similar to yours with my 712-60 using 2.4.20-pa32
precompiled. The power light while searching for a suitable boot
media (as it should), then goes on as expected. The power switch does not=

work. With earlier kernels (say 2.4.9-something) it worked. Any advice on=

that ?


> > Hello,
> >=20
> > I have sort of a weird problem.  I installed Debian 3.0 on Sunday and=

> > it came up great on my 712/60.  The only problem is the soft-power
> > switch doesn't work and the power light flashes while searching for
> > the boot device and then goes off once it starts booting. =20
>=20
> --=20
> Michael Wood <mwood@its.uct.ac.za>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org=20
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux=20
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org=20
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

****************************************************************
=09		Please Note
The information in this E-mail message is legally privileged
and confidential information intended only for the use of the
individual(s) named above. If you, the reader of this message,
are not the intended recipient, you are hereby notified that=20
you should not further disseminate, distribute, or forward this
E-mail message. If you have received this E-mail in error,
please notify the sender. Thank you
*****************************************************************

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3102482E
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 06:56:24 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: Andrew Shugg <andrew@neep.com.au>
Date: Tue, 5 Jun 2001 07:24:31 -0500
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
References: <20010605172316.A12216@neep.com.au>
MIME-Version: 1.0
Message-Id: <01060507541700.00472@wolf01.my.home>
Subject: [parisc-linux] Re: Version 0.9 of PA-RISC Linux Released
List-ID: <linux-parisc.vger.kernel.org>

Matthew -

Great idea - both sites should CLEARLY cross-link their information pages=
=2E

My own suggestions:
1) - leave the /devel directory on the CD image until at least
version 12.0.0 of pa-risc.linux.

I am using the kernel snap-shot of 06/03/2001 - in the hopes
that it is close to what was used to build the kernels in V0.9 -
but that is only a guess on my part

2) - don't drop a built kernel into an image of even a pre-release
CD until it compiles error (and warning) free.

Some of the problems I have found and fixed were clearly
mentioned by the compiler.

3) - Note to others trying fix "Old Box" support -

Please use a command line such as:
date >0603_something_cmnd.txt ; \
date >0603_something_errs.txt ; \
make vmlinux (or whatever) >>0603_something_cmnd.txt 2>>0603_something_er=
rs.txt

Then tar-zip the linux/.config, ...cmnd.txt, and the ...errs.txt -
attach to e-mail directed to Mike <mszick@pfash.com>

The more paths through this code taken by the compiler, the faster=20
I should be able to find (and maybe fix) the "Old Box" support.

4) - Note to folks posting the daily kernel snapshots -
4.a) - Please make the "daily snapshots" contain only changed
files from the prior "daily snapshot".
4.b) - Please make a "complete" kernel snapshot only once
a week.
4.c) - Please include the three files mentioned above in
each and every snapshot.

Being able to diff those three files is a big aid in making
progress on these problems.

Mike

On Tue, 05 Jun 2001, Andrew Shugg wrote:
> Matthew Wilcox said:
> > Well, 720 is explicitly mentioned as not yet being supported.
>=20
> I'm not sure who is looking after the debian-hppa web page at
> /ports/hppa/ (glad to see it is being kept up to date though!) but
> perhaps whomever it is could point to the parisc-linux.org hardware
> compatibility page.
>=20
>   http://parisc-linux.org/release-0.9/systems.html
>   http://parisc-linux.org/hardware/supported.html
>=20
> Or perhaps its information could be paraphrased on the debian-hppa page
> for first-time visitors?  eg "for the curious amongst you, the followin=
g
> systems work: xxx, these maybe work yyy, and these definitely don't zzz=
"
>=20
> Andrew.
>=20
> --
> Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com=
=2Eau/
>=20
> "Just remember, Mr Fawlty, there's always someone worse off than yourse=
lf."
> "Is there?  Well I'd like to meet him.  I could do with a good laugh."
>=20
>=20
> -- =20
> To UNSUBSCRIBE, email to debian-hppa-request@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debi=
an.org

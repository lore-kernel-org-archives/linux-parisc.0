Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA12043
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 22:40:02 -0700
Date: Tue, 16 Nov 1999 18:17:11 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: John David Anglin <dave.anglin@nrc.ca>, frowand@cup.hp.com,
        Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] depi?
Message-Id: <19991116181711.D750@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <3830A4C6.C2CB788@nrc.ca> <19991116133919.A25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991116133919.A25252@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> > I think it was done to simplify the syscall interface.

> Nope.  Maybe we'll need a slightly different syscall entry path depending
> on where the kernel ends up, but choosing where the kernel lives will have
> no material effect on syscalls.  About the only place which is undesirable
> for the kernel to live is 0xc000'0000 :-)

Actually, that's not even true because of our space register usage.  IIRC the
syscall page is at SR7 / 0xc000 0000 (SR7 may be written to in PL 0 only) so
there is nothing preventing us from setting the space register to something
different from 0x0000 0000 and managing a TLB entry for it - nothing but lazi-
ness, that is.

	Philipp Rumpf

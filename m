Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F00A482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 14:45:46 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: Version 0.9 of PA-RISC Linux Released
Date: Tue, 5 Jun 2001 15:22:20 -0500
Content-Type: text/plain
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org,
	parisc-linux@thepuffingroup.com
References: <20010605202920.U7349@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01060515450207.00472@wolf01.my.home>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 05 Jun 2001, Matthew Wilcox wrote:

> I've been working on this
> project for more than 2 years now, working for 3 different companies
> during that time. =20

I'll be glad to match my 4 decades of experience against your 2 years any=
time.
=20
> Not the way it works.=20
> Send patches now and they'll (probably) get integrated.

Perhaps that is not how it works in your world, but consider -

The only way to validate a change as a potential patch is:

1) start with a clean (error and warning free) build that
boots and runs on the machine of interest.

2) hack, change, modify, whatever

3) when done, make another clean build that boots and runs
on the machine of interest.

4) evaluate the effects of the change(s).

5) If successful - then you MIGHT have something worth
submitting as a POTENTIAL patch.

Exactly the same 5 steps your developers take before they
commit a change to CVS.

> So far i've heard nothing but talk from you. =20

That's right - until it is a clean build, boots and runs -
everything is talk and speculation.

>  Things will move on and you'll get left behind.

So what?

The only changes I make outside of the parisc specific
branch of the source tree are to bring the code in line
with 2.4.4 (stable).

The changes I make inside of the parisc specific branch
of the tree will be (someday) found by your own developers.

Just a matter of do you want to duplicate the time and=20
trouble of finding them yourself, or read about them in
the mail archives.

If you are serious about my suggestions being counter-productive,
I will gladly spend the time I am taking to write them for other purposes=
=2E

Mike
Mike

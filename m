Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from disaster.jaj.com (disaster.jaj.com [66.92.223.91])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFB94482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 May 2002 08:32:37 -0600 (MDT)
Date: Mon, 6 May 2002 10:32:12 -0400
From: Phil Edwards <phil@jaj.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, doko@cs.tu-berlin.de,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org
Subject: Re: [parisc-linux] Re: gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
Message-ID: <20020506103212.A27151@disaster.basement.lan>
References: <20020504165740.GN30370@tausq.org> <200205041754.g44Hs8it027911@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200205041754.g44Hs8it027911@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Sat, May 04, 2002 at 01:54:07PM -0400
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

> > i am concerned that between gcc versions, there are often changes in the
> > C++ (and maybe others) ABI, and moving all of our packages to the new 
> > version is likely going to be a painful process. If the g++-3.2 ABI is
> > already frozen (?)

The C++ ABI is done, but there were minor bugs in 3.0's implementation of
that ABI.  The bugs were fixed in 3.1, thus the change.

The libstdc++ ABI is /not/ stable yet.


> I still haven't figured out why libstdc++ needs to be installed prior
> to running the testsuite.

That's weird... nothing immediately comes to mind.


Phil

-- 
If ye love wealth greater than liberty, the tranquility of servitude greater
than the animating contest for freedom, go home and leave us in peace.  We seek
not your counsel, nor your arms.  Crouch down and lick the hand that feeds you;
and may posterity forget that ye were our countrymen.            - Samuel Adams

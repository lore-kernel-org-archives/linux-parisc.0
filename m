Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA17100
	for <parisc-linux@sod.res.cmu.edu>; Fri, 16 Apr 1999 16:24:12 -0400
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199904162022.QAA00184@lucifier.dial-up.user.akula.net>
Subject: Re: [parisc-linux] Some things to do...
In-Reply-To: <Pine.LNX.3.96.990416155029.27211L-100000@devserv.devel.redhat.com> from Alex deVries at "Apr 16, 99 04:01:45 pm"
To: adevries@redhat.com (Alex deVries)
Date: Fri, 16 Apr 1999 16:22:59 -0400 (EDT)
Cc: parisc-linux@thepuffingroup.com
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Alex deVries:
> 
> I just thought I'd revive things by spitting out a few things on the grand
> to do list; I'm sure I'm missing things.  Please pipe up.

> 1. Fixing binutils
> There's problems with binutils and linking.  I can't tell you precisely
> what because I don't understnad it myself.  I know we need to resolve the
> ELF situation.  Ulrich, comments on this?
i'm not Ulrich but, Jeff Law said that current ld support is clearly
quick and dirty hack he did, which has to be wiped out, and
rewritten from scratch.
there are no "small bugs" in it, it's just wrong (:

> 2. Kernel stuff
> There's of course MMU and interrupt stuff, but we need the binutils sorted
> out first I suspect.
anything we can work out here, guys, i can help? (:

cu

-- 
    paranoic mickey       (my employers have changed but, the name has remained)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Mon, 4 Aug 2008 15:39:57 -0400 (EDT)
Message-ID: <20080804193957.783104E6A@hiauly1.hia.nrc.ca>
References: <20080417075357.GB23641@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080417075357.GB23641@phobos.i.cabal.ca> from "Kyle McMartin" at Apr 17, 2008 03:53:57 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Apr 06, 2008 at 07:09:59PM -0400, John David Anglin wrote:
> > > If you strace it, what syscall returns -EOPNOTSUPP?
> > 
> > strace is broken and quits before the relevant syscall.  Think I
> > mentioned this before is a different context.
> > 
> 
> Fixed & updated strace available at
> http://people.debian.org/~kyle/strace/

lgetxattr("strace_4.5.16-1_hppa.deb", "security.selinux"..., 0x2c768, 255) = -1 EOPNOTSUPP 
(Operation not supported)

This is probably the correct return but the manpage for lgetxattr says
it should return ENOTSUP.  Possibly, the problem occurs on hppa because
ENOTSUP and EOPNOTSUPP are different codes.  In any case, the current
version of ls only checks for ENOTSUP.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

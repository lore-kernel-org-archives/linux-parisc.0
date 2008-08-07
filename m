From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Thu, 7 Aug 2008 17:08:04 -0400
Message-ID: <20080807210804.GB4259@phobos.i.cabal.ca>
References: <20080417075357.GB23641@phobos.i.cabal.ca> <20080804193957.783104E6A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080804193957.783104E6A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 04, 2008 at 03:39:57PM -0400, John David Anglin wrote:
> > On Sun, Apr 06, 2008 at 07:09:59PM -0400, John David Anglin wrote:
> > > > If you strace it, what syscall returns -EOPNOTSUPP?
> > > 
> > > strace is broken and quits before the relevant syscall.  Think I
> > > mentioned this before is a different context.
> > > 
> > 
> > Fixed & updated strace available at
> > http://people.debian.org/~kyle/strace/
> 
> lgetxattr("strace_4.5.16-1_hppa.deb", "security.selinux"..., 0x2c768, 255) = -1 EOPNOTSUPP 
> (Operation not supported)
> 
> This is probably the correct return but the manpage for lgetxattr says
> it should return ENOTSUP.  Possibly, the problem occurs on hppa because
> ENOTSUP and EOPNOTSUPP are different codes.  In any case, the current
> version of ls only checks for ENOTSUP.
> 

Ah, it's wrong.

ls.c should be checking for -EOPNOTSUP, which is the only thing any of
the kernel codepaths return for failing xattr calls. You're correct in
diagnosing that this is only problematic on parisc, because we're the
only folks who use a different value for EOPNOTSUP and ENOTSUP.

cheers, Kyle

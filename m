From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Tue, 5 May 2009 13:05:16 -0400
Message-ID: <20090505170516.GA3094@bombadil.infradead.org>
References: <20080417075357.GB23641@phobos.i.cabal.ca> <20090502223459.BC8924EE8@hiauly1.hia.nrc.ca> <20090502234348.GE28342@bombadil.infradead.org> <200905042346.11132.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200905042346.11132.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 04, 2009 at 11:46:09PM -0400, Mike Frysinger wrote:
> if said fix could actually get posted to the strace devel list at sf.net, 
> that'd be even better ...
> 
> probably related:
> http://bugs.gentoo.org/250631

http://userweb.kernel.org/~kyle/strace-add-hppa-syscalls.diff
http://userweb.kernel.org/~kyle/strace-fix-hppa-syscalls.diff

Apply against upstream strace cvs. I'll poke Roland about it.

cheers, Kyle

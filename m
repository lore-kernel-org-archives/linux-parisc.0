Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 22 May 2003 09:15:52 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Ulrich Drepper <drepper@redhat.com>,
	libc-alpha@sources.redhat.com, parisc-linux@lists.parisc-linux.org,
	Randolph Chung <tausq@debian.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Subject: Re: [parisc-linux] Re: [PATCH] HPPA Linuxthreads.
Message-ID: <20030522151552.GB22338@dsl2.external.hp.com>
References: <20030521172929.GB21858@systemhalted> <3ECBBE25.8090302@redhat.com> <20030522150902.GM21858@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030522150902.GM21858@systemhalted>
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

On Thu, May 22, 2003 at 11:09:02AM -0400, Carlos O'Donell wrote:
> > > +	while (__ldcw (addr) == 0)
> > > +		while (*addr == 0) ;
> > 
> > This is plain wrong.  addr at least must be volatile.
> 
> __ldcw is volatile.

yes, but *addr can be optimized out of the while loop.

> Are you suggesting that it is prehaps fragile based on gcc's 
> choice of optimization?

That's another issue. OTOH, I doubt gcc will ever mangle this
fairly short chunk of code. Maybe post the gcc asm output and
see if anyone can improve it.

grant

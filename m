Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACEC94875
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 17 Dec 2003 11:42:51 -0700 (MST)
Date: Wed, 17 Dec 2003 13:35:37 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: dlopen failed on 'libthread_db.so.1' -
Message-ID: <20031217183536.GF24083@systemhalted>
References: <20031217155313.GC24083@systemhalted>
	<200312171643.hBHGhmkF001220@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200312171643.hBHGhmkF001220@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Dec 17, 2003 at 11:43:48AM -0500, John David Anglin wrote:
> > See:
> > 
> > gdb/proc-service.c
> > gdb/gdbserver/proc-service.c
> > 
> > *unless* You are insinuating that the loader has messed up the symbol
> > resolution and ps_pglobal_lookup exists but isn't resolved properly...
> > which is a whole 'nother can of wormns :)
> 
> I'll take a look.  Based on what you have said, it's likely the gdb-6.0
> isn't being linked correctly on hppa-linux.  Debian gdb-6.0-2 doesn't
> build as is, and I had to make some minor mod's to the patch set and hack 
> a config file to include linux-nat.o in the required files.

AFAIK there was major work required. I shy'd away completely as glibc
was taking up all my time and seemed like a better place to start :)

Current todo:

- Giving up on fixing dlopen from static app, too tough for me right
  now.
- Atomic ups are up next, with possibly a review of time functions,
  monotonicity and a fast gettimeofday.

c.

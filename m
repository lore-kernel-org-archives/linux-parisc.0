Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D27374854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 17 Dec 2003 17:21:19 -0700 (MST)
Message-Id: <200312180021.hBI0LHkC022778@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: dlopen failed on 'libthread_db.so.1' -
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 17 Dec 2003 19:21:17 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20031217183536.GF24083@systemhalted> from "Carlos O'Donell" at
	Dec 17, 2003 01:35:37 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Wed, Dec 17, 2003 at 11:43:48AM -0500, John David Anglin wrote:
> > > See:
> > > 
> > > gdb/proc-service.c
> > > gdb/gdbserver/proc-service.c
> > > 
> > > *unless* You are insinuating that the loader has messed up the symbol
> > > resolution and ps_pglobal_lookup exists but isn't resolved properly...
> > > which is a whole 'nother can of wormns :)
> > 
> > I'll take a look.  Based on what you have said, it's likely the gdb-6.0
> > isn't being linked correctly on hppa-linux.  Debian gdb-6.0-2 doesn't
> > build as is, and I had to make some minor mod's to the patch set and hack 
> > a config file to include linux-nat.o in the required files.

dave@gsyprf11:~/gdb-6.0-2/objdir/gdb$ nm gdb|grep ps_pglobal_lookup
000dc904 T ps_pglobal_lookup

Looks as if there is a problem with dlopen.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

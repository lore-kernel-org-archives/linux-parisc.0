From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [PATCH] HPPA Linuxthreads.
Date: Thu, 22 May 2003 11:53:44 -0400 (EDT)
Message-ID: <200305221553.h4MFrjnW010970__8052.01807893372$1416622476$gmane$org@hiauly1.hia.nrc.ca>
References: <20030522151552.GB22338@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@baldric.uwo.ca, drepper@redhat.com,
	libc-alpha@sources.redhat.com, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org, dave.anglin@nrc-cnrc.gc.ca
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030522151552.GB22338@dsl2.external.hp.com> from "Grant Grundler" at May 22, 2003 09:15:52 am
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> On Thu, May 22, 2003 at 11:09:02AM -0400, Carlos O'Donell wrote:
> > > > +	while (__ldcw (addr) == 0)
> > > > +		while (*addr == 0) ;
> > > 
> > > This is plain wrong.  addr at least must be volatile.
> > 
> > __ldcw is volatile.
> 
> yes, but *addr can be optimized out of the while loop.

Yes, you are correct.  This is the code from the inner loop:

  1c:   0f 40 10 93     ldw 0(,r26),r19
  20:   86 60 3f f5     cmpib,= 0,r19,20 <__pthread_spin_lock+0x20>
  24:   08 00 02 40     nop

Don't know how I missied that :(

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

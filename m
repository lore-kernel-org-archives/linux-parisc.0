Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 266024831
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 16:54:47 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308302254.SAA01088@hiauly3.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [glibc] fixing delayed exceptions in hppa
To: carlos@baldric.uwo.ca
Date: Sat, 30 Aug 2003 18:54:45 -0400 (EDT)
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca,
	willy@debian.org
In-Reply-To: <20030830163732.GG5194@systemhalted> from Carlos O'Donell at Aug "30," 2003 "12:37:33" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > Yes.  If you follow the thread that I sent you, Jim Hull comments on
> > this and offers a rewrite of the sentence that you quoted.  I believe
> > that referencing memory is important as this makes the operation visible
> > to another processor.  A register->register operation doesn't do this.
> > 
> 
> I implemented and tested 3 versions, fcpy doesn't work on my c3k, but
> the fstd and fldd does. Any recommendations on which to take. I'm
> tempted to leave all this in and send the patch like this upstream, so I
> don't forget what the other versions looked like :)

The FSTD barrier looks fine to me.  The fcpy version doesn't work, so
I wouldn't keep it around.  You might add a comment that fcpy doesn't
work on at least some implementations.

Dave

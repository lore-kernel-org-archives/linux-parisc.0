Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40D1A4920
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Aug 2003 10:12:08 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308231612.MAA21233@hiauly3.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [glibc] fixing delayed exceptions in hppa
To: carlos@baldric.uwo.ca
Date: Sat, 23 Aug 2003 12:12:07 -0400 (EDT)
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
In-Reply-To: <20030823055506.GA9821@systemhalted> from Carlos O'Donell at Aug "23," 2003 "01:55:06" am
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

> On Fri, Aug 22, 2003 at 04:24:19PM -0400, John David Anglin wrote:
> > Based on what Jim Hull said, I believe that would be better.  I was using
> > 
> >   "fldd 0(%%sr0,%%sp),%0" : "=f" (d) : "0" (d)
> > 
> > There isn't a true dependency in the above but I believe that any load
> > to the destination register will raise the exception.
> 
> Dave, I'm sorry if you sent me a patch and I dropped it :( Did I ever
> receive a diff for this from you?

I can't recall but I probably did send it last November.  My email
machine is still down because of the blackout.

> It's rather vague at times because the spec says "or an operation which
> depends on a pending, trapping insn." I think DHD, and perhaps myself
> got caught up on the "load or store" which probably means only
> register->memory (memory->register too) and not register->register.

Yes.  If you follow the thread that I sent you, Jim Hull comments on
this and offers a rewrite of the sentence that you quoted.  I believe
that referencing memory is important as this makes the operation visible
to another processor.  A register->register operation doesn't do this.

Dave

Return-Path: <carlos@baldric.uwo.ca>
Received: from fep01-mail.bloor.is.net.cable.rogers.com
	(fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40A2248AF
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 25 Jan 2004 19:14:51 -0700 (MST)
Date: Sun, 25 Jan 2004 21:15:09 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kernel BUG at mm/shmem.c:585!
Message-ID: <20040126021508.GZ1060@baldric.uwo.ca>
References: <20040123142426.GE4571@baldric.uwo.ca>
	<200401231940.i0NJeSJJ004756@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401231940.i0NJeSJJ004756@hiauly1.hia.nrc.ca>
Cc: grundler@parisc-linux.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 23, 2004 at 02:40:27PM -0500, John David Anglin wrote:
> > It appears non-fatal, and I want to blame the compiler :)
> 
> I agree but the proof is in the pudding ;-)

I told Grant, that at my current schedule, it would be 2006 
before I fixed this problem :)

It looks like a reordering issue, perhaps taking a look at the
respective .o objects produced by the two compilers might reveal the
issue. I think that's the way we did it when the tty layer broke and we
had to have that console.o compiled with 3.0.4 by hand? I think Randolph
and Grant worked on that together. I might have the wrong names, but
we've successfully debugged a problem like this before using similar
methods.

c.

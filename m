Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C3A0484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 25 Jan 2004 19:35:11 -0700 (MST)
Message-Id: <200401260235.i0Q2Z783024373@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kernel BUG at mm/shmem.c:585!
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sun, 25 Jan 2004 21:35:07 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040126021508.GZ1060@baldric.uwo.ca> from "Carlos O'Donell" at
	Jan 25, 2004 09:15:09 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Fri, Jan 23, 2004 at 02:40:27PM -0500, John David Anglin wrote:
> > > It appears non-fatal, and I want to blame the compiler :)
> > 
> > I agree but the proof is in the pudding ;-)
> 
> I told Grant, that at my current schedule, it would be 2006 
> before I fixed this problem :)

My schedule isn't much better.  I'm off to Tokyo at the end of the week
to waive the Canadian flag at the ISO LRG meetin next week.  After that,
my brother's company would like me to work on more firmware for a new
project.

Is this on a SMP kernel (i.e., could this be a locking issue)?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

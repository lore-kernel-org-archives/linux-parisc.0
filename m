Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 781C548B7
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Aug 2003 13:10:25 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308311910.PAA04875@hiauly3.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [glibc] tststatic failues, reduced to simp le testcase.
To: dave@hiauly3.hia.nrc.ca
Date: Sun, 31 Aug 2003 15:10:23 -0400 (EDT)
Cc: carlos@baldric.uwo.ca, randolph@tausq.org,
	dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <no.id> from dave at Aug "31," 2003 "02:21:52" pm
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

> > I've added all the caller-saves registers to our clobber lists when
> > making syscalls. Though, r19 being special, I've had to add "STW_PIC"
> > and "LDW_PIC" that do the saving and restore _only_ if we are compiled
> > PIC.
> 
> That seems overly pessimistic and will mean a lot more register saves
> in routines that do syscalls.  It appears the system saves the caller-save
> registers in all syscalls except the fork related calls.  It would
> be best to keep the number of clobbers to a minimum.  I wonder, there
> seems to be a slot in the task struct for r1, but it's never saved in
> a syscall, and r1 is clobbered.  Maybe the r1 slot could be used to save
> r2.  This might mean that we don't need to use GR21 or GR22 at all.
> It would avoid having to have special pic code.

Another possibility might be to define another couple of offsets in the
task struct.  It looks as if there is plenty of space before an alignment
boundary is reached.

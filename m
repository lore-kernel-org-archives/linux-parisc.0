Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id A549348A9
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Aug 2003 12:21:54 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308311821.OAA04520@hiauly3.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [glibc] tststatic failues, reduced to simp le testcase.
To: carlos@baldric.uwo.ca
Date: Sun, 31 Aug 2003 14:21:52 -0400 (EDT)
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030831153837.GJ5194@systemhalted> from Carlos O'Donell at Aug "31," 2003 "11:38:38" am
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

> > I don't fully understand this code but possibly PT_GR20 might be used
> > to save r2.  In the fork call for example, we know that this location
> > contains  __NR_fork.  This value gets restored to r20 in wrapper_exit.
> > I think the valued saved above is loaded into r2 here:
> 
> So you say perhaps instead of PT_GR19 we use PT_GR20 and
> TASK_PT_GR20? I think we can't though, because tracing the syscall
> requires that GR20 continue to retain the syscall value. I think we can
> use _any_ other caller-saves registers (including the last input for the
> fork-ish calls e.g. GR21 or GR22?).

Isn't the restoration of the value in wrapper_exit enough or is strace
looking in the task struct?

> Me neither. Perhaps it's superfluous and can be used to retrieve r2 and
> thus keep r19 safe.

It's worth a try.

> > If a syscall is going to clobber registers, the appropriate clobbers
> > need to be added to the asm used for the syscall so that gcc doesn't
> > try to use these registers over the syscall.  Use of PT_GR19 appears
> > to have been a bad choice because of its special use in pic code.
> 
> I've added all the caller-saves registers to our clobber lists when
> making syscalls. Though, r19 being special, I've had to add "STW_PIC"
> and "LDW_PIC" that do the saving and restore _only_ if we are compiled
> PIC.

That seems overly pessimistic and will mean a lot more register saves
in routines that do syscalls.  It appears the system saves the caller-save
registers in all syscalls except the fork related calls.  It would
be best to keep the number of clobbers to a minimum.  I wonder, there
seems to be a slot in the task struct for r1, but it's never saved in
a syscall, and r1 is clobbered.  Maybe the r1 slot could be used to save
r2.  This might mean that we don't need to use GR21 or GR22 at all.
It would avoid having to have special pic code.

Dave

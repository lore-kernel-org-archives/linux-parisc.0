From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Thu, 31 Dec 2009 17:38:31 -0500 (EST)
Message-ID: <20091231223832.85D024EF1@hiauly1.hia.nrc.ca>
References: <119aab440912311014j276d8c29mc8d8b59c7c5cafd1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912311014j276d8c29mc8d8b59c7c5cafd1@mail.gmail.com> from "Carlos O'Donell" at Dec 31, 2009 01:14:27 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
> On Tue, Dec 29, 2009 at 8:47 AM, Helge Deller <deller@gmx.de> wrote:
> >> 2) Change return space register to sr7. =A0sr3 is not set correctly
> >> if the entry number is invalid.
> >
> > Yep.
> >
> >> Have nasty suspicion that sr3 is getting hit...
> 
> Is the thought here that we take an interrupt, and sr3 is not
> guaranteed saved/restored, while sr7 is guaranteed?

sr3 isn't guaranteed because user could have changed its value.  So,
it is better to use sr7 for the return, particularly when lws entry
number isn't valid.

Regarding the handling of space registers during interruptions, they
are not saved.  syscall_exit_rfi restores them to proper values:

        /*
	 * If we aren't being traced, we never saved space registers
	 * (we don't store them in the sigcontext), so set them
	 * to "proper" values now (otherwise we'll wind up restoring
	 * whatever was last stored in the task structure, which might
	 * be inconsistent if an interrupt occured while on the gateway
	 * page). Note that we may be "trashing" values the user put in
	 * them, but we don't support the user changing them.
	*/

	STREG   %r0,PT_SR2(%r16)
	mfsp    %sr3,%r19
	STREG   %r19,PT_SR0(%r16)
	STREG   %r19,PT_SR1(%r16)
	STREG   %r19,PT_SR3(%r16)

As can be seen, sr2 set to the kernel space and sr3 to the user space.
This is consistent with the usage in the LWS code, so an interruption
shouldn't be a problem on most syscall returns via this path.  However,
execve doesn't restore the space register values (at least in this path).

The comment in the LWS code is a bit misleading:

        /* WARNING: Trashing sr2 and sr3 */
	mfsp    %sr7,%r1                        /* get userspace into sr3 */
	mtsp    %r1,%sr3
	mtsp    %r0,%sr2                        /* get kernel space into sr2 */

Actually, sr2 and sr3 are restored to their "proper" values.

The TLB code seems to assume a consistent use of sr3.  So, this may not
be a space register issue.

The syscall_restore uses a rsm/ssm pair to make the operation atomic.
Maybe we don't catch all situations where process is scheduled.

As an aside, it seems gdb doesn't print space registers correctly
when debugging a program.  I would guess this is because they are
not saved in the context.  It does print them from a core dump.

> I don't see anything wrong with moving the gate earlier (unless
> someone can come up with a case where an LWS may not want to gate).
> 
> It has the benefit of making the fast path 1 instruction shorter,
> however I don't see that it makes the implementation more correct.

I believe that it does have an effect.  See for example, the discussion
regarding delivery of signals to processes executing on the gateway page
in traps.c.  With the branch, it is possible that a signal could be
sent to a process executing on the gateway page.  See also space_check
macro in entry.S.  There's also the ptrace issue mentioned by Randolph.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

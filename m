From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sun, 25 Feb 2007 12:04:50 -0500 (EST)
Message-ID: <200702251704.l1PH4pUf023982__42740.5430622914$1416624315$gmane$org@hiauly1.hia.nrc.ca>
References: <1172414852.3423.6.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172414852.3423.6.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Feb 25, 2007 08:47:32 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, 2007-02-24 at 23:27 -0500, John David Anglin wrote:
> > You have to watch out for "be,l" which mucks with sr0.
> 
> But practically, the kernel's not going to link to a new space, and the
> user can't.

>>>From a hardware standpoint, the user can change sr0 through sr4.
Changing sr4 in user space isn't going to work.  However,
in the 32-bit hpux runtime, the user is free to change sr0 through
sr3 in whatever way they want.  At least at one time, there
was a desire to provide hpux runtime compatibility.  So, a branch
sequence like the following

	ldsid (%r1),%r31
	mtps %r31,%sr3
	be 0(%sr3,%r1)

should work in linux even if it's not efficient.  I picked sr3
in the example since it's no longer saved on interrupts with your
patch.  The branch will work if the kernel restores on interrupt
return the value used in sr4 through sr7.  However, then the user
can't use sr3 for any other purpose.

> But the point isn't that we might change them ... it's that by
> convention we always know what their values should be, so we didn't
> really need to save them (except sr1 and sr2 from the kernel).  And
> actually, that's a potential (but I suspect never seen) bug in that this
> code doesn't set the space registers aggressively enough for a trap from
> user context.

I don't see how the kernel can know what should be in sr0 through sr3,
and I think the user can use these registers for any purpose in the
32-bit runtime.  In wide mode, things are different as the OS is allowed
to change the space registers at any time (see note for ldsid insn).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

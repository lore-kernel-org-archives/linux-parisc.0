From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sun, 25 Feb 2007 11:41:08 -0600
Message-ID: <1172425268.3423.18.camel__41646.2061730728$1416624315$gmane$org@mulgrave.il.steeleye.com>
References: <200702251704.l1PH4pUf023982@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702251704.l1PH4pUf023982@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-25 at 12:04 -0500, John David Anglin wrote:
> > On Sat, 2007-02-24 at 23:27 -0500, John David Anglin wrote:
> > > You have to watch out for "be,l" which mucks with sr0.
> > 
> > But practically, the kernel's not going to link to a new space, and the
> > user can't.
> 
> >From a hardware standpoint, the user can change sr0 through sr4.
> Changing sr4 in user space isn't going to work.  However,
> in the 32-bit hpux runtime, the user is free to change sr0 through
> sr3 in whatever way they want.  At least at one time, there
> was a desire to provide hpux runtime compatibility.  So, a branch
> sequence like the following
> 
> 	ldsid (%r1),%r31
> 	mtps %r31,%sr3
> 	be 0(%sr3,%r1)
> 
> should work in linux even if it's not efficient.

I think you'll find that unless %sr3 is zero or your current space,
you'll get a protection trap (and if it's zero, you'll likely get a
privilege trap).

Linux doesn't use spaces like HPUX, which is why hpux compatibility at
this level just won't work.  In Linux, every user process runs in a
different, isolated space.

>   I picked sr3
> in the example since it's no longer saved on interrupts with your
> patch.  The branch will work if the kernel restores on interrupt
> return the value used in sr4 through sr7.  However, then the user
> can't use sr3 for any other purpose.
> 
> > But the point isn't that we might change them ... it's that by
> > convention we always know what their values should be, so we didn't
> > really need to save them (except sr1 and sr2 from the kernel).  And
> > actually, that's a potential (but I suspect never seen) bug in that this
> > code doesn't set the space registers aggressively enough for a trap from
> > user context.
> 
> I don't see how the kernel can know what should be in sr0 through sr3,
> and I think the user can use these registers for any purpose in the
> 32-bit runtime.  In wide mode, things are different as the OS is allowed
> to change the space registers at any time (see note for ldsid insn).

The user space convention on linux says that sr0,1,3-7 should contain
the current space and sr2 contains zero for gateway operations.
Theoretically, the user can stash values in sr0-3 as long as they're
never used; practically, nothing does this.

However, this is pretty much moot ... the more agressive space shifting
code will have to loop over all of the space registers in the context,
so it will be saving and restoring them all.

James

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

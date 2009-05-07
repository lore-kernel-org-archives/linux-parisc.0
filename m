From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Thu, 07 May 2009 21:06:44 +0000
Message-ID: <1241730404.3254.77.camel@mulgrave.int.hansenpartnership.com>
References: <20090507184111.023084FC4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090507184111.023084FC4@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2009-05-07 at 14:41 -0400, John David Anglin wrote:
> > On Thu, May 07, 2009 at 01:41:03PM -0400, John David Anglin wrote:
> > > > On Wed, May 06, 2009 at 01:39:49PM -0400, John David Anglin wrote:
> > > > > > The tombstone is:
> > > > > > 
> > > > > > do_page_fault() pid=10205 command='strace' type=15 address=0x407d2f18
> > > > > > vm_start = 0x4068d000, vm_end = 0x4068f000
> > > > > 
> > > > > So, the pointer passed to __canonicalize_funcptr_for_compare is outside
> > > > > the vm range.
> > > > > 
> > > > > Maybe "info sharedlib" will show something.  Need to find out why the
> > > > > address of the function descriptor is outside the vm range.
> > > > > 
> > > > 
> > > > 405c0000-405c2000 rwxp 405c0000 00:00 0 
> > > 
> > > The function pointer address is also outside this range.
> > > 
> > 
> > Sorry, this was with a rebuilt binary, and it lies within this range.
> 
> It's marked rwxp, so why the fault?

That's a bit fascinating ... it means we got into the bad_area: goto of
do_page_fault() somehow even though the vma apparently allowed the fault
and we should have been able to page it in.  Something like this might
explain a lot of our stability problems.

James



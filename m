From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Thu, 7 May 2009 14:37:24 -0400
Message-ID: <20090507183724.GC30675@bombadil.infradead.org>
References: <20090507165216.GB30675@bombadil.infradead.org> <20090507174104.1634E4EE8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090507174104.1634E4EE8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 07, 2009 at 01:41:03PM -0400, John David Anglin wrote:
> > On Wed, May 06, 2009 at 01:39:49PM -0400, John David Anglin wrote:
> > > > The tombstone is:
> > > > 
> > > > do_page_fault() pid=10205 command='strace' type=15 address=0x407d2f18
> > > > vm_start = 0x4068d000, vm_end = 0x4068f000
> > > 
> > > So, the pointer passed to __canonicalize_funcptr_for_compare is outside
> > > the vm range.
> > > 
> > > Maybe "info sharedlib" will show something.  Need to find out why the
> > > address of the function descriptor is outside the vm range.
> > > 
> > 
> > 405c0000-405c2000 rwxp 405c0000 00:00 0 
> 
> The function pointer address is also outside this range.
> 

Sorry, this was with a rebuilt binary, and it lies within this range.

cheers, Kyle

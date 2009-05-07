From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Thu, 7 May 2009 13:41:03 -0400 (EDT)
Message-ID: <20090507174104.1634E4EE8@hiauly1.hia.nrc.ca>
References: <20090507165216.GB30675@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090507165216.GB30675@bombadil.infradead.org> from "Kyle McMartin" at May 7, 2009 12:52:16 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, May 06, 2009 at 01:39:49PM -0400, John David Anglin wrote:
> > > The tombstone is:
> > > 
> > > do_page_fault() pid=10205 command='strace' type=15 address=0x407d2f18
> > > vm_start = 0x4068d000, vm_end = 0x4068f000
> > 
> > So, the pointer passed to __canonicalize_funcptr_for_compare is outside
> > the vm range.
> > 
> > Maybe "info sharedlib" will show something.  Need to find out why the
> > address of the function descriptor is outside the vm range.
> > 
> 
> 405c0000-405c2000 rwxp 405c0000 00:00 0 

The function pointer address is also outside this range.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

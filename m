From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Wed, 6 May 2009 13:39:49 -0400 (EDT)
Message-ID: <20090506173950.0F5244FC6@hiauly1.hia.nrc.ca>
References: <20090506162522.GF3094@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090506162522.GF3094@bombadil.infradead.org> from "Kyle McMartin" at May 6, 2009 12:25:22 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The tombstone is:
> 
> do_page_fault() pid=10205 command='strace' type=15 address=0x407d2f18
> vm_start = 0x4068d000, vm_end = 0x4068f000

So, the pointer passed to __canonicalize_funcptr_for_compare is outside
the vm range.

Maybe "info sharedlib" will show something.  Need to find out why the
address of the function descriptor is outside the vm range.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

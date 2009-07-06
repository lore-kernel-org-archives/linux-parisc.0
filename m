From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Mon, 6 Jul 2009 09:28:33 -0400 (EDT)
Message-ID: <20090706132836.B39E6500D@hiauly1.hia.nrc.ca>
References: <4A518DBD.3090209@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, carlos@systemhalted.org,
	deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org, kyle@mcmartin.ca
To: randolph@tausq.org (Randolph Chung)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A518DBD.3090209@tausq.org> from "Randolph Chung" at Jul 6, 2009 01:38:05 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >>>>> I seem to recall that the kernel mmap implementation on hppa is somewhat
> >>>>> unique.
> >>>>>           
> >>>> I don't recall anything, Kyle?
> >>>>         
> >>> This came up with respect to the GCC PCH implementation for parisc.  See
> >>> comments in host-hpux.h.  At the moment, we do have a PCH related bug.
> >>> See PR 39355.  While I know the problem is present in the PCH file, I
> >>> haven't been able to figure out how wrong data gets in the file.
> >>>       
> There are some limitations on hppa if a file is both opened for reading 
> (via read()) and written to via a mmap'ed mapping. This came up a few 
> years ago.
> 
> Does gcc do this?

Not that I am aware of.  The situation is essentially the reverse of
the above.  Data is written from a region of memory.  Then, in another
instance of gcc, it needs to be mmap'ed back to the same location in
memory.  In theory, it could be brought back to a different location
but this would require a fairly complex set of relocations.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

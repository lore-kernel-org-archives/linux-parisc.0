From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [RFC] fix the relative jump problem on large modules
Date: Sat, 19 Jun 2010 19:21:27 -0400 (EDT)
Message-ID: <20100619232128.6010C5160@hiauly1.hia.nrc.ca>
References: <1276988266.4416.222.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1276988266.4416.222.camel@mulgrave.site> from "James Bottomley" at Jun 19, 2010 05:57:46 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The theory was that the linker should do the right thing and not emit a
> relocation that can't reach the boundary of the text segment (i.e. it
> should embed a stub between the sections as it combines them).  I'll
> have to fire up a 32 bit compile and see exactly what it thinks it's
> doing ... I've got a nasty feeling it expects us to be able to stub
> either at the beginning or the end, which the in-kernel loader doesn't.

See ld --stub-group-size=N option.  GCC assumes stub sections are at
the beginning and that the linker can insert stubs between input sections.
Merging text sections is likely to cause problems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

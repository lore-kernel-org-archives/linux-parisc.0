From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Tue, 7 Jul 2009 12:21:57 -0400 (EDT)
Message-ID: <20090707162158.26D514FB2@hiauly1.hia.nrc.ca>
References: <1246975877.4522.9.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, carlos@systemhalted.org, randolph@tausq.org,
	deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1246975877.4522.9.camel@mulgrave.site> from "James Bottomley" at Jul 7, 2009 09:11:17 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> So if I characterise the problem you think you're seeing: on mmap of a
> file at a memory location to be determined by the kernel, a sequential
> set of reads of the mapped location eventually turns up a zero where
> there should be data?  Yes, it does sound like a caching issue.

Yes.  The loop is terminated by a null tag:

  while (dyn->d_tag != DT_NULL)
      {
         ...
      }

However, the core dump doesn't show a null tag before the STRTAB tag
that caused the segmentation fault.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

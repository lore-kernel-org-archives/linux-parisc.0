Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBC8F4855
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 15:51:46 -0700 (MST)
Message-Id: <200312162251.hBGMpd15018573@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Question about cache flushing and fork
To: lamont@mmjgroup.com (LaMont Jones)
Date: Tue, 16 Dec 2003 17:51:38 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20031216160301.GC25535@mmjgroup.com> from "LaMont Jones" at Dec
	16, 2003 09:03:01 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Tue, Dec 16, 2003 at 12:06:57AM -0500, John David Anglin wrote:
> > According to my understanding, all PA 2.0 machines use a 64 byte
> > cache line.  On the otherhand, the PA 2.0 documentation states that
> > a cache line on a PA 2.0 machine can be 16, 32 or 64 bytes if I
> > remember correctly.
> 
> Correct.  I believe that PDC_CACHE returns the actual size (among other
> things.)

Is it possible to do PDC calls from user space under hpux to determine
cache parameters?

> If the C200 is genuinely a PA2.0 machine, then that's, umm, interesting,
> since the arch document doesn't say that it's hversion dependent...  The 
> instruction is undefined(*) on PA1.1 - you must bl .+8,<register>, which
> will get you the address of .+8 (regardless of where you branch.)

I revised GCC's trampoline code to assume a line length of 32 instead
of 64 on hppa64.  It can now flush arbitrarily long regions of memory.
The test now passes.  This seems to imply that the cache length of a
C200 under hpux11.00 is 32 bytes.

Thanks,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: NETFILTER_DEBUG break b2k 64bits (at least)[Wa
Date: Fri, 7 Jan 2005 19:35:01 -0500 (EST)
Message-ID: <200501080035.j080Z1kK012011@hiauly1.hia.nrc.ca>
References: <20050107162609.GA7883@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050107162609.GA7883@colo.lackof.org> from "Grant Grundler" at
	Jan 7, 2005 11:26:09 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, Jan 07, 2005 at 03:11:19PM +0100, Joel Soete wrote:
> > In fact I always hesitate to use this 64 compiler because of this report:
> >
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2004-February/022335.h
> tml>
> > 
> > but never read it was fixed?
> 
> gcc-3.3-hppa64 has been updated 13 times since initial release.
> I expect a "changes" file exists to describe what
> each update brings. But I don't expect the change log to get posted
> to p-l mailing list for every package that gets updated.

As far as I know, the problem hasn't been fixed in GCC.  OPD generation
is done by the linker and dynamic linker.  There is a discussion here
<http://lists.parisc-linux.org/hypermail/parisc-linux/1723.html>.

Note that the hppa64 linker always creates dynamic binaries intended
to be loaded by a dynamic loader.  It doesn't know how to create a
fully static binary.  I don't fully understand the ins and outs of
how this is being handled with 64-bit kernels but I suspect that this
is why there are duplicates.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

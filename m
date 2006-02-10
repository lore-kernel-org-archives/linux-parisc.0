From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [Fwd: Parisc - Linux on a HP-UX C8000 machine]
Date: Fri, 10 Feb 2006 09:44:17 -0700
Message-ID: <20060210164417.GA5375@colo.lackof.org>
References: <1139531824.5272.1.camel@debian>
	<1b137cb70602091651s6e51cb7fq48568fc9afbff654@mail.gmail.com>
	<20060210070503.GA28772@colo.lackof.org>
	<7d01f9f00602100422v506c56b7v21b18aa57812eff8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Weicht@mpimp-golm.mpg.de,
 parisc-linux@lists.parisc-linux.org,
 Roel Teuwen <roel.teuwen@gmail.com>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00602100422v506c56b7v21b18aa57812eff8@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Feb 10, 2006 at 01:22:22PM +0100, Thibaut VARENE wrote:
> And btw, I just noticed that the list on pateam.org reports some
> "cache issues" with fast A500. Though we believe firmly that L2 and
> non-equivalent aliasing might be at fault on PA8800/PA8900, I wonder
> if there are still other cache issues, or if the comments on the list
> should be cleared. Any update about that? :)

I don't know. I don't think any problems we've seen recently
can be attributed to caching issues. The most stable kernel
so far seems to be 2.6.13-pa1. But I expect as 2.6.15 gets
more exposure on Debian we'll know if that is better and if
it has any remaining caching issues.

> > We probably need to clone the new entries from arch/parisc/kernel/hardware.c
> > to the php/mysql code that drives the HWDB.
> > Any volunteers?
> 
> This is not that easy. The underlaying infrastructure of the HWDB is a
> really PITA, adding new stuff will probably require a bit more
> hacking. I'll try to figure out what needs to be done and will report
> about it ;)

The upside of pa8900 being the last one is we won't have
to update the HWDB much more. :(

> BTW, if anyone feels like volunteering for a complete redesign of the
> mysql/php infrastructure, please raise a hand!

I'd like to add, the HWDB maintainer doesn't need to be a linux hacker.
If someone from *BSD or HP-UX community wants to maintain it, I
certainly won't object.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

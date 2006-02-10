From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [Fwd: Parisc - Linux on a HP-UX C8000 machine]
Date: Fri, 10 Feb 2006 00:05:03 -0700
Message-ID: <20060210070503.GA28772@colo.lackof.org>
References: <1139531824.5272.1.camel@debian>
	<1b137cb70602091651s6e51cb7fq48568fc9afbff654@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Weicht@mpimp-golm.mpg.de,
 parisc-linux@lists.parisc-linux.org
To: Roel Teuwen <roel.teuwen@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1b137cb70602091651s6e51cb7fq48568fc9afbff654@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Roel,
thanks for forwarding.

On Fri, Feb 10, 2006 at 01:51:16AM +0100, Roel Teuwen wrote:
...
> I see at least a few problems with my C8000 running linux. First of
> all, I did not yet have any time to test it. Secondly, my C8000
> contains PA8900 processors which I don't think anyone has tried yet.

I've been trying some rp3440's with pa8800 processors over
the past 18 monthes and we still have problems with the L2
cache. I'm very slowly making some forward progress on it
but it's nowhere near debugged.

We do think it's related to the use of non-equivalent aliasing
by the parisc-linux kernel. HPUX doesn't do that.

So right now don't expect more than a single socket to work
and still see occasion segfaults.
If more than one CPU socket is enabled, the box will HPMC
with any substatial load that inolves lots of context switching.


> I've added the machine to the hardware database with the plan of
> sending a success/error report to the pateam site and parisc-linux
> maillist later.

thanks!

> By the way, apparently the HWDB doesn't recognize most of the hardware
> in this machine to map it to useful entries. (PA8800 and PA8900 are
> missing for example). I have CC'd the parisc-linux mailing list in the
> hope that someone might know why.

We probably need to clone the new entries from arch/parisc/kernel/hardware.c
to the php/mysql code that drives the HWDB.
Any volunteers?

> I was planning on using Debian but I don't expect the graphical
> interface (I suppose you mean X) to work at all. (even the console
> might not, no tests yet :-) )

I have a C8000 here as well and was told we could probably get
X.org working on it with 2D accelleration. We could get 3D HW accel
if we could get bugs in the x.org/xfree86 BIOS emulation fixed.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

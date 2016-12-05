From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: mmap problem in localedef
Date: Mon, 5 Dec 2016 22:58:37 +0200
Message-ID: <20161205205837.7jvnprhqa4tpruud@raspberrypi-2.musicnaut.iki.fi>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee>
 <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi>
 <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Mon, Dec 05, 2016 at 01:49:05PM -0500, John David Anglin wrote:
> On 2016-12-05 1:10 PM, Aaro Koskinen wrote:
> > On Mon, Dec 05, 2016 at 01:36:17PM +0200, Meelis Roos wrote:
> > This is known longstanding issue: https://sourceware.org/bugzilla/show_bug.cgi?id=19838
> But why has it come back?  What kernel and glibc versions are you using?
> This patch was supposed
> to have fixed issue:
> http://marc.info/?l=git-commits-head&m=138617700412279&w=2

I think glibc fix is also needed.

> I think the local-shmlba.diff patch was removed but I can't check at the
> moment.
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=725508

I use 4.9-rcX and glibc 2.24 with patches from Gentoo branch:

https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/gentoo/2.24

I guess Debian is carrying some bug fix(es) missing from upstream...

A.

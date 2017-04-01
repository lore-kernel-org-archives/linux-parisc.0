From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: mmap problem in localedef
Date: Sat, 1 Apr 2017 21:37:17 +0300
Message-ID: <20170401183717.jpvilw2u4lgiceuv@raspberrypi-3.musicnaut.iki.fi>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee>
 <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi>
 <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net>
 <20161205205837.7jvnprhqa4tpruud@raspberrypi-2.musicnaut.iki.fi>
 <a5349909-f4d8-1f0a-abbf-d16945f53ed6@bell.net>
 <9B251251-04AB-4D78-ADD7-F0D429DEB761@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <9B251251-04AB-4D78-ADD7-F0D429DEB761@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Mon, Dec 05, 2016 at 06:50:57PM -0500, John David Anglin wrote:
> On 2016-12-05, at 4:17 PM, John David Anglin wrote:
> > I'll post the current Debian patch set for hppa tonight and maybe we can
> > consolidate.

[...]

> We still have a change to SHMLBA which affects non standard page sizes.

FWIW, this is the one (local-shmlba.diff) that is needed to get localedef
working on PA-RISC. I just tested with glibc 2.25 and Linux 4.10 with 4 KB
page size.

A.

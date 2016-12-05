From: John David Anglin <dave.anglin@bell.net>
Subject: Re: mmap problem in localedef
Date: Mon, 5 Dec 2016 16:17:47 -0500
Message-ID: <a5349909-f4d8-1f0a-abbf-d16945f53ed6@bell.net>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee>
 <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi>
 <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net>
 <20161205205837.7jvnprhqa4tpruud@raspberrypi-2.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20161205205837.7jvnprhqa4tpruud@raspberrypi-2.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-12-05 3:58 PM, Aaro Koskinen wrote:
> I use 4.9-rcX and glibc 2.24 with patches from Gentoo branch:
>
> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/gentoo/2.24
>
> I guess Debian is carrying some bug fix(es) missing from upstream...
Yes.  However the trunk is much closer to being usable than it has been 
for some time thanks
to Aurelian Jarno and Mike Frysinger.  Most recently, we have resolved 
the syscall cancellation
bug that causes a number of tests to fail.  It fixes unwinding during 
syscall cancellation.

I'll post the current Debian patch set for hppa tonight and maybe we can 
consolidate.
Current test results can be seen in this build log for 2.24:
https://buildd.debian.org/status/fetch.php?pkg=glibc&arch=hppa&ver=2.24-7&stamp=1480210404

Dave

-- 
John David Anglin  dave.anglin@bell.net


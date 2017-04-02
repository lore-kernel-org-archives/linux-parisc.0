From: John David Anglin <dave.anglin@bell.net>
Subject: Re: mmap problem in localedef
Date: Sun, 2 Apr 2017 10:08:59 -0400
Message-ID: <59CDF2DE-076C-4BC0-8381-CE31A2AA8F56@bell.net>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee> <9B251251-04AB-4D78-ADD7-F0D429DEB761@bell.net> <20170401183717.jpvilw2u4lgiceuv@raspberrypi-3.musicnaut.iki.fi> <2241815.7QkIsKQeSs@daneel.sf-tec.de> <20170401191023.xpf32zopaecd7dzy@raspberrypi-3.musicnaut.iki.fi>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170401191023.xpf32zopaecd7dzy@raspberrypi-3.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-04-01, at 3:10 PM, Aaro Koskinen wrote:

> Hi,
> 
> On Sat, Apr 01, 2017 at 08:41:05PM +0200, Rolf Eike Beer wrote:
>> Aaro Koskinen wrote:
>>> On Mon, Dec 05, 2016 at 06:50:57PM -0500, John David Anglin wrote:
>>>> On 2016-12-05, at 4:17 PM, John David Anglin wrote:
>>>>> I'll post the current Debian patch set for hppa tonight and maybe we can
>>>>> consolidate.
>>> 
>>> [...]
>>> 
>>>> We still have a change to SHMLBA which affects non standard page sizes.
>>> 
>>> FWIW, this is the one (local-shmlba.diff) that is needed to get localedef
>>> working on PA-RISC. I just tested with glibc 2.25 and Linux 4.10 with 4 KB
>>> page size.
>> 
>> Missing attachment?
> 
> It was attached to Dave's original mail. Inlined below:
> 
> Index: eglibc-2.18/sysdeps/unix/sysv/linux/hppa/bits/shm.h
> ===================================================================
> --- eglibc-2.18.orig/sysdeps/unix/sysv/linux/hppa/bits/shm.h	2013-01-09 19:28:48.000000000 -0500
> +++ eglibc-2.18/sysdeps/unix/sysv/linux/hppa/bits/shm.h	2014-04-09 21:08:06.516202583 -0400
> @@ -36,7 +36,7 @@
> #define SHM_UNLOCK	12		/* unlock segment (root only) */
> 
> /* Segment low boundary address multiple.  */
> -#define SHMLBA 0x00400000		/* address needs to be 4 Mb aligned */
> +#define SHMLBA		(__getpagesize ())
> 
> /* Type to count number of attaches.  */
> typedef unsigned long int shmatt_t;

This patch goes back to the following discussion:
https://patchwork.kernel.org/patch/3933841/

As far as I can tell, it was not submitted to the glibc list, nor is there a bug report regarding localedef.

Dave
--
John David Anglin	dave.anglin@bell.net




Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC4A1484B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Oct 2003 13:58:14 -0600 (MDT)
Date: Thu, 23 Oct 2003 20:58:11 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] TMPFS test?
In-Reply-To: <3F96570A0000166F@ocpmta3.freegates.net>
Message-ID: <Pine.LNX.4.58.0310232036170.21111@sal.ucc.ie>
References: <3F96570A0000166F@ocpmta3.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, 23 Oct 2003, Joel Soete wrote:

> Hi pa,
>
> I backport Randolph 2.6 works to 2.4.23-pre8-pa13 and test tmpfs which seems
> to works:

Well, tmpfs works for me since ... 2.4.19 ?!

> # bdf
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/sda5              1598520    991904    525416  66% /
> /dev/sda3                60485     33364     23998  59% /boot
> /dev/sda6               241949    131057     98400  58% /var
> /dev/sda8               120963      7296    107422   7% /home
> /dev/sda9              1968384   1619384    249008  87% /usr/src
> /dev/sda10             1968384   1820036     48356  98% /Sources
> /dev/sda11             1968384   1295444    572948  70% /Develop
> /dev/sda7               120963        14    114704   1% /tmp
> tmpfs                   128048         0    128048   0% /var/tmp

Okay, this says that you have 128MB allocated for tmpfs.
This is correct, as tmpfs uses up to half of the physical ram if you
don't specify the maximum size.
Well, it doesn't 'allocate' the whole 128MB at once of course, it
will just use as much as you put into the ram disk.

[...]

> # cat /proc/meminfo
>         total:    used:    free:  shared: buffers:  cached:
> Mem:  262246400 86798336 175448064        0  2965504 66297856
> Swap: 256892928        0 256892928
> MemTotal:       256100 kB
> MemFree:        171336 kB
> MemShared:           0 kB
> Buffers:          2896 kB
> Cached:          64744 kB
> SwapCached:          0 kB
> Active:          52432 kB
> Inactive:        19836 kB
> HighTotal:           0 kB
> HighFree:            0 kB
> LowTotal:       256100 kB
> LowFree:        171336 kB
> SwapTotal:      250872 kB
> SwapFree:       250872 kB
>
> I just have a question: is it normal that /var/tmp is of about 256Mb when

Mhh, perhaps I'm blind, but where do get the idea that tmpfs is using
256MB and not (up to) 128MB ?

I just see "MemFree: 171336 kB", and I guess that's a reasonable amount,
ie. 84764kB or almost 83MB are used. This is probably including your
52860kb for the contents in your ram disk, so it seems that all the rest
is about 31904kb or about 31MB.

> I have 256Mb of phys mem and 250Mb (cfdisk did this when I requested 256Mb
> :( ) of swap?

As mentioned before (look at /usr/src/linux/Documentation/filesystems/tmpfs.txt)
it will use UP TO half of your ram, but 'df' always shows up the max
possible size of the ram disk, aswell what is actually used.

greetings, Max

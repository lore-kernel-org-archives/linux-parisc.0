Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id E23D1482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 Aug 2001 00:37:16 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: jso@europay.com (=?iso-8859-1?q?Jo=EBl?= Soete)
Subject: Re: [parisc-linux] Kernel 2.4.9-pa2?
Date: Tue, 21 Aug 2001 08:36:56 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <E15YmHu-0005lD-00@the-village.bc.nu> <20010820211823.D4D92482A@dsl2.external.hp.com>
In-Reply-To: <20010820211823.D4D92482A@dsl2.external.hp.com>
MIME-Version: 1.0
Message-Id: <20010821063716.E23D1482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Monday 20 August 2001 23:17, Helge Deller wrote:
> > > Is it nornal that process ksoftirq_CPU0 consume about 95% of cpu
> > > resources?
>
> Hi Joël,
>
> sorry, but I can't verify that with my 715/64, kernel -pa3 (same as -pa2
> with just a few minor and for this problem irrelevant changes in the
> harmony sound driver).
>
> pa64:~# uname -a
> Linux pa64 2.4.9-pa3 #6 Son Aug 19 20:16:30 CEST 2001 parisc unknown
>
> pa64:~# top
>
> 44 processes: 43 sleeping, 1 running, 0 zombie, 0 stopped
> CPU states:   2.3% user,   2.8% system,   0.0% nice,  94.9% idle
> PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
>    3 root      19  19     0    0     0 SWN   0.0  0.0   0:00 ksoftirqd_CPU0
>
> Helge

Oops, I think you found a bug in the kernel. Don't know yet if it's only pa-risc specific
or a general linux-kernel issue.

c3000:~# uname -a
Linux c3000 2.4.9-pa3 #6 Son Aug 19 20:16:30 CEST 2001 parisc unknown

c3000:~# uptime
 08:36:15 up  9:28,  2 users,  load average: 1.00, 1.00, 1.00

c3000:~# top 
49 processes: 46 sleeping, 3 running, 0 zombie, 0 stopped
CPU states:   0.6% user,  99.4% system,   0.0% nice,   0.0% idle
  PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
    3 root      20  19     0    0     0 RWN  99.2  0.0 445:09 ksoftirqd_CPU0

Greetings,
Helge

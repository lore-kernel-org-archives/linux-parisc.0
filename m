Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D4D92482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Aug 2001 15:18:23 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: jso@europay.com (=?iso-8859-1?q?Jo=EBl?= Soete)
Subject: Re: [parisc-linux] Kernel 2.4.9-pa2?
Date: Mon, 20 Aug 2001 23:17:45 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <E15YmHu-0005lD-00@the-village.bc.nu>
In-Reply-To: <E15YmHu-0005lD-00@the-village.bc.nu>
MIME-Version: 1.0
Message-Id: <20010820211823.D4D92482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > Is it nornal that process ksoftirq_CPU0 consume about 95% of cpu
> > resources?

Hi Joël,

sorry, but I can't verify that with my 715/64, kernel -pa3 (same as -pa2 with
just a few minor and for this problem irrelevant changes in the harmony sound driver).

pa64:~# uname -a
Linux pa64 2.4.9-pa3 #6 Son Aug 19 20:16:30 CEST 2001 parisc unknown

pa64:~# top 

44 processes: 43 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:   2.3% user,   2.8% system,   0.0% nice,  94.9% idle
PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND  
   3 root      19  19     0    0     0 SWN   0.0  0.0   0:00 ksoftirqd_CPU0  

Helge

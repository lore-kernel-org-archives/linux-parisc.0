Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7FCB4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Feb 2003 04:32:01 -0700 (MST)
Date: Thu, 6 Feb 2003 12:31:58 +0100
Subject: Re: [parisc-linux] ksoftirqd in 2.4.20-pa23
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: parisc-linux@lists.parisc-linux.org
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20030206102122.GW7503@aurinko.ntc.nokia.com>
Message-Id: <9A2A64BE-39C6-11D7-8ABC-0030656F07A2@esiee.fr>
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

parisc-linux.org/faq

On jeudi, f=E9v 6, 2003, at 11:21 Europe/Paris, Nahkola Mikko wrote:

> Now that there seems to be another generally useful kernel out (as in,
> usable for running KDE and such without lockups), there seems to be an
> interesting thing there...
>
> Why is ksoftirqd_CPU0 taking almost all the free CPU time? Sure, it's
> nice 19, but still... and I don't remember having that on 2.4.18 nor =
on
> the other .19 and .20 versions that I tried. And of course it's all
> system time.
>
> This is a typical state:
>
>  12:16:28 up 23:32,  3 users,  load average: 1.11, 1.24, 1.20
> 104 processes: 102 sleeping, 2 running, 0 zombie, 0 stopped
> CPU states:   1.2% user,  96.7% system,   0.9% nice,   1.2% idle
> Mem:    774288K total,   770800K used,     3488K free,    51464K=20
> buffers
> Swap:  1500152K total,     1936K used,  1498216K free,   624904K =
cached
>
>   PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
>     3 root      20  19     0    0     0 RWN  87.5  0.0  1211m=20
> ksoftirqd_CPU0
> 16772 root      18  15  1196 1196   924 R N   9.4  0.1   0:02 top
>  1006 mnahkola   9   0  9680 9380  8688 S     1.0  1.2  13:49 kdeinit
>   153 daemon     9   0   652  652   532 S     0.1  0.0   1:38 portmap
> 16737 root       9   0  2236 2208  1896 S     0.1  0.2   0:00 sshd
>     1 root       9   0   580  580   492 S     0.0  0.0   0:12 init
>     2 root       9   0     0    0     0 SW    0.0  0.0   0:00 keventd
>     4 root       9   0     0    0     0 SW    0.0  0.0   0:16 kswapd
>     5 root       9   0     0    0     0 SW    0.0  0.0   0:00 bdflush
>     6 root       9   0     0    0     0 SW    0.0  0.0   0:00 kupdated
>     9 root       9   0     0    0     0 SW    0.0  0.0   0:00 =
scsi_eh_2
>    10 root      -1 -20     0    0     0 SW<   0.0  0.0   0:00=20
> mdrecoveryd
>    11 root       9   0     0    0     0 SW    0.0  0.0   0:01 =
kjournald
>
>
> --=20
> Mikko Nahkola   <mikko.nahkola@nokia.com>
> Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

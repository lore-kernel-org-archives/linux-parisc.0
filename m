Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Duraid Madina <duraid@fl.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] A400-6X always crashes after a while 
In-Reply-To: Message from Duraid Madina <duraid@fl.net.au>
   of "Thu, 30 May 2002 08:00:37 +1000." <3CF54F85.7070106@fl.net.au>
References: <3CF54F85.7070106@fl.net.au> 
Date: Wed, 29 May 2002 18:16:51 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020530001652.1AA6C482A@dsl2.external.hp.com>
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

Duraid Madina wrote:
>  <6>sym53c896-3-<15,0>: extraneous data discarded.
> sym53c896-3-<15,0>: COMMAND FAILED (89 0) @0000000016c95800.
> Kernel panic: sba_iommu.c: I/O MMU @ fffffffffed22000 is out of mapping 
> resources

That's my code.

It's possible the sym53c896 driver isn't releasing mapping resources
in the above error path.

Under workload, can you
1) run the following shell script:
	while :
	do
		date >> ~/Astro.out
		cat /proc/bus/runway/Astro | fgrep PDIR >> ~/Astro.out
		sleep 10
	done

2) provide matching /var/log/syslog for the same timeframe.
3) explain briefly what the workload is.

The idea here is to monitor PDIR resource over time as whatever workload
you are running exercises the system. In the meantime, I'll look
at sym53c8xx driver and see if it's obviously not releasing the
mapping resource.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F10E4840
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 12:23:19 -0600 (MDT)
Message-ID: <3D2B2A80.6090103@freebel.net>
Date: Tue, 09 Jul 2002 18:25:04 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: James Braid <james.braid@peace.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] L2000 stable with SMP and RAID
References: <022c01c226c9$6fd0ebc0$5e01000a@bongo>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi James,

For my part I would like to test RAID-1 on my B180 (2 of 9Gb).
Could you let me know more on the RAID configuration you implemented?
Do you have a special slice (partition) for your F0 (parisc bootloader) 
and may be also for /boot?
Do you apply 'persistent-superblock 1' to allow auto detection at boot time?

Thanks in advance for your help,
	Joel

PS: may be a simple copy of your /etc/raidtab would be the simple answer 
to all my question :) ?

James Braid wrote:
> Hi list,
> 
> FYI, I downloaded the latest CVS kernel and compiled it on my L2000 and
> it magically seems have fixed most of the stability problem's I have
> been having with the box. Before the box would crap out randomly when
> doing pretty much *any* I/O stuff. SMP was also very flaky.
> 
> SMP seems to be working fine, and top even seems to report the correct
> values for load average and CPU utilization :-) It's been running
> distributed.net for several days now with no worries.
> 
> I have got 2 disks in a RAID 0 config and have been testing them with
> dbench and bonnie and so far the box seems to be pretty stable.
> 
> Cheers, James
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

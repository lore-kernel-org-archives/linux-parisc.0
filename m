Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from romano (romano-nyswri.cfe.cornell.edu [132.236.139.186])
	by dsl2.external.hp.com (Postfix) with ESMTP id F247B4878
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 06:46:40 -0600 (MDT)
Subject: Re: [parisc-linux] How to mount HFS 6.0 ?
From: Steve Pacenka <spacenka@lightlink.com>
To: dlorin@univ-rennes1.fr
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200207080705.JAA06652@mailimailo.univ-rennes1.fr>
References: <200207080705.JAA06652@mailimailo.univ-rennes1.fr>
Content-Type: text/plain
Date: 08 Jul 2002 08:46:37 -0400
Message-Id: <1026132397.906.50.camel@romano>
Mime-Version: 1.0
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

On Mon, 2002-07-08 at 04:05, dlorin@univ-rennes1.fr wrote:
> The content of my question concerns the "old fellows", who were using the 
> ancient series HP/9000/3xx or 4xx and whom I hope to find reading this 
> mails-list. But anyone, able to help me, is welcome...
> 
> I took a disk SCSCI-1 out of a station 425t running with BASIC-UX. On this one, 
> there are several files (data and programs written in HP-BASIC) I want to reach 
> in reading with my 715/50 running with Woody. How to do that?
> 
> Nota:
> 1) the filesystem's type on this disk is: HFS version 6.0.
> 2) the disk is already installed in the daisy chain SCSI and correctly 
> identified during the boot sequence.
> 
> Thanks.
> D. Lorin


The kernel sources suggest that the following may work if you have ufs
support compiled into your kernel:

   mount -t ufs -o ufstype=hp /dev/sd{whatever} /mnt

It would be unportable if type "hfs" as Martin Peterson suggests works. 
The "hfs" filesystem type in the standard Linux kernel represents an
Apple Macintosh filesystem.

-- SP

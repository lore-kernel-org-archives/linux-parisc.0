Return-Path: <soete.joel@tiscali.be>
Received: from spoolo3.tiscali.be (spoolo3.tiscali.be [62.235.13.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED2A44888
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Apr 2004 13:22:18 -0600 (MDT)
Message-ID: <4092A784.7030306@tiscali.be>
Date: Fri, 30 Apr 2004 19:22:44 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Bug in kernel 2.4.23 concerning use of SCSI
References: <408D378B00000029@ocpmta1.freegates.net>
In-Reply-To: <408D378B00000029@ocpmta1.freegates.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: JKonrad@linotype.com, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Jay,

Do you find a solution?

Joel Soete wrote:
> Hello,
> 
> Just for curiosity, can you join a dmesg file.
> 
> Thanks,
>     Joel
> 
> 
>>-- Original Message --
>>To: parisc-linux@lists.parisc-linux.org
>>From: JKonrad@linotype.com
>>Date: Mon, 26 Apr 2004 16:08:58 +0200
>>Subject: [parisc-linux] Bug in kernel 2.4.23 concerning use of SCSI
>>
>>
>>Hi,
> 
> 
> using kernel 2.4.23-pa3, which I downloaded from http://parisc-linux.org/~rbrad/vmlinux-2.4.23-pa3.bz2
> because I needed MUX support.
> 
> Machine is a HP K-200 with three CPUs (although, since this is not an smp
> kernel, should not be important);
> 
> 
> I have a 50 GB SCSI-drive attached to SCSI1 (the Low Voltage Controller where
> the CD-Rom is attached to); Whenever I try to format the partition (50GB,
> the whole disk) I get the following:
> 
My question was in fact to confirm me that you are using the same driver then the one I used on my c110:
[snip]
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700

on which I only connected a SE (single ended) rw cdrom drive which works perfectly but also I never tested so big disk on this 
controler.

Is your 50Gb disk is also a single ended one, a low or high voltage?
Doesn't it need some special hw config (jumper) to be a single ended scsi device?
Is your chain is well terminated?

Cheers,
	Joel

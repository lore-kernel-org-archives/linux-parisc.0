Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C75D4854
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 10:54:16 -0700 (MST)
Message-ID: <4038ECEF.7020606@tiscali.be>
Date: Sun, 22 Feb 2004 17:54:55 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Riccardo <rollei@tiscalinet.it>
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
References: <20040218235225.GA1623@calypso>	<20040219062907.GC13916@colo.lackof.org>	<20040221075849.GA1642@calypso>	<20040221170508.GB14198@baldric.uwo.ca>	<4038C0B0.F7D1708A@tiscalinet.it>
	<4038CB15.5060507@tiscali.be> <4038E400.427F0528@tiscalinet.it>
In-Reply-To: <4038E400.427F0528@tiscalinet.it>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Ricardo,

Riccardo wrote:
> pre-scriptum: I am sending this to the list because when trying to send
> an email directly to Joel I get his MTA answering I have invalid headers
> (tried two times)

Sorry my ISP pb certainly, I will try to check with support. Thanks for advise ;)

> Joel Soete wrote:
> 
> 
>>>I would set the tag queue as default to 8 and not to 16, to stay on the
>>>safe side. Couldn't it be made configurable from the kernel
>>>configuration menu?
>>>
>>
>>Good idea.
> 
> It is not me that can make changes there, but it seems to me that 8 is
> reasonable.
Agreed (anyway you can always suggest a patch, there are always well come :) )
> Also, a kernel config option would make this parameter
> obvious to everybody. I had only a small preformance decrease from 16 to
> 8 tags (well, disk IO sucks anyway under linux-pa and my old box). While
> 2 is pure sufference :)
> 
> 
>>And you are sure that scsi id are well different and scsi chain well terminated, I supose.
> 
> Yes, the internal chain is terminated with the original HP terminator
> and I removed the disk internal ones.
> In fact substituing the original HP disk with another one removed the
> problem (strangely enough, with the older IBM drive as a second drive I
> had sometimes freezes but this problem did not appear).
> 
> 
> 
>>hmm, I leaved the same experience but with two external disks of exactly the same type (same supplier: hp, same manufactor:
>>seagate, same product reference) but with a small firmware revision difference. Unfortunately, this pb only occured under linux
>>:(. Now the disk is broken again; so no chance to test it with more recent kernel 2.4 or 2.6 :(
> 
> 
> I used a failry recent kernel for there test, I believe 2.4.23.
> 
> The scsi code doesn't seem to be so stable and performing as compared to
> hp-ux....
> 
Certainly for numerous reason but on the other hand it is not ported (i don't mean portable, i am quiet sure it is) other platform :).

Thanks for info,
	Joel

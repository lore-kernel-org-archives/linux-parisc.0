Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE2A44914
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 08:29:50 -0700 (MST)
Message-ID: <4038CB15.5060507@tiscali.be>
Date: Sun, 22 Feb 2004 15:30:29 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Riccardo <rollei@tiscalinet.it>
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
References: <20040218235225.GA1623@calypso>	<20040219062907.GC13916@colo.lackof.org>	<20040221075849.GA1642@calypso>
	<20040221170508.GB14198@baldric.uwo.ca>
	<4038C0B0.F7D1708A@tiscalinet.it>
In-Reply-To: <4038C0B0.F7D1708A@tiscalinet.it>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Riccardo wrote:
> Carlos O'Donell wrote:
> 
>>>Thanks! Changing NCR_700_MAX_TAGS to 1 in drivers/scsi/53c700.h did the
>>>trick. Will I now have poor disk performance? If so, might I get away
>>>with setting it to something higher, like 2 or 4, maybe?
>>
>>I could never run IO stably at anything higher than 1. The drives don't
>>seem to handle it properly, the error recovery mechanisms seem less
>>than perfect, and the box just hangs.
> 
> It really depends on the drive. I have a Fujitsu Enterprise and it has a
> specified tag queue of 128 commands. So if something fails, it is the
> driver or HP's hardware.
> 
> I have a 715 scorpio and when I used ext2 or reiser with a tag queue of
> 16 I had very frequent freezes up to a point were the system wouldn't
> even mount the partition.
> 
> There was a discussion that hp set it to 2 for workstations and to 8 for
> servers. I have set it right now to 8 (since mavbe the NCR 7100 I have
> doesn't even support more) and I use XFS instead of reiser. I had no
> more problems...
> 
> I would set the tag queue as default to 8 and not to 16, to stay on the
> safe side. Couldn't it be made configurable from the kernel
> configuration menu?
> 
Good idea.
> 
> What I notivced that some drives seem to be incompatible. I had 2 hard
> disks that worked together (an original quantum divre rebranded HP and
> an IBM disk). Since my ibm disk died I substitued it with the Fujitsu,
> used a new Filesystem and a newer kernel. There was no way to see both
> disks when linux booted.
And you are sure that scsi id are well different and scsi chain well terminated, I supose.
> I had to remove the original HP disk and
> substitute it (a nuisance, since it contained the home directories).
> Attaching each time only one of the two disks recognized the correct
> disk respectively but both disk weren't. Another disk had no problem.
> 
hmm, I leaved the same experience but with two external disks of exactly the same type (same supplier: hp, same manufactor: 
seagate, same product reference) but with a small firmware revision difference. Unfortunately, this pb only occured under linux 
:(. Now the disk is broken again; so no chance to test it with more recent kernel 2.4 or 2.6 :(

Joel

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-core-5.cisco.com (sj-core-5.cisco.com [171.71.177.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6AE294830
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Mar 2003 11:46:24 -0700 (MST)
Message-ID: <3E7CAF7C.9070300@cisco.com>
Date: Sat, 22 Mar 2003 10:46:20 -0800
From: Christian Suder <csuder@cisco.com>
MIME-Version: 1.0
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [Q] J200 recovery
References: <20030322075214.87940.qmail@web12502.mail.yahoo.com>
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

Thanks Derek,

might have been just coincidence that the fault showed after I switched 
the fastboot. The machine was a freebie so no big deal.

	Christian


Derek Engelhaupt wrote:
> Christian,
> 
> It doesn't sound good for you.  If the boot ROM battery went completely 
> dead, things like the Software ID, system model number, and system 
> serial number would be gone.  The only way to recover those things is 
> through an HP tech like myself, but without a service contract the T&M 
> charges are pretty high.  There is a program we run that allows us to 
> reset that information.  The program is not licenced to anyone to run, 
> not even resellers.  HP sued a bunch of companies about 5 years ago for 
> using it to convert older HP UNIX hardware to MPE hardware.  The 
> hardware checks to make sure it has a valid serial number and model 
> number before booting, but from what I remember about cases like this it 
> should still get to the boot handler and not fail so early in the 
> self-test.  Init 3000 is one of the first stages of the self test where 
> the machine starts applying power.  It almost sounds like you have 
> either a system board failure or someth ing wrong in the power 
> sub-systems.  All the fastboot option does is turn the extensive memory 
> tests on or off.  Setting it off would cause the machine to run all the 
> extra memory tests instead of just initializing the memory as with 
> fastboot on.  If you encountered a fault there the fault code would be 
> in the 7xxx range.  A corrupted boot ROM could cause this to happen with 
> the hang at init 3000 since the boot ROM tells the system how to run the 
> self tests.  Unfortunately on HP 9000 systems, once the boot ROM is 
> corrupted, only the factory can reload it which requires us to do a 
> system card replacement.  Bottom line is, looks like the system card is 
> dead and needs to be replaced.  This would require an HP tech to reset 
> the info mentioned earlier on the new system card once installed.
> 
> derek
> 
>  */Christian Suder <csuder@cisco.com>/* wrote:
> 
>     Hello,
> 
>     apologies upfront as this question is more about HW than parisc-linux,
>     but as some pretty knowledgable folks hang out here I though I'll give
>     it a shot.
> 
>     History of the problem:
> 
>     Got a J200, powered up fine but the firmware could not see the hard
>     drive on the FW SCSI. It did find devices on the narrow SCSI. I also
>     put
>     in a known good drive on the FW, same thing. Both drives are HP
>     supplied
>     Seagates (HP firmware).
> 
>     Booted linux off CD and linux found the disk and could use it.
>     Installation went with no problem, just could not boot off the HD. I
>     could boot the system using the CD and changing root device and ramdisk
>     in IPL.
> 
>     While troubleshooting the boot problem I set the fastboot off - bad
>     idea
>     ! Now the system stops with FLT 3000 early on.
> 
>     Googling around I found that this may be a corrupted bootrom, which in
>     turn may not be a true flash memory in this machine (can anybody
>     confirm
>     this ?). The battery on the mainboard is pretty much dead, but a fresh
>     one didn't change anything.
> 
>     Could it be the FLT 3000 is caused by the battery going dead and the
>     system loosing some essential information ?
> 
>     Any way to recover it ?
> 
>     Thx,
> 
>     Christian
> 
> 
> 
> 
> 
>     _______________________________________________
>     parisc-linux mailing list
>     parisc-linux@lists.parisc-linux.org
>     http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> ------------------------------------------------------------------------
> Do you Yahoo!?
> Yahoo! Platinum 
> <http://rd.yahoo.com/platinum/evt=8162/*http://platinum.yahoo.com/splash.html> 
> - Watch CBS' NCAA March Madness, live on your desktop 
> <http://rd.yahoo.com/platinum/evt=8162/*http://platinum.yahoo.com/splash.html>! 
> 

Return-Path: <soete.joel@tiscali.be>
Received: from spoolo3.tiscali.be (spoolo3.tiscali.be [62.235.13.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id B79284851
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 17 Apr 2004 17:00:39 -0600 (MDT)
Message-ID: <4081B70F.6060003@tiscali.be>
Date: Sat, 17 Apr 2004 23:00:31 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
References: <407DA495.1090009@tiscali.be>
	<40711E5500006381@ocpmta2.freegates.net>
	<26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>
	<4081731B.7070006@tiscali.be>
	<32875.127.0.0.1.1082234959.squirrel@www.puszczka.com>
	<4081A280.8050108@tiscali.be>
In-Reply-To: <4081A280.8050108@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org, Andy Walker <ajwalker@broadpark.no>
Subject: [parisc-linux] kernel>=2.6.4-rc3 hung or panic on C1[18]0 [was:
 2.6.5-rc2-pa2 boot panic on c110 :(]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

To summarise I do following test with different kernel to locate this pb:
launch severall find into local big tree (different release of kernel tree) in the same time of a tar of one of those tree.

with kernel 2.6.3-pa2 no pb
with 2.6.4-rc1-pa3 no pb (apparently)
with 2.6.4-rc3-pa6 system crash (as well as with 2.6.4-rc3-pa1)

with the last one (2.6.4-rc3-pa1) I also log:
attempt to access beyond end of device
sdb9: rw=0, want=2307486096, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=2842788104, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=1904280008, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=2298589592, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=26325376, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=1371126224, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=3277938880, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=122917000, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=1151862976, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=3236466824, limit=3075696
attempt to access beyond end of device
sdb9: rw=0, want=3253102776, limit=3075696

during the first find alone?
arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<102294fc>] as_requeue_request+0x64/0x10c
  [<10220468>] elv_requeue_request+0x2c/0x38
  [<1022313c>] blk_insert_request+0xfc/0x104
  [<1024cbb0>] scsi_queue_insert+0x68/0x9c
  [<1024915c>] scsi_finish_command+0x9c/0xc0
  [<10249068>] scsi_softirq+0xfc/0x11c
  [<10262fb4>] ncr53c8xx_intr+0x74/0xbc
  [<101299cc>] do_softirq+0xf4/0xf8
  [<10220468>] elv_requeue_request+0x2c/0x38
  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
  [<10220468>] elv_requeue_request+0x2c/0x38
  [<1010b068>] intr_return+0x0/0x14
  [<1024cbb0>] scsi_queue_insert+0x68/0x9c
  [<1010b070>] intr_return+0x8/0x14
  [<1016ba8c>] may_open+0x58/0x1c8
  [<1015a850>] dentry_open+0x138/0x1c4
  [<1016e784>] locate_fd+0x158/0x194
  [<1010b068>] intr_return+0x0/0x14

kernel BUG at include/linux/blkdev.h:543!
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<1024ddc8>] scsi_request_fn+0x2a0/0x2c4
  [<10220468>] elv_requeue_request+0x2c/0x38
  [<10223120>] blk_insert_request+0xe0/0x104
  [<1024cbb0>] scsi_queue_insert+0x68/0x9c
  [<1024915c>] scsi_finish_command+0x9c/0xc0
  [<10249068>] scsi_softirq+0xfc/0x11c
  [<10262fb4>] ncr53c8xx_intr+0x74/0xbc
  [<101299cc>] do_softirq+0xf4/0xf8
  [<10220468>] elv_requeue_request+0x2c/0x38
  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
  [<10220468>] elv_requeue_request+0x2c/0x38
  [<1010b068>] intr_return+0x0/0x14
  [<1024cbb0>] scsi_queue_insert+0x68/0x9c
  [<1010b070>] intr_return+0x8/0x14
  [<1016ba8c>] may_open+0x58/0x1c8
  [<1015a850>] dentry_open+0x138/0x1c4
  [<1016e784>] locate_fd+0x158/0x194
  [<1010b068>] intr_return+0x0/0x14
[...]
and so on severall time.

I also drive the same test over a nfs (as it seems that lan and scsi ctrl on this c110 share the same U2 bridge?):
no pb.

May I so reasonably thought that pb is loacted into ncr53c720 scsi driver?

Thanks in advance for additional help,
	Joel



Joel Soete wrote:
> 
> 
> Andy Walker wrote:
> 
>>> Hello Andy,
>>>
>>> Sorry for delay but I was a bit busy by a production server.
>>
>>
>>
>> No problem.
>>
>>
>>>> 2.6.6-rc1-pa0 shows the same behaviour,
>>>
>>>
>>> Thanks.
>>> but not a surprise regarding previous test.
>>>
>>>
>>>> although it does seem to make it
>>>> through the Gentoo boot process most times.
>>>
>>>
>>> I would not be surprise if it occures during some fsck. Do you also use
>>> ext3 on your Gentoo?
>>> btw Gentoo always install pkg by a local rebuild from src (that's a long
>>> time that I visit the site)?
>>
>>
>>
>> That's the Gentoo way - so every package on my system is compiled
>> -march=2.0 -mschedule=8000. The downside is that install and upgrade
>> takes a long time on slow machines.
> 
> 
> Yes that why I do not investegate more: I don't have a lot of budget for 
> my system which are generaly systems a bit outdated machine recover from 
> trash still just enough for my investigation but a bit too slow to build 
> all the tools I would like to maintained uptodate frequently. The very 
> great stuff would have to have the choice: update from pre-compiled 
> binaries or a local compile. The debian packaging system is very robust 
> (some month ago, on a i386, I do an update from a old woody (r0 iirc) 
> directly to unstable aka sid without any pb) but I do not yet find a 
> clear doc explaining me how to personalize pkg from dpkg src (I would 
> like for instance change the prefix in general /usr into 
> /opt/app/app_rev a la hp)?
> 
>> The upside is that you get total
>> control over package selection and compilation options. I've played
>> with Debian before but I find apt a pain compared to Gentoo's portage.
>> Also all this sid/woody/stable/unstable etc.... stuff confuses me.
>>
> That is the simple aspect: in short
>     the current stable release was named (the 2.x was potato, the 
> current one woody)
>     the very last packages otc are put in unstable (aka sid) for large 
> testing and debuging
>     when pkg become enough stable it is pushed in testing the futur 
> debian release (recently named sarge)
> 
> there are also security update for stable release only because there are 
> in general in unstable and testing before!
> 
> For my part I only have ineterest in very last available packages (so 
> sid or unstable) to test new features but some times (rarely in fact) 
> the system is a bit 'unstable' :) (that's my choice).
> 
>>
>>>> I've compiled 2.6.3-pa2 in the hope of getting the C180 up and stable.
>>>
>>>
>>> This seems to be the last one enough stable for me and my c110: I just
>>> updated my distro (that used a lot tar iirc) and all works
>>> fine with this kernel.
>>
>>
>>
>> 2.6.3-pa2 is rock solid. I've been running updates, kernel compilation -
>> pretty heavy stuff, and no problems.
>> I'm just about to 'emerge' X11 - that should keep it downloading,
>> untarring and compiling for 24 hours.
>>
> Ok
> 
>> Any suggestions for things I might test to narrow our problem down.
>>
> Not realy for the moment, as explain previously, the problem seems to 
> apear between 2.6.4-rc1-pa3 and 2.6.4-rc3-pa6.
> I will try to figure out now if it comes from upstream or from or tree: 
> I am on going to rebuild 2.6.4-rc3-pa1 and see how will it behave.
> 
> Thanks a lot,
>     Joel
> 

From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] ide-cd: fix kernel crash on hppa regression
Date: Sun, 26 Apr 2009 00:51:46 +0200
Message-ID: <49F39402.1050500@gmx.de>
References: <49E6638B.8090700@gmx.de> <200904232334.55231.bzolnier@gmail.com> <49F2F1AC.7090900@gmx.de> <200904251633.01800.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: petkovbb@gmail.com, Linus <torvalds@linux-foundation.org>,
	Borislav Petkov <petkovbb@googlemail.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200904251633.01800.bzolnier@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Bart,

Bartlomiej Zolnierkiewicz wrote:
> On Saturday 25 April 2009 13:19:08 Helge Deller wrote:
>> Bartlomiej Zolnierkiewicz wrote:
>>> On Wednesday 22 April 2009 23:13:12 Helge Deller wrote:
>>>> Borislav Petkov wrote:
>>>>> On Fri, Apr 17, 2009 at 09:15:27AM +0200, Helge Deller wrote:
>>>>> [..]
>>>>>>>> BTW, even with my patch ATAPI CDROM accesses don't work with the current kernel...
>>>>>>> What do you mean by that, please elaborate?
>>>>>> I meant:
>>>>>> a) Without my patch the kernel did crash (see backtrace in original mail)
>>>>>> b) with my patch the kernel booted to login prompt, but I got those messages on the console:
>>>>>>  hda: command error: status=0x51 { DriveReady SeekComplete Error }
>>>>>>  hda: command error: error=0x54 <3>{ AbortedCommand LastFailedSense=0x05 }
>>>>>>  ide: failed opcode was: unknown
>>>>>> Nevertheless, mounting a cdrom in the drive didn't suceeded with same/similiar messages, but
>>>>>> this could even be because of the parisc superio driver...
>>>>> Is it possible to isolate it and test without the superio driver?
>>>> No, since the superio controller provides the IDE ports.
>>> Is 2.6.29 working ok?  What about 2.6.30-rc1 + your fix?
>> * 2.6.29 works perfectly.
>> * 2.6.30-rc3 (includes my patch) does work as well, but I see quite often those messages:
>>    hda: command error: status=0x51 { DriveReady SeekComplete Error }
>>    hda: command error: error=0x54 <3>{ AbortedCommand LastFailedSense=0x05 }
>>    ide: failed opcode was: unknown
> 
> That is kind of expected given your report about -rc2.  Verifying -rc1 + fix
> would be useful in starting to narrow down the scope of changes to look at.
> 
>> * drivers/parisc/superio.c had no (important) changes between 2.6.29 and 2.6.30-rcX
>> * to me it seems your changes to drivers/ide/ns87415.c have raised those problems.
>> * maybe you added some inb() in the new paths, which should call superio_ide_inb()
>>   (see to of ns87415.c) instead?
> 
> I checked this now and unfortunately it doesn't seem like it.
> 
>> * it seems the problem happens more often in some fault-paths, for example when 
>>   reading a faulty disc in the cdrom drive
> 
> I think that we should start with finding out whether this is ns87415
> specific regression or a more general ide-cd one.
> 
> commit a6d67ffa7dfe9515d8f2051a76b14c82b748475a ("ns87415: use custom
> ->dma_{start,end} to handle ns87415_prepare_drive()") looks like a good
> candidate to make the distinction between potentially bad ns87415
> changes and potentially bad ide-cd ones.

Reverting this commit still showed the errors mentioned above.

> Thus please give commit 5ae5412d9a23b05ab08461b202bad21ad8f6b66d ("ide:
> add ide_dma_prepare() helper") with your ide-cd fix applied a try.

That is a hard one. Just reverting it (with or without the other one above) prevents
me to build a kernel due to compiler errors.

Instead I tried 2.6.30-rc1 and 2.6.30-rc2 (all with my simple patch).
2.6.30-rc1 worked without problems.
2.6.30-rc2 did showed the errors.
(I should mention, that the cdrom does work even if those messages are printed).
The diff of drivers/ide/ns87415.c between those two versions seems unproblematic.
Then, after inserting "outb(ATA_DEVCTL_OBS, io_ports->ctl_addr);" to 2.6.30-rc2 didn't fixed it either.

So, I think there is some generic problems in the generic ide cdrom stack, which was
introduced between 2.6.30-rc1 and -rc2.

Hope this helps you further.

Helge

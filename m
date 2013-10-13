From: John David Anglin <dave.anglin@bell.net>
Subject: Re: New hppa kernel packages uploaded (3.10.11, aka 3.10-3) to parisc archives
Date: Sun, 13 Oct 2013 12:59:48 -0400
Message-ID: <BLU0-SMTP943EBAB2046BE47061811197190@phx.gbl>
References: <BLU0-SMTP850C7B9645BBBC4DF76FD0971C0@phx.gbl> <5256AFF5.8080805@landcomp.net> <BLU0-SMTP27179D0C2057664D913C74971F0@phx.gbl> <52578D25.6010102@landcomp.net> <BLU0-SMTP337F2FF2A00CABB1AD2BA2971F0@phx.gbl> <525ACD4D.4060108@landcomp.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Dave Land <xmechanic@landcomp.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <525ACD4D.4060108@landcomp.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

To get devtmpfs you need a kernel built with CONFIG_DEVTMPFS.  I think  
the Debian kernels in the archive
have this.  However, at least some of the default parisc kernel  
configs miss this option.

What has changed is udev.  Previously, it didn't require devtempfs  
support.  Annoying, I know.

Do you want me to send udev deb for last version that worked without  
devtmpfs?

This isn't drive order issue.  I wrote a warning about this to list.   
It shouldn't be update until you have kernels
built with CONFIG_DEVTMPFS.

CC'd list.

Dave

On 13-Oct-13, at 12:41 PM, Dave Land wrote:

> OK, here's the latest on the J6750...
>
> I deleted all the partitions and started from scratch. When I did  
> the mke2fs to format I included the 'L' option to set a label for  
> sda3 (mke2fs -L ROOTscsi0), and followed the instructions for  
> setting the /boot partition in fstab, etc., after I got all the  
> packages downloaded again. Now when I reboot from the CD and  
> interact with the IPL to set root=/dev/sda3, it boots the HDD and  
> then errors out with the following:
> [FAIL] udev requires devtempfs support, not started ... failed
> [WARN] Filesystem mounted on /dev/shm; setting up compatibility bind  
> mount ... (warning)
>
> Do I need to set something in /etc/fstab or init.d to get devtmpfs  
> to start or what?
>
> Since that happened, I pulled the secondary HDD out to avoid the  
> drive order issue, and re-partitioned once again, and formatted my  
> file systems with just the stock options (mke2fs /dev/sda2; mke2fs / 
> dev/sda3; mkswap /dev/sda4), download everything AGAIN, set the / 
> boot parameters in /etc/fstab, set my root p/w, and rebooted. Once  
> again, set root=/dev/sda3 in the IPL list, and it booted the HDD and  
> errored out again with the failed udev. Has something changed in the  
> repository?
> Did it not get rid of the disk label when I re-partitioned/formatted?
> This is driving me crazy!
>
> Dave Land
>
> On 10/11/13 6:26 AM, John David Anglin wrote:
>> Dave,
>>
>> Finding the root is a different issue.  When you have multiple hard
>> drives, the drive detection order can vary.  I have a USB drive on  
>> one
>> machine
>> and the drive detection order varies depending on whether it is  
>> plugged
>> in or not.  For some reason, it always comes up as sda!  The order  
>> can
>> also change with different kernel versions.
>>
>> So, specifying root=/dev/sda3 in the palo.conf is problematic.  It's
>> better to use root=UUID=drive_uuid or root=LABEL=drive_label.  The  
>> label
>> option is shorter.  I labeled my root partition "ROOTn" where n is a
>> drive number (e.g., SCSI ID).  I think this only works when you use  
>> udev to
>> build /dev.  If /dev is fixed, then this doesn't matter.
>>
>> This is why Helge recently changed palo to allow longer command  
>> lines.
>>
>> Dave
>>
>> On 11-Oct-13, at 1:31 AM, Dave Land wrote:
>>
>>> Dave,
>>>
>>> If I remember correctly (it's been a couple weeks), the kernel panic
>>> mentioned that it couldn't find the root partition, in this case  
>>> sda3,
>>> and I specified that when I did the palo config, so I either screwed
>>> up on the partitioning (i.e. sda3 isn't where it's supposed to be,  
>>> or
>>> I didn't do the palo config just exactly right.) If I interact with
>>> the IPL and use the kernel on the CD, it finds sda3 with no problem
>>> and boots the hard disc. I'm thinking it actually IS finding the
>>> kernel, since it actually gets that far before the kernel panics
>>> because it can't find /.
>>>
>>> Anyway, as soon as I get caught up with sorting all the computer
>>> goodies I scored at the local school auction last week, I'll work  
>>> with
>>> it some more, and try to figure out what I'm missing. :)
>>>
>>> Dave Land
>>> Land Computer Service
>>>
>>> On 10/10/13 6:01 PM, John David Anglin wrote:
>>>> Typically, I don't change palo.conf much.  Just use a generic  
>>>> name like
>>>> vmlinux and link it to your current
>>>> default kernel.  Same for initrd.img if you use ram disk.   
>>>> Interact with
>>>> IPL if you want to do something special.
>>>> It supports a ls command, so you can see what's in /boot.  If you  
>>>> can't
>>>> see any kernels, palo is probably
>>>> looking at wrong partition.
>>>>
>>>> Dave
>>>>
>>>> On 10-Oct-13, at 9:47 AM, Dave Land wrote:
>>>>
>>>>> On 10/8/13 5:41 PM, John David Anglin wrote:
>>>>>> I have upload a new Debian kernel build (3.10.11) to the parisc
>>>>>> archive:
>>>>>> deb http://ftp.parisc-linux.org/debian-ports/unstable  unstable  
>>>>>> main
>>>>>>
>>>>>> Except for linux-image-3.10-3-parisc-smp, the packages have  
>>>>>> been boot
>>>>>> tested on c3750 and rp3440.
>>>>>>
>>>>>> Enjoy,
>>>>>> Dave
>>>>>> --
>>>>>> John David Anglin    dave.anglin@bell.net
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> Thank you Dave. I'm still trying to get my Visualize J6750 to boot
>>>>> from the kernel on the HDD. Some kind of weirdness with palo is
>>>>> keeping it from seeing the /boot partition. Too much other stuff  
>>>>> going
>>>>> on at the moment to worry with it too much though. I'll get it
>>>>> eventually. :) Thanks for all your hard work on this.
>>>>>
>>>>> --
>>>>> Dave Land
>>>>> Land Computer Service  xmechanic@landcomp.net
>

--
John David Anglin	dave.anglin@bell.net




From: Helge Deller <deller@gmx.de>
Subject: Re: Debian vmlinux-4.14.0-1-parisc64-smp fails to boot on c3750
Date: Sun, 3 Dec 2017 21:52:58 +0100
Message-ID: <eb872edb-ccb9-f533-c435-77f2c1cdb308@gmx.de>
References: <008A2452-42ED-45E9-8FDE-69757C9D6962@bell.net>
 <5b767291-0b39-b38b-26f6-80bb6f462032@gmx.de>
 <30E98BD7-6BDC-4CAA-AFE6-99B02647D429@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <30E98BD7-6BDC-4CAA-AFE6-99B02647D429@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03.12.2017 21:37, John David Anglin wrote:
> On 2017-12-03, at 3:21 PM, Helge Deller wrote:
> 
>> On 03.12.2017 17:54, John David Anglin wrote:
>>> Fails early, probably in palo.  I don't have a boot log as the machine has a graphics console.
>>>
>>> ii  linux-image-4.13.0-1-parisc64-smp          4.13.13-1     hppa         Linux 4.13 for multiprocessor 64-bit PA-RISC
>>> ii  linux-image-4.14.0-1-parisc64-smp          4.14.2-1      hppa         Linux 4.14 for multiprocessor 64-bit PA-RISC
>>>
>>> The 4.13.13-1 kernel boots okay.
>>>
>>> root@hiauly6:/var/log# dpkg -l palo
>>> ii  palo                               1.99                   hppa                   Linux boot loader for HP PA-RISC
>>
>>
>> Strange.
>> It works nicely for me on my C3700 machine:
>>
>>
>> palo ipl 1.99 http://www.parisc-linux.org - Fri, 18 Aug 2017 11:50:44 +0200
>> Skipping extended partition 6 - beyond reach of IPL
>>
>> Partition Start(MB) End(MB) Id Type
>> 1               2      33   f0 Palo
>> 2              34     157   83 ext2
>> 5             159   134887   83 ext2
>>
>> PALO(F0) partition contains:
>>    0/vmlinux64 18847280(0) bytes @ 0x140000
>>
>> Information: No console specified on kernel command line. This is normal.
>> PALO will choose the console currently used by firmware (serial).
>> Command line for kernel: 'root=LABEL=ROOT rootfstype=ext4 HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
>> Selected kernel: /vmlinux from partition 2
>> Selected ramdisk: /initrd.img from partition 2
>> ELF64 executable
>> Entry 00100000 first 00100000 n 5
>> Segment 0 load 00100000 size 463104 mediaptr 0x1000
>> Segment 1 load 00172000 <tel:00172000> size 210976 mediaptr 0x73000
>> Segment 2 load 00200000 <tel:00200000> size 10634416 mediaptr 0xa7000
>> Segment 3 load 00c25000 size 3194732 mediaptr 0xacc000
>> Segment 4 load 01000000 size 2631320 mediaptr 0xdd8000
> 
> Console output stops at the above line.

If it stops here it's can be an indication that you still have an old palo
bootloader code in your boot sector of the boot disc.
palo version 1.96 had the fix for segments above 0x01000000.

> I'm using VisEG console (tty).  Also, on rp3440 command line console
> changed from ttyS1 to ttyS0.

palo v1.98 was the first version which enabled ttyS1 on rp3440 machines...

My suggestion:
Boot into kernel 4.13.13 and run "palo -v" once (check your /etc/palo.conf too).
Afterwards reboot and try 4.14 again.
Watch to boot console, esp. the palo version printed after the "HARD Booted." message.

Helge

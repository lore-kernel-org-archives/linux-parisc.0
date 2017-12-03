From: Helge Deller <deller@gmx.de>
Subject: Re: Debian vmlinux-4.14.0-1-parisc64-smp fails to boot on c3750
Date: Sun, 3 Dec 2017 21:36:23 +0100
Message-ID: <7df24e2b-24b4-c62d-eff6-33813c883280@gmx.de>
References: <008A2452-42ED-45E9-8FDE-69757C9D6962@bell.net>
 <5b767291-0b39-b38b-26f6-80bb6f462032@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: John David Anglin <dave.anglin@bell.net>,
        linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5b767291-0b39-b38b-26f6-80bb6f462032@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03.12.2017 21:21, Helge Deller wrote:
> On 03.12.2017 17:54, John David Anglin wrote:
>> Fails early, probably in palo.  I don't have a boot log as the machine has a graphics console.
>>
>> ii  linux-image-4.13.0-1-parisc64-smp          4.13.13-1     hppa         Linux 4.13 for multiprocessor 64-bit PA-RISC
>> ii  linux-image-4.14.0-1-parisc64-smp          4.14.2-1      hppa         Linux 4.14 for multiprocessor 64-bit PA-RISC
>>
>> The 4.13.13-1 kernel boots okay.
>>
>> root@hiauly6:/var/log# dpkg -l palo
>> ii  palo                               1.99                   hppa                   Linux boot loader for HP PA-RISC
> 
> Strange.
> It works nicely for me on my C3700 machine:

palo shows this layout:

> Segment 0 load 00100000 size 463104 mediaptr 0x1000
> Segment 1 load 00172000 <tel:00172000> size 210976 mediaptr 0x73000
> Segment 2 load 00200000 <tel:00200000> size 10634416 mediaptr 0xa7000
> Segment 3 load 00c25000 size 3194732 mediaptr 0xacc000
> Segment 4 load 01000000 size 2631320 mediaptr 0xdd8000

See: Segment 4 is >= 0x01000000.

Are you sure that you have run "palo" once that version 1.99 of the palo IPL is installed in your
boot sector?  Just having palo 1.99 installed in the Linux filesystems is not sufficient.

Helge

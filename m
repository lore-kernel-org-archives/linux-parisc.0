From: Helge Deller <deller@gmx.de>
Subject: Re: Kernel Panic on 4 cores hp c8000
Date: Thu, 31 Mar 2016 20:01:32 +0200
Message-ID: <56FD65FC.9030201@gmx.de>
References: <CACrbsaA0fw4KeKkcO5zZ50yMLsoysqJE6+ShfejCxDG9Zhns1Q@mail.gmail.com>
 <56FD5C30.4020409@gmx.de>
 <CACrbsaD4S7mPZcLT79FHU=fR+ecD6qaDyk1enHZ4zwG6y53MiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaD4S7mPZcLT79FHU=fR+ecD6qaDyk1enHZ4zwG6y53MiA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 31.03.2016 19:44, Simone Mannori wrote:
>> I think Debian 5 will not even install on the C8000..
> 
> Correct: the boot DVD hang after a while.
> 
>> But you didn't gave any information which kernel version you are using ?
>>
>> This kernel should be pretty stable on the C8000:
>> http://backup.parisc-linux.org/kernel/linux-image-4.2.0-1-parisc64-smp_4.2.6-3+b3_hppa.deb
> 
> The Debian 8.0 ( "debian-8.0-hppa-CD-1.iso") has configured this kernel:
> 
> Linux version 3.16.0-4-parisc64-smp (debian-kernel@lists.debian.org)
> (gcc version 4.8.4 (GCC) ) #1 SMP Debian 3.16.7-ckt4-3 (2015-02-03)

The 3.16 kernel is far too old.
It doesn't even makes sense to debug this kernel any longer, which is why
I said you should update to latest debian unstable (and it's written in the
installation wiki as well).
You have to keep in mind, that the parisc linux port was really nearly stopped
when I built this install CD. Since then we have fixed an uncountable number of
bugs.
So, please update all packages including kernel, glibc and so on.
If you face problems then, please let us know.
 
> I'm attaching the full set of booting message.
> 
> Probably you have a more recent kernel because AFTER the installation
> you have updated the full distro with more recent packages.
> Unfortunately, with this configuration, I can't boot.
> I would like to avoid the de-installation of the second processor.

You could try to boot with the "nosmp" kernel option (add it at the IPL prompt).
Probably "autofs=off" (not sure if this is the syntax) could work as well (if you think it's the autofs module).

If you have booted up, update kernel and packages.

Helge

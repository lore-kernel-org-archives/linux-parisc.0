From: Helge Deller <deller@gmx.de>
Subject: Re: scsi_wait_scan doesn't wait
Date: Thu, 21 Oct 2010 21:22:10 +0200
Message-ID: <4CC092E2.4090900@gmx.de>
References: <4CBD102F.2040705@logix.net.nz> <AANLkTi=qHF8D9BZVnQK5_jo+kNLSLcTQ4OuAy3PHpU_b@mail.gmail.com> <4CC003BB.6080900@logix.net.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Michal Ludvig <mludvig@logix.net.nz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CC003BB.6080900@logix.net.nz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

  On 10/21/2010 11:11 AM, Michal Ludvig wrote:
>  On 10/20/2010 12:04 PM, Carlos O'Donell wrote:
>> On Mon, Oct 18, 2010 at 11:27 PM, Michal 
>> Ludvig<mludvig@logix.net.nz>  wrote:
>>> I'm having a problem with 2.6.36-rc8+ on HP PARISC machine (HP 9000
>>> RP3410) where I intend to wait for SCSI enumeration during boot before
>>> LVM2 kicks in and attempts to activate the root volume. I modprobe
>>> scsi_wait_scan in the initramdisk before lvm2 script is run. However 
>>> the
>>> modprobe doesn't wait. I'm on Debian testing, fwiw.
>> If you're interested in helping, the best thing you could do is back
>> up to a kernel that works and then try to track down what commit broke
>> the wait scan. It's a bit tedious, but fairly easy.
> Yeah, I know. However a kernel rebuild takes nearly 2 hours on that 
> machine so it may be a couple of months before I find the commit ;-) 
> I'll see if I can come up with an automated process for that.

Hi Michal,

I'd propose that you use a cross-compiler (i686 to hppa) instead.
Then you can TFTP-boot the built kernel from your PC.
This is what I do, and it speeds up everything a lot and it's not too 
hard to set it up.

Helge

From: Helge Deller <deller@gmx.de>
Subject: Re: parisc hardware clock
Date: Sat, 8 Oct 2016 23:47:43 +0200
Message-ID: <57F9697F.2030902@gmx.de>
References: <alpine.LRH.2.20.1610090107540.12761@math.ut.ee>
 <57F96311.8010808@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: Meelis Roos <mroos@linux.ee>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <57F96311.8010808@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08.10.2016 23:20, Helge Deller wrote:
> On 09.10.2016 00:16, Meelis Roos wrote:
>> On my Gentoo hppa systems with custom kernels, I get the following 
>> error on bootup:
>>
>>  * Setting system clock using the hardware clock [UTC] ...
>> hwclock: settimeofday() failed: Invalid argument
>>  * Failed to set the system clock
> 
> I don't see this on debian...

I see it at shutdown (32bit kernel):
hwclock: ioctl(RTC_SET_TIME) to /dev/rtc0 to set the time failed.: Invalid argument

Helge

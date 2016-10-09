From: Helge Deller <deller@gmx.de>
Subject: Re: parisc crash on boot with 4.8+git
Date: Sun, 9 Oct 2016 21:50:55 +0200
Message-ID: <57FA9F9F.8030501@gmx.de>
References: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee>
 <57F96010.1040309@gmx.de> <alpine.LRH.2.20.1610091032210.12761@math.ut.ee>
 <ADF65437-3E9A-493C-89B5-E7C8A107BA92@bell.net>
 <alpine.LRH.2.20.1610100012470.32571@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1610100012470.32571@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09.10.2016 23:13, Meelis Roos wrote:
>>>>> Linux version 4.8.0-11288-gb66484c (mroos@rp3410) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #81 Sat Oct 8 20:40:24 EEST 2016
>>>>> unwind_init: start = 0x4076e980, end = 0x407a7060, entries = 14446
>>>>> The 64-bit Kernel has started...
>>>>> Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
>>
>> The first thing I would suspect is the enabling of huge pages.
> 
> There seems to be no config option to disable that for test?
 
CONFIG_HUGETLBFS=n

Helge

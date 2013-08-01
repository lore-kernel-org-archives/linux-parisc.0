From: John David Anglin <dave.anglin@bell.net>
Subject: Re: New Debian Kernel Packages
Date: Thu, 1 Aug 2013 18:39:29 -0400
Message-ID: <BLU0-SMTP3529F28468423082C0A26797500@phx.gbl>
References: <BLU0-SMTP89A9F5D677CA80946A5DB097550@phx.gbl> <51FADF39.4020505@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51FADF39.4020505@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1-Aug-13, at 6:20 PM, Helge Deller wrote:

> Hi Dave,
>
> On 07/30/2013 12:46 AM, John David Anglin wrote:
>> The following kernel packages are now in the parisc-linux.org
>> archive:
>>
>> linux-image-3.10-1-parisc-smp_3.10.3-1_hppa.deb
>> linux-image-3.10-1-parisc64-smp_3.10.3-1_hppa.deb
>> linux-image-3.10-1-parisc64_3.10.3-1_hppa.deb
>> linux-image-3.10-1-parisc_3.10.3-1_hppa.deb
>
> That's fantastic!
> This brings us one big step further to being able to build a real  
> debian-unstable-installer boot CD.
>
> I'm still hoping the C8000 patches I pushed for inclusion into 3.11  
> will then
> show up in stable 3.10 series soon as well. If that happens we will  
> have a kernel
> which should boot on all machines - including the c8000.


I have bootstrap tested the linux-image-3.10-1-parisc64- 
smp_3.10.3-1_hppa.deb package.  We'll
have to see if 3.10 will be the Debian choice for the next release.

As I mentioned in private, I have found that flush_cache_all() is the  
principal problem causing random
segmentation faults on SMP systems.  Unfortunately, the only fix so  
far is to not use flush_cache_all()
in flush_cache_mm() and flush_cache_range(), and this really slows  
things down running GCC
testsuite.  It doesn't seem to hurt much for other stuff.

My thought that this might be a timing issue didn't work.  I tried  
masking all external interrupts except for
IPI on all processors first, but it didn't help.  It may be this can  
be narrowed somewhat.  I suspect that we
have an inconsistent cache state during fork.

I think if this issue is fixed, c8000's will be worth a bit more than  
100 Euros...

Dave
--
John David Anglin	dave.anglin@bell.net




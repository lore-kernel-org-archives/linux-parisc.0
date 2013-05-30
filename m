From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix race conditions flushing user cache pages
Date: Thu, 30 May 2013 17:05:45 +0200
Message-ID: <51A76AC9.1020702@gmx.de>
References: <BLU0-SMTP84F3DE8CE6D8B9F60C5C2597970@phx.gbl> <1369925711.1972.11.camel@dabdike.int.hansenpartnership.com> <51A769B6.50801@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51A769B6.50801@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/30/2013 05:01 PM, Helge Deller wrote:
> On 05/30/2013 04:55 PM, James Bottomley wrote:
>> On Tue, 2013-05-28 at 08:09 -0400, John David Anglin wrote:
>>> There are two issues addressed by this patch:
>>>
>>> 1) When we flush user instruction and data pages using the kernel  
>>> tmpalias region, we need to
>>> ensure that the local TLB entry for the tmpalias page is never  
>>> replaced with a different mapping.
>>> Previously, we purged the entry before and after the cache flush  
>>> loop.  Although preemption was
>>> disabled, it seemed possible that the value might change during  
>>> interrupt processing.  The patch
>>> removes the purge and disables interrupts during the initial TLB entry  
>>> purge and cache flush.
>>>
>>> 2) In a number of places, we flush the TLB for the page and then flush  
>>> the page.  We disabled
>>> preemption around the flush.  This change disables preemption around  
>>> both the TLB and cache
>>> flushes as it seemed the effect of the purge might be lost.
>>>
>>> Without this change, I saw four random segmentation faults in about  
>>> 1.5 days of intensive package
>>> building last weekend.  With the change, I haven't seen a single  
>>> random segmentation fault in about
>>> one week of building Debian packages on 4-way rp3440.  So, there is a  
>>> significant improvement
>>> in system stability.
>>
>> an rp3440 is PA2.0, so you weren't really testing any of the tlb purge
>> locking changes.
> 
> Which kind of system do we need to test those "tlb purge locking changes" (PAx.y)?
> At least I can confirm, that Dave's patches have made all my systems 
> absolutely stable.

For those who want to test right now, you can check out the "for-next" branch of:
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
in which I've queue up the outstanding patches for 3.10...

(web: http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next)

Helge

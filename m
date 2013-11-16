From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] aio: fix D-cache aliasing issues
Date: Sat, 16 Nov 2013 17:32:30 -0500
Message-ID: <BLU0-SMTP77F560605C9D02E4CA7C6997FA0@phx.gbl>
References: <20131115220529.GA3160@ls3530.box> <1384555325.2003.39.camel@dabdike.int.hansenpartnership.com> <20131116200717.GA18939@schnuecks.de> <1384639590.3614.16.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Simon Baatz <gmbnomis@gmail.com>, Helge Deller <deller@gmx.de>,
	Benjamin LaHaise <bcrl@kvack.org>, linux-aio@kvack.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1384639590.3614.16.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 16-Nov-13, at 5:06 PM, James Bottomley wrote:

> On Sat, 2013-11-16 at 21:07 +0100, Simon Baatz wrote:
>> On Fri, Nov 15, 2013 at 02:42:05PM -0800, James Bottomley wrote:
>>> On Fri, 2013-11-15 at 23:05 +0100, Helge Deller wrote:
>>>> When a user page mapping is released via kunmap*() functions, the  
>>>> D-cache needs
>>>> to be flushed via flush_dcache_page() to avoid D-cache aliasing  
>>>> issues.
>>>>
>>>> This patch fixes aio on the parisc platform (and probably others).
>>>
>>> This should be flush_kernel_dcache_page().  flush_dcache_page() is  
>>> for
>>> full coherency but for unmap, we know the page was coherent going  
>>> in and
>>> may have been modified by the kernel, so only the kernel view  
>>> needs to
>>> be sync'd.  Technically, by the kernel API, the flush should be done
>>> *before* unmapping.  This would have mattered on parisc until we did
>>> flush via tmpalias which means we no-longer care if the mapping  
>>> for the
>>> flush exists or not because we always recreate it via the tmpalias
>>> pages.
>>
>> On ARM, flush_kernel_dcache_page() actually assumes that the page is
>> mapped.  It avoids double flushing of highmem pages by not flushing
>> in those cases where kunmap_atomic() already takes care of flushing.
>
> On Parisc, kmap/kunmap is currently a nop.  However, if we ever
> implemented highmem, we would also need to flush before we unmap,  
> which
> is why the flush needs to go before the kunmap.

Not quite.  On PA8800/PA8900, we currently do a flush in kunmap.

I'm fairly certain from discussion with Helge that he saw this bug on  
a C8000
with PA8800 processor.  In that case, adding a call to  
flush_kernel_dcache_page()
just duplicates the call in kunmap().  Could be wrong though.

The problem is the coherence with userspace.  That's why  
flush_dcache_page()
is called in several places in this file.  I agree with you that this  
should be done
before.

>
> I've got to say on all of this, we've implemented the most inane set  
> of
> primitives.  It would be much easier if kmap/kunmap just took care of
> all of this.  kmap should bring userspace into coherence (because why
> else would we be kmapping) and kunmap should force coherence on the
> kernel address ... and then no-one would need to worry when to and  
> when
> not to flush.


I'm working on adding a flush to our kmap code to bring userspace into
coherence on PA8800/PA8900.  It's ugly because it requires looping over
vma's as we do in in flush_dcache_page().

Dave
--
John David Anglin	dave.anglin@bell.net




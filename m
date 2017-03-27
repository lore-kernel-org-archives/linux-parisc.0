From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix access fault handling in pa_memcpy()
Date: Mon, 27 Mar 2017 22:23:31 +0200
Message-ID: <b1754e45-f5f8-ccd1-dd08-e22d52d43a1f@gmx.de>
References: <20170327154702.GA11377@p100.box>
 <20170327175750.GE29622@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170327175750.GE29622@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 27.03.2017 19:57, Al Viro wrote:
> On Mon, Mar 27, 2017 at 05:47:02PM +0200, Helge Deller wrote:
>> pa_memcpy() is the major memcpy implementation in the parisc kernel which is
>> used to do any kind of userspace/kernel memory copies.
>>
>> Al Viro noticed various bugs in the implementation of pa_mempcy(), most notably
>> that in case of faults it may report back to have copied more bytes than it
>> actually did.
>>
>> Fixing those bugs is quite hard in the C-implementation, because the compiler
>> is messing around with the registers and we are not guaranteed that specific
>> variables are always in the same processor registers. This makes proper fault
>> handling complicated.
>>
>> This patch implements pa_memcpy() in assembler. That way we have correct fault
>> handling and adding a 64-bit copy routine was quite easy.
> 
> Hmm...  Is there any point trying to fall back from store fault to byte
> copy?  Note that in copy_dstaligned() dst *is* aligned, so if the word
> store fails, there's no realistic chance of having a byte store succeed.

Good point. I'll fix that.

Thanks,
Helge

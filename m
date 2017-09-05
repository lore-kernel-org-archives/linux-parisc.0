From: Helge Deller <deller@gmx.de>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 parisc-hd tree
Date: Tue, 5 Sep 2017 08:09:01 +0200
Message-ID: <bd74906d-c4a2-5ea5-ae4c-dba4cc5ac77f@gmx.de>
References: <20170822165318.77e3e0ca@canb.auug.org.au>
 <20170905103448.6dfb93eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rik van Riel <riel@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905103448.6dfb93eb@canb.auug.org.au>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05.09.2017 02:34, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 22 Aug 2017 16:53:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>   arch/parisc/include/uapi/asm/mman.h
>>
>> between commit:
>>
>>   1c190151447d ("parisc: Add MADV_HWPOISON and MADV_SOFT_OFFLINE")
>>
>> from the parisc-hd tree and commit:
>>
>>   115d20ededaf ("mm,fork: introduce MADV_WIPEONFORK")
>>
>> from the akpm-current tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> diff --cc arch/parisc/include/uapi/asm/mman.h
>> index 9a9c2fe4be50,f6eec376e5fa..000000000000
>> --- a/arch/parisc/include/uapi/asm/mman.h
>> +++ b/arch/parisc/include/uapi/asm/mman.h
>> @@@ -57,9 -60,9 +57,12 @@@
>>   					   overrides the coredump filter bits */
>>   #define MADV_DODUMP	70		/* Clear the MADV_NODUMP flag */
>>   
>> + #define MADV_WIPEONFORK 71		/* Zero memory on fork, child only */
>> + #define MADV_KEEPONFORK 72		/* Undo MADV_WIPEONFORK */
>> + 
>>  +#define MADV_HWPOISON     100		/* poison a page for testing */
>>  +#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
>>  +
>>   /* compatibility flags */
>>   #define MAP_FILE	0
>>   #define MAP_VARIABLE	0
> 
> Just a reminder that the above conflict still exists.

Thanks Stephen!

@Andrew, I can push the addition of those two MADV_ constants to 
arch/parisc/include/uapi/asm/mman.h through the parisc git tree, 
if you drop this part from your patchset.
Otherwise, just let me know how you prefer to solve this merge conflict. 

Helge

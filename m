From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 parisc-hd tree
Date: Tue, 5 Sep 2017 16:58:47 +1000
Message-ID: <20170905165847.19a7effa@canb.auug.org.au>
References: <20170822165318.77e3e0ca@canb.auug.org.au>
        <20170905103448.6dfb93eb@canb.auug.org.au>
        <bd74906d-c4a2-5ea5-ae4c-dba4cc5ac77f@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rik van Riel <riel@redhat.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bd74906d-c4a2-5ea5-ae4c-dba4cc5ac77f@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

On Tue, 5 Sep 2017 08:09:01 +0200 Helge Deller <deller@gmx.de> wrote:
>
> >> diff --cc arch/parisc/include/uapi/asm/mman.h
> >> index 9a9c2fe4be50,f6eec376e5fa..000000000000
> >> --- a/arch/parisc/include/uapi/asm/mman.h
> >> +++ b/arch/parisc/include/uapi/asm/mman.h
> >> @@@ -57,9 -60,9 +57,12 @@@
> >>   					   overrides the coredump filter bits */
> >>   #define MADV_DODUMP	70		/* Clear the MADV_NODUMP flag */
> >>   
> >> + #define MADV_WIPEONFORK 71		/* Zero memory on fork, child only */
> >> + #define MADV_KEEPONFORK 72		/* Undo MADV_WIPEONFORK */
> >> + 
> >>  +#define MADV_HWPOISON     100		/* poison a page for testing */
> >>  +#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
> >>  +
> >>   /* compatibility flags */
> >>   #define MAP_FILE	0
> >>   #define MAP_VARIABLE	0  
> > 
> > Just a reminder that the above conflict still exists.  
> 
> Thanks Stephen!
> 
> @Andrew, I can push the addition of those two MADV_ constants to 
> arch/parisc/include/uapi/asm/mman.h through the parisc git tree, 
> if you drop this part from your patchset.
> Otherwise, just let me know how you prefer to solve this merge conflict. 

These simple conflicts are not really a problem (Linus is happy to cope
with them).  I just send these messages out for consistency and
openness.

-- 
Cheers,
Stephen Rothwell

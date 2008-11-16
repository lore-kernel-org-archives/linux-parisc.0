From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH, 2.6.28-rc5] unitialized return value in mm/mlock.c:
 __mlock_vma_pages_range()
Date: Sun, 16 Nov 2008 15:55:10 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0811161551540.3468@nehalem.linux-foundation.org>
References: <200811170030.58246.deller@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	Kyle Mc Martin <kyle@hera.kernel.org>,
	linux-parisc@vger.kernel.org, linux-mm <linux-mm@kvack.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200811170030.58246.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Mon, 17 Nov 2008, Helge Deller wrote:
>
> Fix an unitialized return value when compiling on parisc (with CONFIG_UNEVICTABLE_LRU=y):
> 	mm/mlock.c: In function `__mlock_vma_pages_range':
> 	mm/mlock.c:165: warning: `ret' might be used uninitialized in this function

Looks valid.

Of course, nobody should ever call this with a range that could possibly 
be empty, so an equally valid approach would be to change the "while" loop 
to a "do while()", and that would generate better code. But I guess the 
simple unnecessary initialization is more defensive programming, in that 
if some other buggy caller does set things up with an empty range, it gets 
the right result.

Btw, exactly _because_ gcc warnings about uninitialized functions are 
sometimes bogus (ie due to gcc simply not being able to follow things like 
conditional initializations where the values are only used if they were 
initialized), I would ask that people comment on these kinds of issues 
when they send in patches. 

		Linus

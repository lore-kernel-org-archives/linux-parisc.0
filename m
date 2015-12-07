From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/3] parisc: Disable huge pages on Mako machines
Date: Mon, 7 Dec 2015 22:19:10 +0100
Message-ID: <5665F7CE.3010209@gmx.de>
References: <1449434613-32214-1-git-send-email-deller@gmx.de>
 <5665A221.5050309@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5665A221.5050309@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dave,

On 07.12.2015 16:13, John David Anglin wrote:
> On 2015-12-06 3:43 PM, Helge Deller wrote:
>> Mako-based machines (PA8800 and PA8900 CPUs) don't allow aliasing on
>> non-equaivalent addresses.

> Where do the non equivalent addresses come from?

I think the main problem is the gateway page.
It's mapped at address 0 into userspace, but needs to jump into kernel space too.
This somehow breaks the huge page mapping.

> When non equivalent mappings are
> used in the kernel, we try pretty hard to ensure that the user mappings are flushed prior
> to using the kernel mapping and then we flush the kernel mapping. There's also the
> copy_user_page_asm and clear_user_page_asm routines that do copies and clear operations
> using equivalent addresses.  I have some notes on the flushing needed using these routines.

Yes.

> One source of non equivalent addresses is the boundary between text and data in user
> applications.  At one time, we had data immediately after the text and non equivalent
> addresses.  Now, the start of data is rounded up so it starts on a 4K page boundary.
> This may need adjustment for huge pages, but that implies a rebuild of user space.

No, userspace is not mapped in huge pages (but it could if someone gets libhugetlbfs working).
Right now, only hugepages would only be used for mmap() or shmget() memory if the flags
are given. 

> I tend to think flush_tlb_all() doesn't work because the aliasing rules are being broken.
> Disabling it causes a significant increase in time to flush the tlb.

Yes.
Right now the patches I sent don't seem to work as I expected them to do.
So, it's not what I currently tend to commit. I'm still working on it, but my time
is very limited, so it will need some time.
My current top goal is to push patches for kernel v4.4 which fixes the boot crash on Mako machines.

Helge

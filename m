From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 1/3] parisc: Disable huge pages on Mako machines
Date: Mon, 7 Dec 2015 10:13:37 -0500
Message-ID: <5665A221.5050309@bell.net>
References: <1449434613-32214-1-git-send-email-deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1449434613-32214-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-12-06 3:43 PM, Helge Deller wrote:
> Mako-based machines (PA8800 and PA8900 CPUs) don't allow aliasing on
> non-equaivalent addresses.
Where do the non equivalent addresses come from?  When non equivalent 
mappings are
used in the kernel, we try pretty hard to ensure that the user mappings 
are flushed prior
to using the kernel mapping and then we flush the kernel mapping. 
There's also the
copy_user_page_asm and clear_user_page_asm routines that do copies and 
clear operations
using equivalent addresses.  I have some notes on the flushing needed 
using these routines.

One source of non equivalent addresses is the boundary between text and 
data in user
applications.  At one time, we had data immediately after the text and 
non equivalent
addresses.  Now, the start of data is rounded up so it starts on a 4K 
page boundary.
This may need adjustment for huge pages, but that implies a rebuild of 
user space.

I tend to think flush_tlb_all() doesn't work because the aliasing rules 
are being broken.
Disabling it causes a significant increase in time to flush the tlb.

Dave

-- 
John David Anglin  dave.anglin@bell.net


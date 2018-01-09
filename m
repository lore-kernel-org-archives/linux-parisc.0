From: Kees Cook <keescook@chromium.org>
Subject: Re: [GIT PULL] parisc architecture fixes for 4.15-rc7
Date: Tue, 9 Jan 2018 15:03:58 -0800
Message-ID: <CAGXu5jJ=s8NBBpd9fxr37T+HV8SNunq71AgGwu+Cy7WogPH=xA@mail.gmail.com>
References: <20180107162123.GA9715@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: LKML <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Richard Henderson <rth@twiddle.net>,
        Laura Abbott <labbott@redhat.com>
To: Helge Deller <deller@gmx.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180107162123.GA9715@ls3530.fritz.box>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 7, 2018 at 8:21 AM, Helge Deller <deller@gmx.de> wrote:
> Hi Linus,
>
> please pull a few fixes for the parisc architecture from:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.15-3
>
> The fixes are:
> - Many small fixes to show the real physical addresses of devices instead of
>   hashed addresses.
>
> - One important fix to unbreak 32-bit SMP support: We forgot to 16-byte align
>   the spinlocks in the assembler code.
>
> - Qemu support: The host will get a chance to sleep when the parisc guest is
>   idle. We use the same mechanism as the power architecture by overlaying the
>   "or %r10,%r10,%r10" instruction which is simply a nop on real hardware.
>
> Thanks,
> Helge
>
> ----------------------------------------------------------------
> Helge Deller (6):
>       parisc: Show unhashed hardware inventory
>       parisc: Show unhashed EISA EEPROM address

These looks like a physical addresses, yes.

>       parisc: Show initial kernel memory layout unhashed
>       parisc: Show unhashed HPA of Dino chip

But these are virtual addresses and should be just removed, not
switched to %px. They're not physical addresses that I can see, e.g.
"dino_dev" is clearly being used as an in-memory structure, and the
kernel layout literally says "virtual kernel memory layout".
Especially the kernel memory layout going to dmesg should be removed.
That kind of thing has been entirely removed from other architectures
(or will be soon[1]). See commit adb1fe9ae2ee ("mm/page_alloc: Remove
kernel address exposure in free_reserved_area()"). (Also note that
hiding behind CONFIG_DEBUG_KERNEL is not sufficient: most distros
build with that config.)

-Kees

[1] https://www.spinics.net/lists/arm-kernel/msg624390.html

>       parisc: Fix alignment of pa_tlb_lock in assembly on 32-bit SMP kernel
>       parisc: qemu idle sleep support
>
>  arch/parisc/include/asm/ldcw.h |  2 ++
>  arch/parisc/kernel/drivers.c   |  2 +-
>  arch/parisc/kernel/entry.S     | 13 +++++++++++--
>  arch/parisc/kernel/pacache.S   |  9 +++++++--
>  arch/parisc/kernel/process.c   | 39 +++++++++++++++++++++++++++++++++++++++
>  arch/parisc/mm/init.c          | 10 +++++-----
>  drivers/parisc/dino.c          | 10 +++++-----
>  drivers/parisc/eisa_eeprom.c   |  2 +-
>  8 files changed, 71 insertions(+), 16 deletions(-)



-- 
Kees Cook
Pixel Security

From: Helge Deller <deller@gmx.de>
Subject: Re: What's in parisc-2.6.git
Date: Mon, 28 Sep 2009 22:19:21 +0200
Message-ID: <4AC11A49.7080009@gmx.de>
References: <20090928162522.GA22368@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: kyle@mcmartin.ca
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753204AbZI1UTZ@vger.kernel.org>
In-Reply-To: <20090928162522.GA22368@hera.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09/28/2009 06:25 PM, Kyle McMartin wrote:
> Rebased on top of v2.6.32-rc1, fixed tracehook. Seems to build alright
> on my pa8800 in a few different configs. Is anything missing?


I did tested it on my boxes as well, and it seems OK.
Nothing important missing.
Thanks Kyle!

Helge

> regards, Kyle
>
> The following changes since commit 17d857be649a21ca90008c6dc425d849fa83db5c:
>    Linus Torvalds (1):
>          Linux 2.6.32-rc1
>
> are available in the git repository at:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git parisc
>
> Christoph Hellwig (1):
>        parisc: convert to asm-generic/hardirq.h
>
> Helge Deller (2):
>        parisc: rename parisc's vmalloc_start to parisc_vmalloc_start
>        parisc: Fix linker script breakage.
>
> James Bottomley (1):
>        parisc: add me to Maintainers
>
> Jaswinder Singh Rajput (1):
>        parisc: includecheck fix: signal.c
>
> Julia Lawall (1):
>        parisc: correct use of SHF_ALLOC
>
> Kyle McMartin (7):
>        parisc: tracehook_report_syscall
>        parisc: tracehook_signal_handler
>        parisc: add missing TI_TASK macro in syscall.S
>        parisc: split syscall_trace into two halves
>        parisc: stop using task->ptrace for {single,block}step flags
>        parisc: add skeleton syscall.h
>        parisc: HAVE_ARCH_TRACEHOOK
>
> Tim Abbott (1):
>        parisc: Make THREAD_SIZE available to assembly files and linker scripts.
>
>   MAINTAINERS                           |    1 +
>   arch/parisc/Kconfig                   |    1 +
>   arch/parisc/include/asm/fixmap.h      |    4 +-
>   arch/parisc/include/asm/hardirq.h     |   20 +---------------
>   arch/parisc/include/asm/ptrace.h      |    5 +++-
>   arch/parisc/include/asm/syscall.h     |   40 +++++++++++++++++++++++++++++++
>   arch/parisc/include/asm/thread_info.h |   14 +++++++----
>   arch/parisc/kernel/asm-offsets.c      |    4 +-
>   arch/parisc/kernel/entry.S            |   21 ++++++++--------
>   arch/parisc/kernel/irq.c              |    5 ----
>   arch/parisc/kernel/module.c           |    2 +-
>   arch/parisc/kernel/ptrace.c           |   42 ++++++++++++++++----------------
>   arch/parisc/kernel/signal.c           |    5 +++-
>   arch/parisc/kernel/syscall.S          |   22 +++++++++++------
>   arch/parisc/kernel/vmlinux.lds.S      |   10 ++++++++
>   arch/parisc/mm/init.c                 |   11 ++++----
>   16 files changed, 127 insertions(+), 80 deletions(-)
>   create mode 100644 arch/parisc/include/asm/syscall.h
>

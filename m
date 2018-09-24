From: Firoz Khan <firoz.khan@linaro.org>
Subject: Re: [PATCH 0/4] System call table generation support
Date: Mon, 24 Sep 2018 09:43:49 +0530
Message-ID: <CALxhOnhrV0LSecZUdFghkpsTFhymo+kdC0dkzSNjp-NpeSE+_w@mail.gmail.com>
References: <1536913603-4584-1-git-send-email-firoz.khan@linaro.org> <844186da-0900-3c50-31f4-8600581b5675@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org,
        "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <844186da-0900-3c50-31f4-8600581b5675@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

On Mon, 24 Sep 2018 at 01:18, Helge Deller <deller@gmx.de> wrote:
>
> Hi Firoz,
>
> On 14.09.2018 10:26, Firoz Khan wrote:
> > The purpose of this patch series is:
> > 1. We can easily add/modify/delete system call by changing entry
> > in syscall.tbl file. No need to manually edit many files.
> >
> > 2. It is easy to unify the system call implementation across all
> > the architectures.
>
> I like the idea.
>
> > The system call tables are in different format in all architecture
> > and it will be difficult to manually add or modify the system calls
> > in the respective files manually. To make it easy by keeping a script
> > and which'll generate the header file and syscall table file so this
> > change will unify them across all architectures.
> >
> > syscall.tbl contains the list of available system calls along with
> > system call number and corresponding entry point. Add a new system
> > call in this architecture will be possible by adding new entry in
> > the syscall.tbl file.
> >
> > Adding a new table entry consisting of:
> >         - System call number.
> >         - ABI.
> >         - System call name.
> >         - Entry point name.
> >         - Compat entry name, if required.
> >
> > ARM, s390 and x86 architecuture does exist the similar support. I
> > leverage their implementation to come up with a generic solution.
> >
> > I have done the same support for work for alpha, m68k, microblaze,
> > ia64, mips, powerpc, sh, sparc, and xtensa. But I started sending
> > the patch for one architecuture for review. Below mentioned git
> > repository contains more details.
> > Git repo:- https://github.com/frzkhn/system_call_table_generator/
> >
> > Finally, this is the ground work for solving the Y2038 issue. We
> > need to add/change two dozen of system calls to solve Y2038 issue.
> > So this patch series will help to easily modify from existing
> > system call to Y2038 compatible system calls.
> >
> > I started working system call table generation on 4.17-rc1. I used
> > marcin's script - https://github.com/hrw/syscalls-table to generate
> > the syscall.tbl file. And this will be the input to the system call
> > table generation script. But there are couple system call got add
> > in the latest rc release. If run Marcin's script on latest release,
> > It will generate a new syscall.tbl. But I still use the old file -
> > syscall.tbl and once all review got over I'll update syscall.tbl
> > alone w.r.to the tip of the kernel. The impact of this thing, few
> > of the system call won't work.
> >
> > Firoz Khan (4):
> >   parisc: Move __IGNORE* entries to non uapi header
> >   parisc: Replace __NR_Linux_syscalls macro with __NR_syscalls
> >   parisc: Add system call table generation support
> >   parisc: uapi header and system call table file generation
> >
> >  arch/parisc/Makefile                       |   4 +
> >  arch/parisc/include/asm/Kbuild             |   3 +
> >  arch/parisc/include/asm/unistd.h           |   8 +
> >  arch/parisc/include/uapi/asm/Kbuild        |   2 +
> >  arch/parisc/include/uapi/asm/unistd.h      | 377 +----------------------
> >  arch/parisc/kernel/syscall.S               |  14 +-
> >  arch/parisc/kernel/syscall_table.S         | 459 -----------------------------
> >  arch/parisc/kernel/syscall_table_32.S      |  11 +
> >  arch/parisc/kernel/syscall_table_64.S      |  19 ++
> >  arch/parisc/kernel/syscalls/Makefile       |  52 ++++
> >  arch/parisc/kernel/syscalls/syscall_32.tbl | 358 ++++++++++++++++++++++
> >  arch/parisc/kernel/syscalls/syscall_64.tbl | 357 ++++++++++++++++++++++
> >  arch/parisc/kernel/syscalls/syscallhdr.sh  |  38 +++
> >  arch/parisc/kernel/syscalls/syscalltbl.sh  |  36 +++
> >  14 files changed, 896 insertions(+), 842 deletions(-)
> >  delete mode 100644 arch/parisc/kernel/syscall_table.S
> >  create mode 100644 arch/parisc/kernel/syscall_table_32.S
> >  create mode 100644 arch/parisc/kernel/syscall_table_64.S
> >  create mode 100644 arch/parisc/kernel/syscalls/Makefile
> >  create mode 100644 arch/parisc/kernel/syscalls/syscall_32.tbl
> >  create mode 100644 arch/parisc/kernel/syscalls/syscall_64.tbl
> >  create mode 100644 arch/parisc/kernel/syscalls/syscallhdr.sh
> >  create mode 100644 arch/parisc/kernel/syscalls/syscalltbl.sh
>
> Your parisc patches don't apply any longer.
> If you update them (with the feedback given by others), I'm happy
> to test your patch again on parisc.

Sure. Thanks for your support!
I planned to post few other things within couple of days.
Hopefully I can update parisc patches this week!

- Firoz

>
> Helge

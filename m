From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Mon, 4 Jul 2011 11:26:33 -0400
Message-ID: <CADZpyiwDx-6oHNaCXoVC_XWpeUuZ3_n5RLzdmZK0Aoeh0ra3tw@mail.gmail.com>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>
	<BLU0-SMTP9158F203DF2B6A1AD1D9A4975D0@phx.gbl>
	<CADZpyiwjD2kMPoh9rm1KL_+mYm72nPz8ERHcSuHODkD31qncuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiwjD2kMPoh9rm1KL_+mYm72nPz8ERHcSuHODkD31qncuQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 4, 2011 at 11:21 AM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> pthread_create: ALLOCATE_STACK failed.
>
> timer_helper_thread: pthread_create ret 22
> ~~~
>
> The second threads stack fails to allocate.

1309792564.144002 set_robust_list(0x4000b4f0, 0xc) = 0
1309792564.144002 rt_sigtimedwait([RTMIN], {si_signo=SIGRTMIN,
si_code=SI_TIMER, si_pid=4, si_uid=0, si_value={int=90456,
ptr=0x16158}}, NULL, 8) = 37
1309792564.368004 write(1, "timer_helper_thread: creating th"..., 40) = 40
1309792564.368004 write(1, "\n", 1)     = 1
1309792564.368004 mmap(NULL, 8388608, PROT_READ|PROT_WRITE|PROT_EXEC,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x41349000
1309792564.368004 mprotect(0x41b47000, 4096, PROT_NONE) = 0
1309792564.368004 write(1, "do_clone: ARCH_CLONE...\n", 24) = 24
1309792564.368004 write(1, "\n", 1)     = 1
1309792564.372004 clone(child_stack=0x41349040,
flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID,
parent_tidptr=0x41b484e8, tls=0x41b48900, child_tidptr=0x41b484e8) =
21795
1309792564.372004 write(1, "timer_helper_thread: pthread_cre"..., 42) = 42
1309792564.372004 rt_sigtimedwait([RTMIN], {si_signo=SIGRTMIN,
si_code=SI_TIMER, si_pid=5, si_uid=0, si_value={int=90520,
ptr=0x16198}}, NULL, 8) = 37
1309792564.476005 write(1, "timer_helper_thread: creating th"..., 40) = 40
1309792564.476005 write(1, "\n", 1)     = 1
1309792564.480005 mprotect(0x41b47480, 4096,
PROT_READ|PROT_WRITE|PROT_EXEC) = -1 EINVAL (Invalid argument)
1309792564.480005 munmap(0x41349000, 8388608) = 0
1309792564.480005 write(1, "pthread_create: ALLOCATE_STACK f"..., 39) = 39

Why would this mprotect fail with -EINVAL? It's not page aligned?

You can see the earlier mmap/mprotect from thread one's stack looks
page aligned.

I'll look into this.

Cheers,
Carlos.

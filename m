From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH AUTOSEL for 4.15 118/124] signal/parisc: Document a conflict with SI_USER with SIGFPE
Date: Tue, 20 Mar 2018 10:20:21 -0500
Message-ID: <87zi327ozu.fsf@xmission.com>
References: <20180319154645.11350-1-alexander.levin@microsoft.com>
        <20180319154645.11350-118-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable\@vger.kernel.org" <stable@vger.kernel.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        "linux-parisc\@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Sasha Levin <Alexander.Levin@microsoft.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180319154645.11350-118-alexander.levin@microsoft.com> (Sasha
        Levin's message of "Mon, 19 Mar 2018 15:49:14 +0000")
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sasha Levin <Alexander.Levin@microsoft.com> writes:

What is the justification for backporting this and the other similar
Documentation commits?

These commits just introduce a define _FIXME with value of 0, to
document that the userspace ABI was handled incorrectly long ago.

These commits do not fix anything.  Thes commits do not change anything
except a little how they are handled in siginfo_layout.  And I don't see
the changes that introduce siginfo_layout in kernel/signal.c being
backported.

Further these commits don't even have a fixes tag so I am curious
what is triggering them for backport.

Eric

> From: "Eric W. Biederman" <ebiederm@xmission.com>
>
> [ Upstream commit b5daf2b9d1c9a2b4f03ca93f75913ba2da3b3eaa ]
>
> Setting si_code to 0 results in a userspace seeing an si_code of 0.
> This is the same si_code as SI_USER.  Posix and common sense requires
> that SI_USER not be a signal specific si_code.  As such this use of 0
> for the si_code is a pretty horribly broken ABI.
>
> Further use of si_code == 0 guaranteed that copy_siginfo_to_user saw a
> value of __SI_KILL and now sees a value of SIL_KILL with the result
> that uid and pid fields are copied and which might copying the si_addr
> field by accident but certainly not by design.  Making this a very
> flakey implementation.
>
> Utilizing FPE_FIXME siginfo_layout will now return SIL_FAULT and the
> appropriate fields will reliably be copied.
>
> This bug is 13 years old and parsic machines are no longer being built
> so I don't know if it possible or worth fixing it.  But it is at least
> worth documenting this so other architectures don't make the same
> mistake.
>
> Possible ABI fixes includee:
>   - Send the signal without siginfo
>   - Don't generate a signal
>   - Possibly assign and use an appropriate si_code
>   - Don't handle cases which can't happen
>
> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-parisc@vger.kernel.org
> Ref: 313c01d3e3fd ("[PATCH] PA-RISC update for 2.6.0")
> Histroy Tree: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
> ---
>  arch/parisc/include/uapi/asm/siginfo.h | 7 +++++++
>  arch/parisc/kernel/traps.c             | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/parisc/include/uapi/asm/siginfo.h b/arch/parisc/include/uapi/asm/siginfo.h
> index 4a1062e05aaf..be40331f757d 100644
> --- a/arch/parisc/include/uapi/asm/siginfo.h
> +++ b/arch/parisc/include/uapi/asm/siginfo.h
> @@ -8,4 +8,11 @@
>  
>  #include <asm-generic/siginfo.h>
>  
> +/*
> + * SIGFPE si_codes
> + */
> +#ifdef __KERNEL__
> +#define FPE_FIXME	0	/* Broken dup of SI_USER */
> +#endif /* __KERNEL__ */
> +
>  #endif
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index 8453724b8009..c919e6c0a687 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -629,7 +629,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
>  			si.si_signo = SIGFPE;
>  			/* Set to zero, and let the userspace app figure it out from
>  			   the insn pointed to by si_addr */
> -			si.si_code = 0;
> +			si.si_code = FPE_FIXME;
>  			si.si_addr = (void __user *) regs->iaoq[0];
>  			force_sig_info(SIGFPE, &si, current);
>  			return;

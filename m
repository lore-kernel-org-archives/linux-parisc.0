From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement
 expressions
Date: Wed, 1 Aug 2018 16:10:50 -0400
Message-ID: <78c667f9-5c8b-3835-83eb-4b59e27e4f7e@bell.net>
References: <20180801182258.17834-1-ndesaulniers@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: natechancellor@gmail.com, Thomas Gleixner <tglx@linutronix.de>,
        Pravin Shedge <pravin.shedge4linux@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nick Desaulniers <ndesaulniers@google.com>, deller@gmx.de,
        jejb@parisc-linux.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801182258.17834-1-ndesaulniers@google.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2018-08-01 2:22 PM, Nick Desaulniers wrote:
> As part of the effort to reduce the code duplication between _THIS_IP_
> and current_text_addr(), let's consolidate callers of
> current_text_addr() to use _THIS_IP_.
Using the generic _THIS_IP_ results in significantly longer code than 
the parisc implementation
of current_text_addr().  It also results in a local label in the text.  
This breaks the unwind data
for the function with the label in 32-bit kernels.  The implementation 
of current_text_addr()
doesn't add a label.  _THIS_IP_ should be defined using 
current_text_addr() on parisc.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>   arch/parisc/kernel/unwind.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
> index 2ef83d78eec4..a4b430f440a9 100644
> --- a/arch/parisc/kernel/unwind.c
> +++ b/arch/parisc/kernel/unwind.c
> @@ -439,8 +439,8 @@ unsigned long return_address(unsigned int level)
>   	/* initialize unwind info */
>   	asm volatile ("copy %%r30, %0" : "=r"(sp));
>   	memset(&r, 0, sizeof(struct pt_regs));
> -	r.iaoq[0] = (unsigned long) current_text_addr();
> -	r.gr[2] = (unsigned long) __builtin_return_address(0);
> +	r.iaoq[0] = _THIS_IP_;
> +	r.gr[2] = _RET_IP_;
>   	r.gr[30] = sp;
>   	unwind_frame_init(&info, current, &r);
>   

Dave

-- 
John David Anglin  dave.anglin@bell.net

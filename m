From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.36 regression : swap support broken
Date: Sun, 12 Dec 2010 14:21:47 -0500 (EST)
Message-ID: <20101212192148.079834CF3@hiauly1.hia.nrc.ca>
References: <20101212193856.15f93ea4@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, eike-kernel@sf-tec.de
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101212193856.15f93ea4@borg.bxl.tuxicoman.be> from "Guy Martin" at Dec 12, 2010 07:38:56 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I've been bisecting this and I found out it has been introduced in
> 4e60c86bd9e5a7110ed28874d0b6592186550ae8 and to be precise, the
> following change in include/linux/mmdebug.h :
> -#define VM_BUG_ON(cond) do { } while (0)
> +#define VM_BUG_ON(cond) do { (void)(cond); } while (0)
> 
> 
> While the above change looks harmless, it introduces a slight change in
> mm/swap_state.c:154 in add_to_swap() : VM_BUG_ON(!PageUptodate(page));
> If you comment out that line, the problem is gone.
> 
> PageUptodate() will call smp_rmb() being the memory barrier instruction.
> 
> Those tests were done with linux-2.6.36 and gcc-4.4.4.
> Having the feeling that this might have been a gcc bug, I recompiled
> the whole kernel with gcc-4.2.4 and the problem was gone.
> 
> Looking at the assembly output for add_to_swap(), there is a slight
> difference.
> 
> - gcc-4.4.4 output :
> 
> add_to_swap:
>         .PROC
>         .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=4
>         .ENTRY
>         stw %r2,-20(%r30)
>         stw,ma %r4,64(%r30)
>         stw %r3,-60(%r30)
>         ldw 0(%r26),%r28
>         copy %r26,%r3
>         ldw 0(%r26),%r28
>         bb,>=,n %r28,28,.L61
> .L61:   
>         b,l get_swap_page,%r2
>         ...

Hmmm, I didn't think we allowed call instructions in the delay slot of
a branch.  Even though nullified, I think there were issues on some
processors.  Is an asm involved?

> - gcc-4.2.4 output :
> 
> add_to_swap:
>         .PROC
>         .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=4
>         .ENTRY
>         stw %r2,-20(%r30)
>         stw,ma %r4,64(%r30)
>         stw %r3,-60(%r30)
>         ldw 0(%r26),%r19
>         copy %r26,%r3
>         ldw 0(%r26),%r28
>         extrw,s,>= %r28,28,1,%r0
> .L76:   
>         b,l get_swap_page,%r2
>         ...

This is almost certainly wrong as it will skip the call when bit 28 is zero.

Would you please send preprocessed source?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

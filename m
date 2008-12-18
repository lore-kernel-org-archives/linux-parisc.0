From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: dumping pid registers on panic
Date: Thu, 18 Dec 2008 12:20:57 -0500
Message-ID: <119aab440812180920i5ece4f9o5be5eb7a560d812a@mail.gmail.com>
References: <20081218164404.GB8535@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: "Kyle McMartin" <kyle@infradead.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218164404.GB8535@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 18, 2008 at 11:44 AM, Kyle McMartin <kyle@infradead.org> wrote:
> diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
> index ffb2088..b152733 100644
> --- a/arch/parisc/include/asm/assembly.h
> +++ b/arch/parisc/include/asm/assembly.h
> @@ -447,6 +447,11 @@
>        mtctl    %r0,   %cr18
>        SAVE_CR  (%cr18, PT_IAOQ1(\regs))
>
> +       SAVE_CR  (%cr8,  PT_PID0(\regs))
> +       SAVE_CR  (%cr9,  PT_PID1(\regs))
> +       SAVE_CR  (%cr12, PT_PID2(\regs))
> +       SAVE_CR  (%cr13, PT_PID3(\regs))

In a 64-bit kernel (W-bit set to 1) these registers are 64-bits in
width and each one contains 2 pids?

e.g.
CR8 = pid1, pid2
CR9 = pid3, pid4
CR12 = pid5, pid6
CR13 = pid7, pid8

The docs say the pids can be from 16-32 bits wide, but the true length
is implementation dependent.

Cheers,
Carlos.

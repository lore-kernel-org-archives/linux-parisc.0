From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: parisc: add barriers to mmio accessors
Date: Tue, 3 Jun 2008 08:22:02 -0400
Message-ID: <119aab440806030522i1a4dd588v20630893e3fb0425@mail.gmail.com>
References: <20080603054212.GA31771@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080603054212.GA31771@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 3, 2008 at 1:42 AM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> Prevents GCC from reordering mmio accesses with regular memory
> accesses.
>
> They're in assembly since I felt like maybe using the strongly
> ordered completer on the instructions, so they would be more obvious
> in disassembly. (Yes, I know there's no weakly ordered PA
> implementation...)
> +#ifdef CONFIG_64BIT
> +       asm volatile(
> +       "       ldq     0(%0), %1\n"
> +       : : "r"(addr), "r"(q) : "memory");
> +#else
> +       unsigned int q_lo, q_hi;
> +       q_hi = __raw_readl(addr);
> +       q_lo = __raw_readl(addr+4);
> +       q = (unsigned long long)(q_hi << 32) | (q_lo);
> +#endif
> +
> +       return q;

Is there any reason the 32-bit version is uses plain C?

Cheers,
Carlos.

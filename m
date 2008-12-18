From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: dumping pid registers on panic
Date: Thu, 18 Dec 2008 12:58:29 -0500
Message-ID: <119aab440812180958y30267cc1id038d1a3fbe7ae73@mail.gmail.com>
References: <20081218164404.GB8535@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218164404.GB8535@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 18, 2008 at 11:44 AM, Kyle McMartin <kyle@infradead.org> wrote:
> +static u32 __get_pid_from_cr(struct pt_regs *regs, int i)
> +{
> +#ifdef CONFIG_64BIT
> +       return (regs->protid[(i&1?i^1:i)>>1] >> (i&1?32:0)) & 0xffffffff;
> +#else
> +       return regs->cr[pid_cr[i]];
> +#endif /*CONFIG_64BIT*/
> +}

Oh, I see you are too clever for me today. Thanks.

c.

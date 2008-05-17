From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: parisc setup_sigcontext32() array overflows
Date: Sat, 17 May 2008 15:22:55 -0400
Message-ID: <20080517192255.GB6540@phobos.i.cabal.ca>
References: <20080517191636.GA8140@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@parisc-linux.org, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Adrian Bunk <bunk@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080517191636.GA8140@cs181133002.pp.htv.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 17, 2008 at 10:16:37PM +0300, Adrian Bunk wrote:
> setup_sigcontext32(struct compat_sigcontext __user *sc, struct compat_regfile __user * rf, 
>                 struct pt_regs *regs, int in_syscall)            
> {
> ...
>                 /* Store upper half */
>                 compat_reg = (compat_uint_t)(regs->gr[32] >> 32);
> ...                                                   ^^
>                 /* Store upper half */
>                 compat_reg = (compat_uint_t)((regs->gr[32]+4) >> 32);
> ...                                                    ^^
> 
> <--  snip  -->

Yeah, I've already fixed these, was waiting for an ack from the author.

r, Kyle

From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re:[RFC] [PATCH] compat_sys_ptrace conversions for parisc
Date: Fri, 22 Aug 2008 13:14:48 +0100
Message-ID: <K604OO$A0941708ED315C0C39BAD98E8610D1D0@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>,
	"kyle" <kyle@mcmartin.ca>, "hch" <hch@lst.de>
To: "deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Helge,

I build and boot successfully 2 32bit kernels including your patch ;<)

> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
>   arch/parisc/kernel/ptrace.c        |  429
> ++++++++++++++-----------------------
>   arch/parisc/kernel/syscall_table.S |    2
>   include/asm-parisc/ptrace.h        |   10

I just encountered a small issue against latest Kyle git tree because this
file was moved to 'arch/parisc/include/asm'.

Tx,
    J.

>   3 files changed, 183 insertions(+), 258 deletions(-)
> 
> 
> 



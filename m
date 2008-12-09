From: Kyle McMartin <kyle@infradead.org>
Subject: Re: setup_arch/arch_get_boot_command_line changes
Date: Tue, 9 Dec 2008 17:59:31 -0500
Message-ID: <20081209225931.GA7015@bombadil.infradead.org>
References: <200812100850.26728.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org, dhowells@redhat.com,
	Richard Henderson <rth@twiddle.net>,
	Russell King <rmk@arm.linux.org.uk>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Bryan Wu <cooloney@kernel.org>,
	Mikael Starvik <starvik@axis.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Tony Luck <tony.luck@intel.com>,
	Hirokazu Takata <takata@linux-m32r.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@uclinux.org>,
	Ralf Baechle <ralf@linux-mips.org>,
	linux-parisc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Paul Mundt <lethal@linux-sh.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jeff Dike <jdike@addtoit.com>, Ingo Molnar <mingo@redhat.com>,
	Chris Zankel <chris@zankel.net>,
	Linus Torvalds <torvalds@linux-foundation.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200812100850.26728.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 10, 2008 at 08:50:24AM +1030, Rusty Russell wrote:
> Rusty Russell (10):
> <snip>
>       param: move banner printing to top of start_kernel.    
> 

Will this not run afoul of lockdep since it will be attempting to take
locks before lockdep has initialized?

(as an aside, it would be nice if it came after setup_arch, since on
some horrible platforms, printk_time needs the fpu turned on for
(integer) division, but there's no arch hook before the first printk, so
one needs to hijack the start_kernel entrypoint...)

regards, Kyle

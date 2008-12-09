From: Kyle McMartin <kyle@infradead.org>
Subject: Re: setup_arch/arch_get_boot_command_line changes
Date: Tue, 9 Dec 2008 18:02:14 -0500
Message-ID: <20081209230214.GB7015@bombadil.infradead.org>
References: <200812100850.26728.rusty@rustcorp.com.au> <20081209225931.GA7015@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Rusty Russell <rusty@rustcorp.com.au>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
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
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081209225931.GA7015@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 09, 2008 at 05:59:31PM -0500, Kyle McMartin wrote:
> Will this not run afoul of lockdep since it will be attempting to take
> locks before lockdep has initialized?
> 

Ah, printk calls lockdep_off now. Handy.


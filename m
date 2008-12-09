From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: setup_arch/arch_get_boot_command_line changes
Date: Tue, 9 Dec 2008 15:54:11 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0812091553250.3340@localhost.localdomain>
References: <200812100850.26728.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
	Chris Zankel <chris@zankel.net>
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200812100850.26728.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Wed, 10 Dec 2008, Rusty Russell wrote:
>
> OK, I've folded in all the fixes, thanks.  Git tree is here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux-2.6-boot-params.git
> 
> Stephen, please include in linux-next.  Clearly this hits every arch.  I'll
> try to avoid rebasing unless I've broken some arch horribly.

This looks really invasive, with absolutely zero explanations of what the 
point of it all is.

What?

		Linus

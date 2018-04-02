From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] Extract initrd free logic from arch-specific code.
Date: Mon, 2 Apr 2018 07:59:33 +0200
Message-ID: <20180402055933.zbpyorktot2owzzu@gmail.com>
References: <20180325221853.10839-1-shea@shealevy.com>
 <20180328152714.6103-1-shea@shealevy.com>
 <20180330111517.rrx6gs2skkgk336j@gmail.com>
 <87bmf3rmq6.fsf@xps13.shealevy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mips@linux-mips.org, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>,
 Christoph Hellwig <hch@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 uclinux-h8-devel@lists.sourceforge.jp,
 Vladimir Murzin <vladimir.murzin@arm.com>, Marc Zyngier <marc.zyngier@arm.com>,
 adi-buildroot-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>,
 linux-cris-kernel@axis.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kerne
To: Shea Levy <shea@shealevy.com>
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <87bmf3rmq6.fsf@xps13.shealevy.com>
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org


* Shea Levy <shea@shealevy.com> wrote:

> > Please also put it into Documentation/features/.
> 
> I switched this patch series (the latest revision v6 was just posted) to
> using weak symbols instead of Kconfig. Does it still warrant documentation?

Probably not.

Thanks,

	Ingo

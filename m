From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] treewide: remove current_text_addr
Date: Sat, 25 Aug 2018 14:02:43 -0700
Message-ID: <CA+55aFxL-u3uvGGv0GOoHhEwV8fy=BCN1yScxKQiVMPoHtg=Wg@mail.gmail.com>
References: <CAKwvOdkWL_2yTnJqM6n6R9UCPwY4iz-9BQYGN2MDAk9EzumUvA@mail.gmail.com>
 <20180821202900.208417-1-ndesaulniers@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>,
 linux-mips <linux-mips@linux-mips.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, gor@linux.vnet.ibm.com,
 Matt Turner <mattst88@gmail.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Marc Zyngier <marc.zyngier@arm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-um@lists.infradead.org, Nick Piggin <npiggin@gmail.com>,
 Andrew Lutomirski <luto@kernel.org>, shannon.nelson@oracle.com,
 Thomas Gleixner <tglx@linutronix.de>, alex.bennee@linaro.org,
 Richard Henderson <rth@twiddle.net>, Jiri Kosina <jkosina@suse.cz>,
 L
To: Nick Desaulniers <ndesaulniers@google.com>
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180821202900.208417-1-ndesaulniers@google.com>
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org

On Tue, Aug 21, 2018 at 1:31 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I suspect that current_text_addr predated GNU C extensions for statement
> expressions and/or taking the address of a label, then the macro was
> reimplemented for every new archs include/asm/processor.h, even though
> there were very few call sites, and none required an assembly
> implementation vs the C implementation.

I actually have this very dim memory that we had some compiler issues
where a label in the code resulted in gcc generating worse code
elsewhere in that same function.

But current_text_addr() predates both the git and the BK history, so
it's all shrouded in antiquity, and even if my dim recollection is
true, it may not be true any more. There aren't so many call sites
that it is likely to matter anyway.

             Linus

From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] Extract initrd free logic from arch-specific code.
Date: Wed, 28 Mar 2018 09:55:07 -0700
Message-ID: <CAGXu5jLioqnOQniXuuNS=PjeAgJr1=BL78Cqu0cwu_Y5e-NDZA@mail.gmail.com>
References: <20180325221853.10839-1-shea@shealevy.com>
 <20180328152714.6103-1-shea@shealevy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 linux-sh <linux-sh@vger.kernel.org>,
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
 linux-cris-kernel@axis.com, Greg Kroah-Hartman <gregkh@linuxfou
To: Shea Levy <shea@shealevy.com>
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180328152714.6103-1-shea@shealevy.com>
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org

On Wed, Mar 28, 2018 at 8:26 AM, Shea Levy <shea@shealevy.com> wrote:
> Now only those architectures that have custom initrd free requirements
> need to define free_initrd_mem.
>
> Signed-off-by: Shea Levy <shea@shealevy.com>

Yay consolidation! :)

> --- a/usr/Kconfig
> +++ b/usr/Kconfig
> @@ -233,3 +233,7 @@ config INITRAMFS_COMPRESSION
>         default ".lzma" if RD_LZMA
>         default ".bz2"  if RD_BZIP2
>         default ""
> +
> +config HAVE_ARCH_FREE_INITRD_MEM
> +       bool
> +       default n

If you keep the Kconfig, you can leave off "default n", and I'd
suggest adding a help section just to describe what the per-arch
responsibilities are when select-ing the config. (See
HAVE_ARCH_SECCOMP_FILTER for an example.)

-Kees

-- 
Kees Cook
Pixel Security

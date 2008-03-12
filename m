From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Yet another ccio fix idea?
Date: Wed, 12 Mar 2008 07:47:22 -0400
Message-ID: <1205322442.2941.104.camel@localhost.localdomain>
References: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain
Cc: dave <dave@hiauly1.hia.nrc.ca>,
	"soete.joel" <soete.joel@scarlet.be>,
	grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	kyle <kyle@parisc-linux.org>, matthew <matthew@wil.cx>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2008-03-12 at 10:16 +0100, rubisher wrote:
> -       asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
> +       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[1]));
> +       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[0]));
>         asm volatile("sync");

Actually, no, I'm afraid this is wrong.

The code is a complete dogs breakfast, since pdir_ptr is defined as u64
* in ccio_pdir_entry() and char * in ccio_mark_invalid.

What Dave was pointing out is that this structure is 8 bytes long and
may span two cache lines on the word boundary.  Assuming that's the
case, this needs to flush the first and second word, not the first and
second u64 entry as your code would (the second flush is actually
flushing the next pdir entry).

However, since it's contained in a u64 pointer, it must reasonably be on
an 8 byte boundary (or be triggering an unaligned poiner error) and
therefore shouldn't span multiple cache lines anyway.

James



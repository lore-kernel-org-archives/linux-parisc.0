From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] fix compile breakage caused by linux/smp.h header
 definition problem
Date: Wed, 23 Mar 2011 10:50:31 -0700
Message-ID: <20110323105031.8967ff2f.akpm@linux-foundation.org>
References: <1300893119.15899.15.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Amerigo Wang <amwang@redhat.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1300893119.15899.15.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 23 Mar 2011 10:11:58 -0500 James Bottomley <James.Bottomley@suse.de> wrote:

> The problem is this:
> 
>   CC      arch/parisc/kernel/asm-offsets.s
> In file included from include/linux/sched.h:71,
>                  from arch/parisc/kernel/asm-offsets.c:31:
> include/linux/smp.h:117: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'setup_nr_cpu_ids'
> include/linux/smp.h:118: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'smp_init'
>   HOSTLD  scripts/mod/modpost
> make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
> 
> It's caused by two __init attributes on function prototypes,

Heiko sent a patch for this which adds the #include.

> which
> shouldn't be there (__init should only mark functions not prototypes).

Nope.  We've had build failures in the past (on arm) where the
assembler generated a short-addressed branch to a function in the
"same" section but the linker discovered that it was too far away,
because the target landed in a different section.

By correctly marking the target as __init, the compiler says "ah,
that's far away" and generates the long-form branch addressing.

I think it only happened once, and it's obviously hard to hit, because
many such prototypes of __init functions are missing the __init tag.

And as the sections are laid out contiguously (true?), that kernel must
have been real close to having the same linkage error for branches
_within_ the main .text segment.

So it's all a bit fishy and marginal, but adding the __init increases
the chances of keeping Russell happy.


Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC14F4841
	for <parisc-linux@parisc-linux.org>; Sun, 12 Oct 2003 21:12:59 -0600 (MDT)
Date: Sun, 12 Oct 2003 21:12:58 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] flush_tlb_all_local:
Message-ID: <20031013031258.GC2467@colo.lackof.org>
References: <3F897C56.800@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F897C56.800@tiscali.be>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Oct 12, 2003 at 04:07:50PM +0000, Joel Soete wrote:
>         ldo     R%REAL_MODE_PSW(%r1), %r1
>         mtctl   %r1, %cr22
>         mtctl   %r0, %cr17
>         mtctl   %r0, %cr17
> [...]
> 
> Why twice 'mtctl   %r0, %cr17'?

Good question. No clue. Looks like a brain fart since clearing it
 once should work unless there's a weird bug. I'll remove it.

> and also:
> [...]
> fitmanymiddle:                                  /* Loop if LOOP >= 2 */
>         ADDIB>          -1,%r31,fitmanymiddle   /* Adjusted inner loop 
> decr */
>         pitlbe          0(%sr1,%r28)
>         pitlbe,m        %arg1(%sr1,%r28)        /* Last pitlbe and addr 
> adjust */
> 
> Typicaly the function name is flush_..., so why do we 'purge' here?

AFAICT, because purge is sufficient.
It doesn't look like parisc even provides a FITBLE instruction.

thanks,
grant

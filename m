Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08EF34856
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Nov 2003 20:37:07 -0700 (MST)
Date: Sat, 29 Nov 2003 20:37:05 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] spinlock 2.4 re-organise a la 2.6 [was: [RFC] rewrite kernel spinlock code to work better with gcc]
Message-ID: <20031130033705.GA24965@colo.lackof.org>
References: <20031126070714.GN975@tausq.org> <3FC93D47.5020501@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FC93D47.5020501@tiscali.be>
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

On Sun, Nov 30, 2003 at 12:43:51AM +0000, Joel Soete wrote:
...
> +++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/atomic.h	2003-11-30 01:23:57.000000000 +0100
> @@ -1,7 +1,6 @@
>  #ifndef _ASM_PARISC_ATOMIC_H_
>  #define _ASM_PARISC_ATOMIC_H_
>  
> -#include <linux/config.h>
>  #include <asm/system.h>

Joel,
This is wrong - atomic.h uses CONFIG_SMP and thus is
required to include config.h.

grant

From: Chris Zankel <chris@zankel.net>
Subject: Re: [2.6 patch] asm/ptrace.h userspace headers cleanup
Date: Tue, 24 Jun 2008 01:25:36 -0700
Message-ID: <4860AF80.5060809@zankel.net>
References: <20080623174809.GE4756@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: Roland McGrath <roland@redhat.com>, linux-kernel@vger.kernel.org,
	rmk@arm.linux.org.uk, cooloney@kernel.org, dev-etrax@axis.com,
	dhowells@redhat.com, gerg@uclinux.org,
	yasutake.koichi@jp.panasonic.com, linux-parisc@vger.kernel.org,
	paulus@samba.org, linuxppc-dev@ozlabs.org,
	linux-sh@vger.kernel.org, linux-mips@linux-mips.org,
	ysato@users.sourceforge.jp,
	Andrew Morton <akpm@linux-foundation.org>
To: Adrian Bunk <bunk@kernel.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20080623174809.GE4756@cs181140183.pp.htv.fi>
Errors-to: linux-mips-bounce@linux-mips.org
List-ID: <linux-parisc.vger.kernel.org>

Adrian Bunk wrote:
> This patch contains the following cleanups for the asm/ptrace.h 
> userspace headers:
> - xtensa: cosmetical change to remove empty
>             #ifndef __ASSEMBLY__ #else #endif
>           from the userspace headers
> 
> Signed-off-by: Adrian Bunk <bunk@kernel.org>

The Xtensa part also looks ok.

Acked-by: Chris Zankel <chris@zankel.net>


Regards,
-Chris

From: David Miller <davem@davemloft.net>
Subject: Re: parsic/sh/sparc tracehook breakage when tracing signals
Date: Thu, 11 Feb 2010 16:39:50 -0800 (PST)
Message-ID: <20100211.163950.206150918.davem@davemloft.net>
References: <201002111910.50596.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: linux-sh@vger.kernel.org, linux-parisc@vger.kernel.org,
	sparclinux@vger.kernel.org, roland@redhat.com,
	linux-kernel@vger.kernel.org
To: vapier@gentoo.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201002111910.50596.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 11 Feb 2010 19:10:47 -0500

> when i ported the Blackfin code to the tracehook framework, i copied a latent 
> bug from the sparc port.  trying to trace another process while handling 
> signals no longer worked (and subsequently broke some of the gdb tests).

What you seem to be missing is that on Sparc TIF_SINGLESTEP will never
be set, because it does not support hardware single step.

This thread flag is not even defined on that platform.

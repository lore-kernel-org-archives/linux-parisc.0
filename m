From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] 64bit LWS CAS
Date: Thu, 17 Jul 2014 17:12:56 -0400
Message-ID: <BLU436-SMTP127395BDDDC837F7D7E042697F40@phx.gbl>
References: <20140717220000.555b2bec@dellete.lux.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
To: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140717220000.555b2bec@dellete.lux.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/17/2014 4:00 PM, Guy Martin wrote:
> +#include <stdint.h>
> +
I would kill the above include and use long long instead of int64_t.  
Generally,
we don't want libgcc routines to depend on system includes.

SYNC_LOCK_RELEASE needs to be fixed to use __kernel_cmpxchg and 
__kernel_cmpxchg_dword32.
The current implementation won't be atomic for long long, and in glibc, 
a similar implementation caused
problems for the int type.  I've been testing a patch for the latter and 
will apply it soon.

Dave

-- 
John David Anglin    dave.anglin@bell.net


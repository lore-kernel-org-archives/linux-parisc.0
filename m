From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] 64bit LWS CAS
Date: Fri, 18 Jul 2014 10:49:49 -0400
Message-ID: <BLU436-SMTP218A41974C191160FBF5D1097F50@phx.gbl>
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
> +/* Kernel helper for compare-and-exchange a 64-bit value from ELF32.  */
> +static inline long
> +__kernel_cmpxchg_dword32 (int64_t oldval, int64_t newval, int64_t *mem)
I'm thinking we don't need suffix "32".  If a 64-bit runtime is ever 
developed,
there probably would be a separate file for it as on arm.

This discussion has got me thinking that the char and short 
implementations may be broken (i.e,
the CAS operation may clobber data adjacent to location being operated 
on).  I'm thinking we need
separate LWS calls for them.  Thoughts?

Dave

-- 
John David Anglin    dave.anglin@bell.net


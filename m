From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] 64bit LWS CAS
Date: Thu, 17 Jul 2014 19:57:03 -0400
Message-ID: <BLU436-SMTP757D315CCBB8A604EC7F0897F40@phx.gbl>
References: <20140717220000.555b2bec@dellete.lux.tuxicoman.be> <BLU436-SMTP127395BDDDC837F7D7E042697F40@phx.gbl> <BLU436-SMTP68BEB7ADD6E704079EEEF397F40@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP68BEB7ADD6E704079EEEF397F40@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 17-Jul-14, at 7:27 PM, John David Anglin wrote:

> On 17-Jul-14, at 5:12 PM, John David Anglin wrote:
>
>> SYNC_LOCK_RELEASE needs to be fixed to use __kernel_cmpxchg and  
>> __kernel_cmpxchg_dword32.
>> The current implementation won't be atomic for long long, and in  
>> glibc, a similar implementation caused
>> problems for the int type.  I've been testing a patch for the  
>> latter and will apply it soon.
>
> The change is now committed to GCC 4.10.

Also, see this change:
https://gcc.gnu.org/ml/gcc-patches/2014-07/msg01242.html

We will need a DI mode define for the 64-bit sync operation.

This enables "future" support in libstdc++.

Dave
--
John David Anglin	dave.anglin@bell.net




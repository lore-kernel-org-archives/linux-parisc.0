From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Linux 3.4-rc7
Date: Sun, 13 May 2012 16:08:56 -0400
Message-ID: <BLU0-SMTP22F4864AE1F54838C150D797150@phx.gbl>
References: <CA+55aFzsygnrJwLUPV8Vg4RPmwxXLuY-uo70fBLEZR8+barT5A@mail.gmail.com> <4FB011E7.1000604@linux.vnet.ibm.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Mikulas Patocka <mpatocka@redhat.com>, stepanm@codeaurora.org,
	Thomas Gleixner <tglx@linutronix.de>,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	dhowells@redhat.com, yasutake.koichi@jp.panasonic.com,
	eike-kernel@sf-tec.de, linux-parisc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FB011E7.1000604@linux.vnet.ibm.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 13-May-12, at 3:56 PM, Srivatsa S. Bhat wrote:

> The regression was introduced in the 3.4 merge window itself (by  
> commit
> 5fbd036b55 "sched: Cleanup cpu_active madness").
>
> Links to the original posting:
> PA_RISC: http://marc.info/?l=linux-parisc&m=133241790810604&w=2


If I had the above change, I get

   CHK     include/generated/compile.h
   CC      arch/parisc/kernel/smp.o
arch/parisc/kernel/smp.c: In function 'smp_cpu_init':
arch/parisc/kernel/smp.c:300:2: error: implicit declaration of  
function 'notify_cpu_starting' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[1]: *** [arch/parisc/kernel/smp.o] Error 1

Dave
--
John David Anglin	dave.anglin@bell.net

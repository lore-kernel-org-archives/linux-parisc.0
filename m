From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: sigaltstack doesn't round ss.ss_sp as required
Date: Sun, 25 Nov 2012 17:32:43 -0500
Message-ID: <BLU0-SMTP947B736E2C64AAC471602F97580@phx.gbl>
References: <BLU0-SMTP216C0F402CA26A39A5EEB197590@phx.gbl> <BLU0-SMTP91E4227D7FA649C74A9CB397580@phx.gbl> <1585369.EaOyvHic2M@eto>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1585369.EaOyvHic2M@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 25-Nov-12, at 5:07 PM, Rolf Eike Beer wrote:

> John David Anglin wrote:
>> On 24-Nov-12, at 10:05 AM, John David Anglin wrote:
>>> In trying to build the debian libsigsegv2 package, I found that
>>> sigaltstack
>>> doesn't round ss.ss_sp.  The tests intentionally pass an unaligned
>>> pointer.
>>> This results in the two stack overflow tests failing.
>>
>> The attached patch fixes this issue.
>
> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> index 594459b..324644d 100644
> --- a/arch/parisc/kernel/signal.c
> +++ b/arch/parisc/kernel/signal.c
> @@ -188,8 +188,10 @@ get_sigframe(struct k_sigaction *ka, unsigned  
> long sp, size_t frame_size)
> 	DBG(1,"get_sigframe: ka = %#lx, sp = %#lx, frame_size = %#lx\n",
> 			(unsigned long)ka, sp, frame_size);
> 	
> +	/* Align alternate stack and reserve 64 bytes for the signal
> +	   handler's frame marker.  */
> 	if ((ka->sa.sa_flags & SA_ONSTACK) != 0 && ! sas_ss_flags(sp))
> -		sp = current->sas_ss_sp; /* Stacks grow up! */
> +		sp = (current->sas_ss_sp + 0x7f) & ~0x3f; /* Stacks grow up! */
>
> 	DBG(1,"get_sigframe: Returning sp = %#lx\n", (unsigned long)sp);
> 	return (void __user *) sp; /* Stacks grow up.  Fun. */
>
> What about something like this (entirely untested, but you'll get  
> the idea):
>
> sp = round_down(current->sas_ss_sp + 64, 64);


We need to round up to ensure a full 64 bytes for frame marker.
I'll leave it to James to decide if it makes the code clearer.

Dave
--
John David Anglin	dave.anglin@bell.net




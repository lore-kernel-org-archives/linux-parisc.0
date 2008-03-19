From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [Patch] ccio-dma.c [Was: Yet another ccio fix idea?]
Date: Wed, 19 Mar 2008 00:19:52 -0600
Message-ID: <20080319061952.GA3876@colo.lackof.org>
References: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be> <20080314060251.GJ24794@colo.lackof.org> <47DC21AB.9090005@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	dave <dave@hiauly1.hia.nrc.ca>,
	"James.Bottomley" <James.Bottomley@HansenPartnership.com>,
	"soete.joel" <soete.joel@scarlet.be>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	kyle <kyle@parisc-linux.org>, matthew <matthew@wil.cx>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47DC21AB.9090005@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Mar 15, 2008 at 07:21:15PM +0000, rubisher wrote:
...
>>> -               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
>>> +               asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[7]));
>> NACK - keep it simple with the original proposed patch.
> Ok here it is:
> Signed-off-by: Joel Soete <soete dot joel at scarlet dot be>

Acked-by: Grant Grundler <grundler@parisc-linux.org>

Kyle,
please apply :)

thanks,
grant

> ---
>  drivers/parisc/ccio-dma.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Index: b/drivers/parisc/ccio-dma.c
> ===================================================================
> --- a/drivers/parisc/ccio-dma.c 2008-03-12 08:49:20.000000000 +0000
> +++ b/drivers/parisc/ccio-dma.c 2008-03-15 19:19:52.000000000 +0000
> @@ -695,7 +695,7 @@
>                 ** Hopefully someone figures out how to patch (NOP) the
>                 ** FDC/SYNC out at boot time.
>                 */
> -               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
> +               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
>
>                 iovp     += IOVP_SIZE;
>                 byte_cnt -= IOVP_SIZE;

From: Corey Minyard <minyard@acm.org>
Subject: Re: [PATCH] ipmi: Add missing rv in ipmi_parisc_probe()
Date: Tue, 28 Jan 2014 14:21:35 -0600
Message-ID: <52E8114F.7050202@acm.org>
References: <1390936355-11845-1-git-send-email-geert@linux-m68k.org>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: openipmi-developer@lists.sourceforge.net,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1390936355-11845-1-git-send-email-geert@linux-m68k.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/28/2014 01:12 PM, Geert Uytterhoeven wrote:
> drivers/char/ipmi/ipmi_si_intf.c: In function 'ipmi_parisc_probe':
> drivers/char/ipmi/ipmi_si_intf.c:2752:2: error: 'rv' undeclared (first use in this function)
> drivers/char/ipmi/ipmi_si_intf.c:2752:2: note: each undeclared identifier is reported only once for each function it appears in
>
> Introduced by commit d02b3709ff8efebfca0612d0ac2a6e31a91c13f4 ("ipmi:
> Cleanup error return")
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Dang it.  Yes, you are right, of course.

Acked-by: Corey Minyard <cminyard@mvista.com>
> ---
> http://kisskb.ellerman.id.au/kisskb/buildresult/10537567/
>
>  drivers/char/ipmi/ipmi_si_intf.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 671c3852d359..03f41896d090 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2724,6 +2724,7 @@ static struct platform_driver ipmi_driver = {
>  static int ipmi_parisc_probe(struct parisc_device *dev)
>  {
>  	struct smi_info *info;
> +	int rv;
>  
>  	info = smi_info_alloc();
>  


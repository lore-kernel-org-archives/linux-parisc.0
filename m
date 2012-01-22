From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] [trivial] parisc : Fix typo in eisa_enumerator.c
Date: Sun, 22 Jan 2012 09:50:16 -0800
Message-ID: <4F1C4C58.6040100@xenotime.net>
References: <1327233948-2070-1-git-send-email-standby24x7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Trivial patch monkey <trivial@kernel.org>, kyle@mcmartin.ca
To: Masanari Iida <standby24x7@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1327233948-2070-1-git-send-email-standby24x7@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/22/2012 04:05 AM, Masanari Iida wrote:
> Correct spelling "confgiuration" to "configuration" in
> drivers/parisc/eisa_enumerator.c

Correct trivial email address.

> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  drivers/parisc/eisa_enumerator.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/parisc/eisa_enumerator.c b/drivers/parisc/eisa_enumerator.c
> index caa1531..a656d9e 100644
> --- a/drivers/parisc/eisa_enumerator.c
> +++ b/drivers/parisc/eisa_enumerator.c
> @@ -357,7 +357,7 @@ static int parse_slot_config(int slot,
>  		}
>  		if (flags & HPEE_FUNCTION_INFO_CFG_FREE_FORM) {
>  			/* I have no idea how to handle this */
> -			printk("function %d have free-form confgiuration, skipping ",
> +			printk("function %d have free-form configuration, skipping ",

			                    has

>  				num_func);
>  			pos = p0 + function_len;
>  			continue;


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

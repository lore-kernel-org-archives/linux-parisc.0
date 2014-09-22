From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: pdc_stable.c:  Cleaning up unnecessary use of
 memset in conjunction with strncpy
Date: Mon, 22 Sep 2014 20:24:55 +0200
Message-ID: <20140922182455.GA4063@ls3530.box>
References: <1410710532-14429-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1410710532-14429-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>:
> Using memset before strncpy just to ensure a trailing null
> character is an unnecessary double writing of a string

Thanks for the patch Rickard!

I've modified it a little (see below) and added it to my tree.

Thanks,
Helge

> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
> ---
>  drivers/parisc/pdc_stable.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
> index 0f54ab6..76860ad 100644
> --- a/drivers/parisc/pdc_stable.c
> +++ b/drivers/parisc/pdc_stable.c
> @@ -765,8 +765,8 @@ static ssize_t pdcs_auto_write(struct kobject *kobj,
>  		return -EINVAL;
>  
>  	/* We'll use a local copy of buf */
> -	memset(in, 0, count+1);
>  	strncpy(in, buf, count);
> +	in[count] = '\0';
>  
>  	/* Current flags are stored in primary boot path entry */
>  	pathentry = &pdcspath_entry_primary;


parisc: pdc_stable.c: Cleaning up unnecessary use of memset in conjunction with strncpy

Using memset before strncpy just to ensure a trailing null character is
an unnecessary double writing of a string

Patch modified by Helge Deller to additionally reduce stack usage.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 0f54ab6..e4b73c2 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -755,7 +755,7 @@ static ssize_t pdcs_auto_write(struct kobject *kobj,
 {
 	struct pdcspath_entry *pathentry;
 	unsigned char flags;
-	char in[count+1], *temp;
+	char in[8], *temp;
 	char c;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -765,8 +765,9 @@ static ssize_t pdcs_auto_write(struct kobject *kobj,
 		return -EINVAL;
 
 	/* We'll use a local copy of buf */
-	memset(in, 0, count+1);
+	count = min_t(size_t, count, 7);
 	strncpy(in, buf, count);
+	in[count] = '\0';
 
 	/* Current flags are stored in primary boot path entry */
 	pathentry = &pdcspath_entry_primary;

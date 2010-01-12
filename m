From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] vgaarb: fix typo deference when copying from userspace
Date: Tue, 12 Jan 2010 19:56:37 +0100
Message-ID: <4B4CC5E5.5010200@gmx.de>
References: <1263319113-6631-1-git-send-email-tiago.vignatti@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Dave Airlie <airlied@redhat.com>,
	Jesse Barnes <jbarnes@virtuousgeek.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"Paulo R. Zanoni" <przanoni@gmail.com>,
	Henry Zhao <Henry.Zhao@Sun.COM>,
	Andy Getzendanner <james.getzendanner@students.olin.edu>,
	Brad Spengler <spender@grsecurity.net>,
	"dri-devel@lists.sf.net" <dri-devel@lists.sf.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Tiago Vignatti <tiago.vignatti@nokia.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754420Ab0ALS4p@vger.kernel.org>
In-Reply-To: <1263319113-6631-1-git-send-email-tiago.vignatti@nokia.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/12/2010 06:58 PM, Tiago Vignatti wrote:
> From: Brad Spengler<spender@grsecurity.net>
>
> libpciaccess is not triggering such code though.
>
> Signed-off-by: Tiago Vignatti<tiago.vignatti@nokia.com>

I can confirm, that this patch is needed to prevent a kernel
segfault with 2.6.33-rc3  on the parisc/hppa architecture.

Tested-by: Helge Deller <deller@gmx.de>

> ---
> Andy Getzendanner tried to fix this, but he seems did a wrong approach:
> http://marc.info/?l=linux-kernel&m=126112173704466
>
> Andy: please test (and put your tag review!) this one instead. Thanks.
>
>   drivers/gpu/vga/vgaarb.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> index 1ac0c93..2f6cf69 100644
> --- a/drivers/gpu/vga/vgaarb.c
> +++ b/drivers/gpu/vga/vgaarb.c
> @@ -961,7 +961,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user * buf,
>   		remaining -= 7;
>   		pr_devel("client 0x%p called 'target'\n", priv);
>   		/* if target is default */
> -		if (!strncmp(buf, "default", 7))
> +		if (!strncmp(curr_pos, "default", 7))
>   			pdev = pci_dev_get(vga_default_device());
>   		else {
>   			if (!vga_pci_str_to_vars(curr_pos, remaining,

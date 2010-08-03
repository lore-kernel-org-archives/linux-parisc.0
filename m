From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [Security] [PATCH] bug in led_proc_write()
Date: Tue, 3 Aug 2010 09:31:30 -0400
Message-ID: <20100803133130.GU10884@bombadil.infradead.org>
References: <52a11dc3cc92b1e13c028304d9a7beaa@81.11.193.46>
 <20100710170458.96dc8a65.akpm@linux-foundation.org>
 <20100802204641.GA2907@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Ilja <ilja@netric.org>, security@kernel.org,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100802204641.GA2907@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 02, 2010 at 10:46:41PM +0200, Helge Deller wrote:
> Kyle, please apply to the parisc git tree.
> 

Please send this straight to Linus with my
Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

I don't want to accidentally mis-place it again this summer.

--Kyle

> Helge
> 
> -----------
> [PARISC] led.c - fix potential stack overflow in led_proc_write()
> 
> avoid potential stack overflow by correctly checking count parameter
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> 
> diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
> index 188bc84..d02be78 100644
> --- a/drivers/parisc/led.c
> +++ b/drivers/parisc/led.c
> @@ -176,16 +176,18 @@ static ssize_t led_proc_write(struct file *file, const char *buf,
>  	size_t count, loff_t *pos)
>  {
>  	void *data = PDE(file->f_path.dentry->d_inode)->data;
> -	char *cur, lbuf[count + 1];
> +	char *cur, lbuf[32];
>  	int d;
>  
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EACCES;
>  
> -	memset(lbuf, 0, count + 1);
> +	if (count >= sizeof(lbuf))
> +		count = sizeof(lbuf)-1;
>  
>  	if (copy_from_user(lbuf, buf, count))
>  		return -EFAULT;
> +	lbuf[count] = 0;
>  
>  	cur = lbuf;
>  
> 
> 
> 

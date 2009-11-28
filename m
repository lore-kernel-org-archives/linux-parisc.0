From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] parisc: convert /proc/pdc/{lcd,led} to seq_file
Date: Fri, 27 Nov 2009 23:13:54 -0700
Message-ID: <20091128061354.GA21113@lackof.org>
References: <20091127065112.GC26327@x200.malnet.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, akpm@linux-foundation.org,
	linux-parisc@vger.kernel.org
To: Alexey Dobriyan <adobriyan@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091127065112.GC26327@x200.malnet.ru>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 27, 2009 at 09:51:12AM +0300, Alexey Dobriyan wrote:
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

No commit comment?

> ---
> 
>  drivers/parisc/led.c |   59 +++++++++++++++++++++++++--------------------------
>  1 file changed, 29 insertions(+), 30 deletions(-)
> 
> --- a/drivers/parisc/led.c
> +++ b/drivers/parisc/led.c
> @@ -38,6 +38,7 @@
>  #include <linux/kernel_stat.h>
>  #include <linux/reboot.h>
>  #include <linux/proc_fs.h>
> +#include <linux/seq_file.h>
>  #include <linux/ctype.h>
>  #include <linux/blkdev.h>
>  #include <linux/workqueue.h>
> @@ -147,41 +148,34 @@ device_initcall(start_task);
>  static void (*led_func_ptr) (unsigned char) __read_mostly;
>  
>  #ifdef CONFIG_PROC_FS
> -static int led_proc_read(char *page, char **start, off_t off, int count, 
> -	int *eof, void *data)
> +static int led_proc_show(struct seq_file *m, void *v)
>  {
> -	char *out = page;
> -	int len;
> -
> -	switch ((long)data)
> +	switch ((long)m->private)
>  	{
>  	case LED_NOLCD:
> -		out += sprintf(out, "Heartbeat: %d\n", led_heartbeat);
> -		out += sprintf(out, "Disk IO: %d\n", led_diskio);
> -		out += sprintf(out, "LAN Rx/Tx: %d\n", led_lanrxtx);
> +		seq_printf(m, "Heartbeat: %d\n", led_heartbeat);
> +		seq_printf(m, "Disk IO: %d\n", led_diskio);
> +		seq_printf(m, "LAN Rx/Tx: %d\n", led_lanrxtx);
>  		break;
>  	case LED_HASLCD:
> -		out += sprintf(out, "%s\n", lcd_text);
> +		seq_printf(m, "%s\n", lcd_text);
>  		break;
>  	default:
> -		*eof = 1;
>  		return 0;
>  	}
> +	return 0;
> +}
>  
> -	len = out - page - off;
> -	if (len < count) {
> -		*eof = 1;
> -		if (len <= 0) return 0;
> -	} else {
> -		len = count;
> -	}
> -	*start = page + off;
> -	return len;
> +static int led_proc_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, led_proc_show, PDE(inode)->data);
>  }
>  
> -static int led_proc_write(struct file *file, const char *buf, 
> -	unsigned long count, void *data)
> +
> +static ssize_t led_proc_write(struct file *file, const char *buf,
> +	size_t count, loff_t *pos)
>  {
> +	void *data = PDE(file->f_path.dentry->d_inode)->data;
>  	char *cur, lbuf[count + 1];
>  	int d;
>  
> @@ -234,6 +228,15 @@ parse_error:
>  	return -EINVAL;
>  }
>  
> +static const struct file_operations led_proc_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= led_proc_open,
> +	.read		= seq_read,
> +	.llseek		= seq_lseek,
> +	.release	= single_release,
> +	.write		= led_proc_write,
> +};
> +
>  static int __init led_create_procfs(void)
>  {
>  	struct proc_dir_entry *proc_pdc_root = NULL;
> @@ -243,19 +246,15 @@ static int __init led_create_procfs(void)
>  
>  	proc_pdc_root = proc_mkdir("pdc", 0);
>  	if (!proc_pdc_root) return -1;
> -	ent = create_proc_entry("led", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
> +	ent = proc_create_data("led", S_IRUGO|S_IWUSR, proc_pdc_root,
> +				&led_proc_fops, (void *)LED_NOLCD); /* LED */

Documentation/filesystems/seq_file.txt says to use create_proc_entry().
I couldn't find any documentation on proc_create_data().
Is this really the preferred API?

I reviewed the code and it looks fine to me otherwise.

Reviewed-by: Grant Grundler <grundler@parisc-linux.org>

cheers,
grant

>  	if (!ent) return -1;
> -	ent->data = (void *)LED_NOLCD; /* LED */
> -	ent->read_proc = led_proc_read;
> -	ent->write_proc = led_proc_write;
>  
>  	if (led_type == LED_HASLCD)
>  	{
> -		ent = create_proc_entry("lcd", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
> +		ent = proc_create_data("lcd", S_IRUGO|S_IWUSR, proc_pdc_root,
> +					&led_proc_fops, (void *)LED_HASLCD); /* LCD */
>  		if (!ent) return -1;
> -		ent->data = (void *)LED_HASLCD; /* LCD */
> -		ent->read_proc = led_proc_read;
> -		ent->write_proc = led_proc_write;
>  	}
>  
>  	return 0;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

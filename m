From: Petr Mladek <pmladek@suse.cz>
Subject: Re: [PATCH -next 1/2] seq_puts: Convert to return void and convert
 uses too.
Date: Tue, 11 Nov 2014 14:38:51 +0100
Message-ID: <20141111133851.GA2567@pathway.suse.cz>
References: <cover.1415645476.git.joe@perches.com>
 <c8249a5c6504275a0e22704dda83b34002a89eac.1415645476.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@iguana.be>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Felipe Balbi <balbi@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
To: Joe Perches <joe@perches.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <c8249a5c6504275a0e22704dda83b34002a89eac.1415645476.git.joe@perches.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon 2014-11-10 10:58:56, Joe Perches wrote:
> diff --git a/ipc/util.c b/ipc/util.c
> index 106bed0..4f726b7 100644
> --- a/ipc/util.c
> +++ b/ipc/util.c
> @@ -837,8 +837,10 @@ static int sysvipc_proc_show(struct seq_file *s, void *it)
>  	struct ipc_proc_iter *iter = s->private;
>  	struct ipc_proc_iface *iface = iter->iface;
>  
> -	if (it == SEQ_START_TOKEN)
> -		return seq_puts(s, iface->header);
> +	if (it == SEQ_START_TOKEN) {
> +		seq_puts(s, iface->header);
> +		return seq_has_overflowed(s);

It should return 0. The overflow is detected by traverse() that is
called from seq_read(). If the overflow happens, the size of the
buffer is increased and show() is called again.

> +	}
>  
>  	return iface->show(s, it);

This should stay as is. It seems that the show() function might also
return negative value in case of some other failure. See the error
handling of "error = m->op->show(m, p);" in traverse() in fs/seq_file.c


The rest of the patch looks fine.

Best Regards,
Petr

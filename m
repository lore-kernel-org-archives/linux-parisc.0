Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA11125
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 16:14:48 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 16 Jan 2001 23:18:30 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14IfMt-00014b-00; Tue, 16 Jan 2001 23:18:23 +0000
Date: Tue, 16 Jan 2001 23:18:23 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthieu Delahaye <delahaym@esiee.fr>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Lasi harmony driver with mixer
Message-ID: <20010116231823.K20275@parcelfarce.linux.theplanet.co.uk>
References: <3A64D26B.B99BAE70@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A64D26B.B99BAE70@esiee.fr>; from delahaym@esiee.fr on Tue, Jan 16, 2001 at 11:59:56PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>


Hi matthieu, i have a few comments.

On Tue, Jan 16, 2001 at 11:59:56PM +0100, Matthieu Delahaye wrote:
> +Bugs:
> +
> +1. Doesn't work on 715/old
> +
> +This driver doesn't work on 715/old machines, which include the 715/75.  The
> +chip used for this is technically called 'Vivace', which is identical to 
> +Harmony.  Should be easy to fix.  It has something to do with the way it is
> +reported by the inventory code.  The HPA is not that of Lasi or ASP so the
> +interrupts aren't registered properly.

afair, prumpf had his harmony driver working on the 715/scorpio.  perhaps
by looking at his source you could see what is missing?

> +int harmony_mixer_ioctl(struct inode * inode, struct file * file, unsigned int cmd, unsigned long arg)
> +{
> +  int val;
> +  int ret;
[...]

it'd be nice if you could rformat this to follow CodingStyle.

> +static struct file_operations harmony_mixer_fops =
> +{
> +	owner:	THIS_MODULE,
> +	llseek: NULL,
> +	read:   NULL,
> +	write:	NULL,
> +	poll: 	NULL,
> +	ioctl: 	harmony_mixer_ioctl,
> +	mmap:	NULL,
> +	open: 	NULL,
> +	release:NULL,
> +};

Don't initialise unused entries to NULL.  That's the point of using
the new syntax for struct initialisation -- that we don't need to list
unused ones.

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03819
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 09:20:21 -0600
Date: Mon, 21 Jun 1999 17:20:15 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Assembly error: entry.S
Message-ID: <19990621172015.P30362@mencheca.ch.genedata.com>
References: <19990621105017.N30362@mencheca.ch.genedata.com> <199906211506.LAA02079@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199906211506.LAA02079@hiauly1.hia.nrc.ca>; from John David Anglin on Mon, Jun 21, 1999 at 11:06:27AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 21, 1999 at 11:06:27AM -0400, John David Anglin wrote:
> The following error occurs building the kernel:
> 
> gcc -D__KERNEL__ -I/ehic/a/pa/linux/include    -c -o entry.o entry.S
> entry.S:219: macro `ENTRY_NAME' used without args
> make[1]: *** [entry.o] Error 1

Delete line 219.  Oops.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA04583
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 10:07:09 -0600
Date: Mon, 21 Jun 1999 18:07:00 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Assembly error: entry.S
Message-ID: <19990621180700.S30362@mencheca.ch.genedata.com>
References: <19990621174231.R30362@mencheca.ch.genedata.com> <199906211555.LAA02636@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199906211555.LAA02636@hiauly1.hia.nrc.ca>; from John David Anglin on Mon, Jun 21, 1999 at 11:55:42AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 21, 1999 at 11:55:42AM -0400, John David Anglin wrote:
> The problem is NR_Linux_syscalls is not defined.  Define this to 182
> and the file will assemble.

Ah.  It was supposed to be __NR_Linux_syscalls, of course.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA16964
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Sep 1999 03:23:03 -0600
Received: by genedata.com
	via sendmail from stdin
	id <m11Nv14-00025cC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Mon, 6 Sep 1999 11:24:46 +0200 (CEST)
Date: Mon, 6 Sep 1999 11:24:46 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ramdisk.bin?
Message-ID: <19990906112446.A25362@mencheca.ch.genedata.com>
References: <37D35413.6E032AE1@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <37D35413.6E032AE1@uswest.net>; from Ryan Bradetich on Sun, Sep 05, 1999 at 11:41:39PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 05, 1999 at 11:41:39PM -0600, Ryan Bradetich wrote:
> Hmm...
> 
> Ok, I got a stupid question :)
> 
> Where do I generate/find the ramdisk.bin that is a dependency for
> ramdisk.c?

You can either generate one yourself using the loop device under Linux
or just take the one we all use from

ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks/

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

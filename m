Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA30635
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Sep 2000 20:43:40 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39CAC77A.8761CD51@uswest.net>
Date: Thu, 21 Sep 2000 20:44:10 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Erik Paulson <epaulson@upl.cs.wisc.edu>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and ccio-dma
References: <20000921201241.C28365@data.upl.cs.wisc.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Erik,

I also have that problem on the C200+, but it isn't a ccio-dma.c problem
(atleast I don't think it is) ... I believe it is a sym53cxx driver problem.  I
have already started tracking this down, and hopefully will have time to
find and squash the bug this weekend.

hope this helps!

Ryan

Erik Paulson wrote:

> Hi,
>         Using the CVS kernel on a C100 I'm seeing it die with an out-of-mapping
> resources error from ccio-dma.c. It looks like there's been some active
> development there about a week ago, but it's not helping my machine. The
> quickest way for me to bring it about is to try and use mke2fs, but just
> mounting the CD and running a few commands will oftentimes do the trick.
>
> How can I help debug this? There's really no useful information provided by
> the printk now - is there some sort of debugging info I could be collecting,
> or would a backtrace help?
>
> Thanks
>
> -Erik
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

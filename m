Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA08091
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jan 2000 04:56:22 -0700
Message-ID: <20000111115922.5298.qmail@web508.mail.yahoo.com>
Date: Tue, 11 Jan 2000 03:59:22 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] Linux 2.3
To: Matthew Wilcox <willy@thepuffingroup.com>, parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Could someone please update the procedure of saving
the whole cvs tree linux-2.3 to
ftp://puffin.external.hp.com/pub/parisc/cvs/ as a
tar.gz file for initial cvs checkout ?

Ulrich
--- Matthew Wilcox <willy@thepuffingroup.com> wrote:
> 
> Everyone should now switch development to the linux
> 2.3 tree which is
> in CVS.  How do you do this?
> 
> Set your CVSROOT as described on the pages.
> cvs co linux-2.3
> cd linux-2.3
> (fetch a ramdisk.bin and put it in this directory)
> make oldconfig
> make dep
> make Image
> cp arch/parisc/boot/Image to wherever you tftpboot
> from.
> Watch your machine crash.
> 
> It may get as far as a prompt for you; but even if
> it doesn't, it should
> still get quite some way.  Many configurations will
> not work, and some
> may not compile; I ensured that the defconfig will
> at least link.
> 
>
---------------------------------------------------------------------------
> To unsubscribe: send e-mail to
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA28352
	for <parisc-linux@puffin.external.hp.com>; Fri, 24 Mar 2000 06:14:05 -0700
Message-ID: <20000324121539.21840.qmail@web502.mail.yahoo.com>
Date: Fri, 24 Mar 2000 04:15:39 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Success story on 715/33 and a question
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

after Paul's latest changes to palo I was now also
able to boot a cross compiled ELF kernel + ramdisk on
my 715/33. Even my HIL keyboard is working again.
Super!

So now I am trying to do something useful :) with that
booted kernel. I would like to mount the proc
filesystem. I am using a very old ramdisk image
(19991108) because I had trouble with the newer images
on the 715/33 (no network driver).

-mount -t proc proc /proc
returns
mount failed: Function is not available

Is there a ramdisk image which I can use on a system
without a network driver ? Or do I need to compile
sash on HPUX as a SOM executable and build a ramdisk
image by myself ? Do I have to make any changes to
ftp://puffin.external.hp.com/pub/parisc/src/sash-2.1-hpux.tar.gz
?

Ulrich

__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com

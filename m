Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA07401
	for <parisc-linux@puffin.external.hp.com>; Sat, 25 Mar 2000 06:05:20 -0700
Message-ID: <20000325120655.5213.qmail@web506.mail.yahoo.com>
Date: Sat, 25 Mar 2000 04:06:55 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] Success story on 715/33 and a question
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

--- Ulrich Strelow <ulrich_strelow@yahoo.com> wrote:
> 
> Is there a ramdisk image which I can use on a system
> without a network driver ? ...

OK, this was a really stupid question, I must admit. I
simply forget that it now only takes some minutes (in
this case seconds) to build a new lifimage and test
it.

So here are the results of testing the various ramdisk
images at
ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks/
on my 715/33:

Version       sash prompt      mount -t proc proc
/proc
-------------------------------------------------------
19991108      yes              does not work
20000118      yes              works with error
message
20000118a     no               -
20000129      no               -
20000217      yes              works

Version 20000118a hangs after the message "No such
device" because of a missing network driver, Version
20000129 ends with a kernel protection fault.

Maybe these results are of some interest to people
with older machines.

Thanks to Philipp for his quick reply about the
forthcoming improvements for 715/old (that's a good
model name !).

Ulrich  

__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com

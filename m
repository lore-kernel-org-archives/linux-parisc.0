Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA20130
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Apr 2000 00:48:51 -0600
Message-ID: <20000413064819.20328.qmail@web514.mail.yahoo.com>
Date: Wed, 12 Apr 2000 23:48:19 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] Kernel build with CONFIG_IODC_CONSOLE fails
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

--- Ulrich Strelow <ulrich_strelow@yahoo.com> wrote:
> Hi all,
> 
> after Gyula's fix I was able to to compile the
> kernel
> with CONFIG_IODC_CONSOLE. However booting this
> kernel
> results in the (in)famous message "Kernel panic:
> Attempted to kill init!".
> 
> In the beginning of the boot log there is a
> "iodc_con_init" message, but the message "Console:
> switching to IODC console" is missing. 

After looking at the source code of iodccon.c (I
should have done this before !) I have to rewrite my
question:

Is there any reason why the call of take_over_console
in iodc_con_init is commented out ?

Ulrich

__________________________________________________
Do You Yahoo!?
Send online invitations with Yahoo! Invites.
http://invites.yahoo.com

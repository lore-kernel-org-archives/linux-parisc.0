Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 36EC5482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Nov 2001 01:47:29 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Grant Grundler <grundler@puffin.external.hp.com>
Date: Fri, 30 Nov 2001 09:46:04 +0100
References: <200111300743.AAA03588@puffin.external.hp.com>
In-Reply-To: <200111300743.AAA03588@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Message-Id: <20011130084729.36EC5482C@dsl2.external.hp.com>
Subject: [parisc-linux] Re: two minor c3k bugs
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Forwarded to the list, since it may be of interest for others too:

On Friday 30 November 2001 08:43, Grant Grundler wrote:
> Hi helge!

Hi Grant, 

> It's totally cool that I can shutdown the c3k with just power button!
> playing with 2.4.16-pa5 today I noticed to really minor bugs.
> 1) LCD shows "Linux 2.4.1-pa5" in the top line.
>    UTS_RELEASE is definitely 2.4.16 since uname -a prints that too.
>    It wasn't obvious to me where the "6" was getting lost.
>    I only looked at led.c for a bit - just enough to understand
>    that UTS_RELEASE was used to generate the string.

Hmm, I still have 2.4.16-pa4 here and it definately shows 
"2.4.16-pa4" for me. Maybe a SMP problem ?
You could try to double the size of the udelay() parameter
in lcd_print to see if it cures your problem.

> 2) When powering off with poweroff button, the last msg is
>  "Restarting ...". Are we running the wrong event chain?
>   I haven't had a chance to look at this yet. (reviewing
>   code for bame and dug up the DIAG register access code.)

Currently I use "kill_proc(1, SIGINT, 0);" to kill the init-process -
which is normally a reboot-command and gives the above messages.
That's AFAICS not the right solution, but nfortunately I don't know
how to do it correct right now.
The other thing is, that this call will not work if the init-process
doesn't has PID 1 - this happened to me after a kernel crash, where
init needed to fsck.

> thanks!
> grant

Greetings,
Helge

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id B04AF4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Sep 2002 17:35:18 -0600 (MDT)
Message-ID: <20020916233515.96215.qmail@web12507.mail.yahoo.com>
Date: Mon, 16 Sep 2002 16:35:15 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Serial Terminal on C-180 system
To: Rod Smart <snaketails@optushome.com.au>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D86629A.F8CB5564@optushome.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

The C180 will output a signal to the serial port whenever it doesn't
detect a keyboard.  It doesn't need to be turned off.  So, plug in your
monitor, mouse, and keyboard.  You should get something off you
graphics card unless you really messed up the graphics config in the
boot handler menus.  If you don't get anything you will problably need
to connect a serial console to your machine that will emulate vt100.  


derek

--- Rod Smart <snaketails@optushome.com.au> wrote:
>     Hello again.
> 
>     Last time I was here I was asking about how to get the C-180 to
> use
> Serial Terminal, I havn't been able to get it talking to the other
> Linux
> or wincrash system, so I would like to transfer it back to Video mode
> (turn off Serial Terminal.
> 
>     How do I do this when I cannot see the screen ?
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


__________________________________________________
Do you Yahoo!?
Yahoo! News - Today's headlines
http://news.yahoo.com

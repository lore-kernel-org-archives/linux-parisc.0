Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA14606
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Mar 2000 02:46:56 -0700
Received: from cc.weber.edu (localhost [127.0.0.1])
	by bramah.tgate.weber.edu (8.8.8/8.8.8) with ESMTP id BAA00492
	for <parisc-linux@thepuffingroup.com>; Mon, 20 Mar 2000 01:54:06 GMT
	(envelope-from rfleming@cc.weber.edu)
Sender: rob@bramah.tgate.weber.edu
Message-ID: <38D584BD.A744CC3F@cc.weber.edu>
Date: Mon, 20 Mar 2000 01:54:05 +0000
From: rob fleming <rfleming@cc.weber.edu>
MIME-Version: 1.0
To: PA-risc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] 712/60
References: <38D2305D.697A44C7@cc.weber.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

rob fleming wrote:

>     I realize that this may not be a question that can be answered from
> the group, but here goes.
> I bought a schools old machine 712/60 to be exact.  I tried booting it
> from home and found that my monitor doesn't work well with the graphics
> cards initial settings.  (Completely unreadable).  I took it to work one
> afternoon and it boots to the point where HPUX tries reading the
> licences for the machine and dies.  Does anyone know how to change the
> graphics boot mode?  I not longer have the option use the other monitor
> at work to try and fix so I will take any suggestions.
>
> Rob
>
>    ___  ___       __         |  Name  : Robert Fleming
>   /  / /  /____  (__)__  ___ | E-mail : rfleming@cc.weber.edu
>  /  /_/  /  _  \/  /\  \/  / |    day : Solaris, HP-UX, Linux, WinNT, Novell
>  \___,__/__//__/__/ /__/\__\ |  night : FreeBSD-Current, OpenLinux, Mandrake
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

I found a solution.   The problem is that the boot rom (1.3) has an option
built in to define the graphics mode to be supported while it works out what os
or configuration to boot.   "monitor X" is specified if you hit ESC before it
boots the os and you then have the option of choosing 1 .. X monitor
freequencies.  They are then used from that point on when the machines is
turned on.   I tried the tab key but I guessing this has something to do with
either x or the os which aren't on this machine.  Aparently I accidentally
nuked the drive some time ago and had forgotten about it.   I tore into the
case on this one looking for dip switches which were no where to be found.   In
fact this machine hasn't any jumpers at all the board is clean of then.

Rob

--
   ___  ___       __         |  Name  : Robert Fleming
  /  / /  /____  (__)__  ___ | E-mail : rfleming@cc.weber.edu
 /  /_/  /  _  \/  /\  \/  / |    day : Solaris, HP-UX, Linux, WinNT, Novell
 \___,__/__//__/__/ /__/\__\ |  night : FreeBSD-Current, OpenLinux, Mandrake

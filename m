Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA14160
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Apr 2000 06:20:00 -0600
Message-ID: <20000407121957.21801.qmail@web502.mail.yahoo.com>
Date: Fri, 7 Apr 2000 05:19:57 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] K100 problem
To: Steven Pritchard <steve@silug.org>, parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

I am not quite sure, but I think you need to set the
Keyboard Path to the same value as Console Path when
you use a serial console (or PC).

Ulrich


--- Steven Pritchard <steve@silug.org> wrote:
> Jim Hull said:
> > WARN  A008  No bootable device found 
> 
> Apparently the terminal was dead.  I hooked it up to
> my PC and got
> output.  Now I have another problem...  The box
> outputs to the serial
> console, but it doesn't seem to want to take input
> on the serial
> console.  Any ideas what might cause that?
> 
> Here's the boot messages:
> 
> --
> 
> Firmware Version  1.8
> 
> Duplex Console IO Dependent Code (IODC) revision 4
> 
>
------------------------------------------------------------------------------
>    (c) Copyright 1990-1994, Hewlett-Packard Company,
> All rights reserved
>
------------------------------------------------------------------------------
> 
>   Processor   Speed            State          
> CoProcessor State  Cache Size
>   ---------  --------   --------------------- 
> -----------------  ----------
> 
>       0      100  MHz   Active                
> Functional          256 KB
> 
>   Central Bus Speed (in MHz)  :        100  
>   Available Memory (bytes)    :  167772160  
>   Good Memory Required (bytes):   16211968  
> 
> 
>    Primary boot path:    8/0.6   (dec)
>    Alternate boot path:  8/12/5.0   (dec)
>    Console path:         8/4/0.0   (dec)
>    Keyboard path:        8/12/7.0   (dec)
> 
> CPU 0
>   WARNING:  Memory configuration is not optimized
> for performance.  Refer
>             to the System Installation or Memory
> Installation manuals for 
>             memory configuration guidelines.
> 
> 
> Processor is starting autoboot process.
> 
> To discontinue, press any key within 10 seconds.
> 
> 10 seconds expired.
> Proceeding...
> 
> Trying Primary Boot Path
> ------------------------
> 
> Booting... 
> Boot IO Dependent Code (IODC) revision 7
> 
> 
> HARD Booted.
> 
> ISL Revision A.00.38  OCT 26, 1994 
> 
> ISL booting  hpux
> 
> Boot
> : disc(8/0.6.0;0)/stand/vmunix
> 4334092 + 380928 + 407872 start 0x17ce68
> 
> --
> 
> It does boot into HP-UX, so if I can figure out a
> way into it over the
> network, I can probably reload the box with IgniteUX
> and just use it
> as a HP-UX system, but obviously life would be
> easier if I could use
> the console...
> 
> Steve
> -- 
> steve@silug.org           | Linux Users of Central
> Illinois
> (618)398-7320             | Meetings the 4th Tuesday
> of every month
> Steven Pritchard          | http://www.luci.org/ for
> more info
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

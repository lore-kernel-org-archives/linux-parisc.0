Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA14241
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 06:52:20 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 25 Aug 2000 12:52:16 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 25 Aug 2000 12:51:42 -0000
Date: Fri, 25 Aug 2000 07:47:16 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Kernel and palo source broken
Message-ID: <20000825074716.M29677@vodka.thepuffingroup.com>
References: <20000825124049.B13420@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000825124049.B13420@linuxcare.com>; from Richard Hirst on Fri, Aug 25, 2000 at 12:40:49PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 25, 2000 at 12:40:49PM +0100, Richard Hirst wrote:
> Kernel wouldn't build - mostly arch/parisc/kernel/signal.c problems,
> needs to include linux/version.h, PF_PTRACED undefined...

i just added sc_sar to the struct sigcontext.  i'm sure dhd has the
right fix and will commit it once he gets in... rebuilding now.
Hmm.  Wonder why that version number test doesn't work... oh well,
changing it to #if 1 gets it compiled for me.

> I did cvs update -D '24 hours ago' on various things and my A180
> boots again, but my 715/75 doesn't.  It thinks it has three disks
> rather than two plus a tape, disk probing then fails, and finally
> it thinks it is sending BOOTP requests but nothing is seen on the
> network.  
> 
> Boy, am I glad Friday lunchtime is pub time!

Ah yes, the quality of Friday afternoon code is definitely higher than
the rest of the week :-)

-- 
Revolutions do not require corporate support.

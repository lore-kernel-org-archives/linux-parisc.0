Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA06244
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Sep 2000 15:58:38 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 27 Sep 2000 21:59:21 -0000
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 32 bit compiler bug causing kernel crashes
References: <200009151206.GAA17924@udlkern.fc.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 27 Sep 2000 17:45:59 -0400
In-Reply-To: John Marvin's message of "Fri, 15 Sep 2000 06:06:45 -0600 (MDT)"
Message-ID: <87ya0dmru0.fsf@tarwebok.i-did-not-set--mail-host-address--so-shoot-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John Marvin <jsm@udlkern.fc.hp.com> writes:

> This is not good. At "4--->" above r8 is being saved above the stack
> pointer, i.e. before the stack pointer is incremented at "5--->" above.
> This is a compiler bug, and I rebuilt my compiler from top of branch
> sources to make sure that it is still there. It is.

More follow up on this.  I've isolated the optimization flag that
causes this, which is -fschedule-insns2 (or, as it's known internally,
'flag_schedule_insns_after_reload').  Which if you think about it
makes perfect sense given the description of the problem, since the
references to memory off the stack pointer are generated in reload.

Somehow I guess this pass has to be made aware that it can't reorder
references to the stack pointer and frame pointer with respect to each
other ... or something.

I'll keep investigating this when I have time but I don't see an
immediate solution to it.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

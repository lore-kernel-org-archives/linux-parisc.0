Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA14825
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 08:41:39 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Oct 2000 14:41:28 -0000
To: Helge Deller <deller@gmx.de>
Cc: James Waterhouse <james.waterhouse@videotron.ca>,
        "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] booting on 712/60
References: <39ED4B3B.85348ED2@videotron.ca> <00101809303400.18775@P100>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 18 Oct 2000 10:41:42 -0400
In-Reply-To: Helge Deller's message of "Wed, 18 Oct 2000 09:30:34 +0200"
Message-ID: <87aec22oux.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller <deller@gmx.de> writes:

> I'm seeing the same here. The kernel switches independend of your 
> kernel-settings (STI-Console - no STI-Console) to serial-console and just 
> puts some of it's error-messages to the STI-console. 
> If you don't have a nullmodem cable, you could try to ping/telnet your 
> parisc, to see if it's still alive.
> I currently don't know which change in CVS disallowed us to use just 
> STI-Console, but will try to figure out later today. 

Very strange, because it worked for me.  But perhaps I had a magical
combination of .config settings that eludes others.

Of course sticon and the keyboard driver are so broken that I have a
hard time imagining that anyone is actually using them for serious
work, so I don't feel a great urgency here.

I will look into it now if it's not already fixed.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

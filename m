Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA29218
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Nov 1999 08:58:56 -0700
From: dkennedy@thepuffingroup.com
Date: Tue, 30 Nov 1999 12:08:56 -0500 (EST)
To: Carl Johnson <cjs@mcn.net>
cc: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Machine Additions?
In-Reply-To: <3841651A.F66C387B@mcn.net>
Message-ID: <Pine.LNX.4.10.9911301152070.28574-100000@grasshopper.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 28 Nov 1999, Carl Johnson wrote:

> Earlier I saw a message posted about adding machines and their
> descriptions to the puffin site, so I went to do that and 
> when I follow the instructions, etc, etc the addmachine.php3
> kicks out an error, which is embedded and does not show up,
> of:
> 
> 	The IOSCAN output is not in the correct format. Please try
> 	that again. Exiting a  that is not open
> 
> anyhow I am including all the needed info and if someone can finger
> out my problem please tell me:  __TIA__

Ok, I added the machine.

It appears my script wasn't working with blank lines correctly.  I
have made a small fix to allow blank lines.  My script uses a _VERY_
rudamentary check to see if each line of the IOSCAN output is correct.
If it finds one line that isn't correct is complains.  

Thanks for the bug report.  Please let me know if you find anything
else wrong.

-- 
David Kennedy
The Puffin Group

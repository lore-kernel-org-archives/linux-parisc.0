Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bob.ncssm.edu (bob.ncssm.edu [152.34.37.42])
	by dsl2.external.hp.com (Postfix) with SMTP id D1A75482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Apr 2002 15:29:55 -0700 (MST)
Date: Thu, 4 Apr 2002 17:34:31 -0500 (EST)
From: Phil Anderson <andersop@neverland.ncssm.edu>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Missing beep... and music too
In-Reply-To: <009c01c1dc00$d6953d20$02c1a8c0@james.co.uk>
Message-ID: <Pine.LNX.4.33.0204041723170.28627-100000@bob.ncssm.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

the \b should elicit a beep from the system speaker. I know the 712's have 
one (at least my 712/80i does.) Yes, it is a seperate system from the 
sound card. Which leads into another issue that I meant to write here 
about...

I just got X working on my 712/80i the other day. So, I'd now like to get 
mpg321 working. I start esd from the command line and it makes several 
tones... but they come from the PC speaker, not through the sound card 
output. When I try to play something with mpg321, I tell it to use esd 
with the following command line:

mpg321 -o esd filename.mp3

the output consists of :
Illegal Instruction

anyone know why this is? should I be using esd, which seems to only use 
the internal sound instead of the real sound card hardware?

thanks,

-phil

On Thu, 4 Apr 2002, James S wrote:

> > Don't confuse the random PC architecture with the way that real systems
> work.
> >
> fair point, but i was assuming that the 712/60's had a 'system beep' same as
> the pcs that was independant of the sound system.
> 
> James S
> 
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
===============================================================================

Phil Anderson
UNIX Systems Administrator
andersop@neverland.ncssm.edu
The_13th_Ewok@hotmail.com

"Go CRAZY? Don't mind if I do! Woowoowoowoo!" -Homer Simpson

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA24536
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 11:00:40 -0600
Date: Tue, 30 May 2000 12:00:54 -0500
From: "Peter A. Peterson II" <pedro@flynn.zork.net>
To: "FINK,MARTIN \(HP-FtCollins,ex1\)" <martin_fink@hp.com>
Cc: "'Peter A. Peterson II'" <pedro@flynn.zork.net>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX random number generator?
Message-ID: <20000530120054.F11779@flynn.zork.net>
References: <56D553C0B61BD311AD2300A0C9F485C2066C157E@xfc02.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56D553C0B61BD311AD2300A0C9F485C2066C157E@xfc02.fc.hp.com>; from martin_fink@hp.com on Mon, May 29, 2000 at 05:38:33PM -0700
Sender: "Peter A. Peterson II" <pedro@flynn.northpark.edu>
List-ID: <linux-parisc.vger.kernel.org>

Martin --

I got egd installed and working properly, but now openssh craps out
under 'make install' because of:
[gumby(~/openssh-1.2.2)] sudo make install
        gcc -g -O2 -Wall -I/usr/local/ssl/include -D_HPUX_SOURCE
-DETCDIR=\"/usr/local/etc\" -DSc
In file included from config.h:336,
                 from includes.h:22,
                 from atomicio.c:26:
defines.h:93: parse error before `u_int64_t'
defines.h:93: warning: data definition has no type or storage class
*** Error exit code 1

Stop.
[gumby(~/openssh-1.2.2)]

This machine is running HP-UX 10. Would you know how to go about
adding the proper definitions to the types.h file?

(Or where I could read about how to do it?)

Thanks a lot,
Peter


Quoting FINK,MARTIN (HP-FtCollins,ex1):
> Peter -
> 
> Sorry to disappoint - /dev/random /dev/urandom are not available
> on HP-UX.  Lots of internal discussions inside HP on how/when
> to make it available.  No dates.
> 
> Martin
> 
> > 
> > I'm awaiting the day when I can fool around with Linux on my E-45, but
> > in the meantime, I'm trying to use it's tape drive to back up my
> > traditional Linux boxen via piping a tarball through ssh.  
> > However, ssh 
> > needs a random generator (like /dev/urandom/) and I don't 
> > know what an 
> > HP-UX equivalent might be, or how to go about installing one. 
> > 
> > Any ideas?
> > 
> > pedro

-- 
-----------------------------------------------
      "She's laughin in her sleeve, boys;
   I can feel it in my bones."  -- Tom Waits
-----------------------------------------------

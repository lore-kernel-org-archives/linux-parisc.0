Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA17036
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 20:22:29 -0600
Date: Thu, 21 Oct 1999 19:23:20 -0700 (PDT)
From: Jason Eckhardt <jle@cygnus.com>
To: frowand@cup.hp.com
cc: Paul Bame <bame@debian.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot messages from C3000 console
In-Reply-To: <380FB68D.A8F28E62@hp.com>
Message-ID: <Pine.SUN.3.91.991021191324.1551B-100000@poseidon.cygnus.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>




On Thu, 21 Oct 1999, Frank Rowand wrote:

>   read it.  To decode the procedure call I had to know where to find
>   documentation for page zero, know what PDCE_PROC is, figure out what PDC
>   procedure was being called.
> This is where my newbie status becomes apparent. 

   Yes. 

> excuse any foot in mouth here.  I looked at the Puffin web page and didn't
> notice anything about the process of making sure that code that is submitted
> has some minimal level of quality.  Is it just a matter of the community
> applying peer pressure?
> 

  We could institute ECN's (engineering change notices, for those of you
  who've never worked for HP) if that would help :)...

  But seriously, this is an important concern. Normally, there would be
  a "maintainer" who would review code for accuracy, cleanliness, quality,
  etc. before allowing it to be checked in. That person was me at one time,
  but due to tremendous time pressures, I gave up on that.

  jason.
 

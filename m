Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA22828
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 15:04:10 -0600
Received: from videotron.ca ([216.113.0.11]) by
          VL-MS-MR001.sc1.videotron.ca (Netscape Messaging Server 4.15)
          with ESMTP id G2N98S03.BEE for
          <parisc-linux@thepuffingroup.com>; Wed, 18 Oct 2000 17:05:16 -0400
Sender: fleet@mailserv2.iuinc.com
Message-ID: <39EE108A.B2ECCF6B@videotron.ca>
Date: Wed, 18 Oct 2000 17:05:14 -0400
From: James Waterhouse <james.waterhouse@videotron.ca>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: [Fwd: Re: [parisc-linux] booting on 712/60]
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines wrote:
> 
> Ah!  Actually that triggers my memory.  You *must* append
> 'console=tty' to the kernel command line in order to use sticon (or
> probably fbcon too for that matter), or else it will default to
> serial.
> 
> Usually the PALO makefile handles this for you though.

So I should not have to do anything other then what I have been doing
which is just "make palo" right? (I have been following the "recipe"
given here ftp://puffin.external.hp.com/pub/parisc/debug/recipe.x)

> 
> --
> dhd@linuxcare.com, http://www.linuxcare.com/
> Linuxcare. Support for the revolution.
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
Can you discern the signs of the times? || www.danielrevelation.com
Do you see the storm fast approaching?  || www.sundaylaw.com
Is your future built on "The Rock"?     ||
www.bibleinfo.com/sc/toc_sc.html

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA11182
	for <parisc-linux@puffin.external.hp.com>; Mon, 8 Nov 1999 12:14:30 -0700
Message-Id: <199911081915.LAA28813@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] _end symbol in parisc linux? 
Date: Mon, 8 Nov 1999 11:18:01 -0800
From: Cary Coutant <cary@cup.hp.com>
To: "Jeff Law" <law@cygnus.com>,
        "Philipp Rumpf" <prumpf@mathe.stud.uni-erlangen.de>
Cc: "Paul Bame" <bame@debian.fc.hp.com>, <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>  > > Anybody know how to get PA-Linux to have an _end symbol like
>  > > most other programs, including Intel Linux?
>  > 
>  > AFAIK we would need to have linker scripts to do so, which seems to be 
>impo
>  > ssible
>  > with the HP/UX ld.  So this is on the "things that will get nicer when 
>we h
>  > ave
>  > GNU binutils again" list.
>Actually, you can with SOM with clever use of the sort_key attribute within
>a subspace.  Create a new subspace with a larger than normal sort key.  
>Within
>that space create a single symbol "_end".

Donald Scobbie already answered the question:

>Define the symbol as:
>
>extern void *_end;
>
>and the linker will sort it out for you. See the HP-UX man page for
>'end'.

The HP-UX SOM linker will create the symbols _etext, _edata, and _end if 
they are referenced; it won't create them if they're not referenced.

-cary

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA26807
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Jun 1999 01:13:37 -0600
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] strace/truss/par equivalent for HP-UX 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sun, 20 Jun 1999 08:49:18 +0200.
             <19990620084918.H30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 20 Jun 1999 01:08:39 -0600
Message-ID: <5280.929862519@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <19990620084918.H30362@mencheca.ch.genedata.com>you write:
  > Rather than waste time trying to get it to compile when it probably
  > won't link, anyone want to give me a trace of what system calls `sh'
  > makes when it starts up so I can have a crack at getting the most useful
  > bits of HPUX binary compatibility working?
Actually for binary compatibility the linker & X server tended to exercise
the most useful bits.  Or more correctly, those were the hpux bins we (UofU)
wanted to run most badly and thus that's were we concentrated our effort :-)

If you look in Utah's code you'll find the majority of the hpux compat code;
though it will need some updating since those releases predated hpux10 and
hpux11.

Presumably you're thinking about firing up the hpux shell instead of a mini
shell the first time we attempt to get to single user using hpux compat?


jeff



  > 
  > -- 
  > Matthew Wilcox <willy@bofh.ai>
  > "Windows and MacOS are products, contrived by engineers in the service of
  > specific companies. Unix, by contrast, is not so much a product as it is a
  > painstakingly compiled oral history of the hacker subculture." - N Stephens
  > on
  > 
  > ---------------------------------------------------------------------------
  > To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
  > `unsubscribe' as the subject.
  > 
  > 

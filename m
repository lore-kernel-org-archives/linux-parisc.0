Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA16627
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 May 2000 20:42:45 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 2 May 2000 02:42:42 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA04027;
	Tue, 2 May 2000 12:37:19 +1000
Date: Tue, 2 May 2000 12:37:19 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crt0.S does not build
In-Reply-To: <Pine.LNX.4.21.0005020138130.20387-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0005021212470.28310-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I'm trying to get builds working on a new x86 box.
> I've built/installed binutils and gcc (--prefix=/opt/puffin).
> I'm able to build linux-2.3 kernels but palo dies with:
> make[1]: Leaving directory `/linux/grundler/palo/palo'
> cd ipl && make
> make[1]: Entering directory `/linux/grundler/palo/ipl'
> hppa1.1-linux-gcc -D__ASSEMBLY__  -traditional -c -o crt0.o crt0.S
> crt0.S: Assembler messages:
> crt0.S:4: Error: Unknown opcode: `execution'
> crt0.S:6: Error: Unknown opcode: `we'
> crt0.S:8: Fatal error: Unknown opcode: `$start$(interactive, endaddr)'
> make[1]: *** [crt0.o] Error 1
> make[1]: Leaving directory `/linux/grundler/palo/ipl'
> make: *** [makeipl] Error 2
> 
> It seems the assembler is not interpreting the ';' as comments.
> Is the crt0.S broken or my assembler?

Don't you mean "not interpreting `!' as comments"?  At least my copy of
palo uses `!' as the comment char, and current puffin parisc binutils also
use `!' to start a comment.

Can you check which assembler gcc is picking up by adding -v to the gcc
command line above?

-- 
Linuxcare.  Support for the Revolution.

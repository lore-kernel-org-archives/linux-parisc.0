Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA14241
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Sep 1999 14:44:38 -0600
Message-Id: <199909042044.NAA09995@milano.cup.hp.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] milli.S and 0xd's 
In-reply-to: Your message of "Sat, 04 Sep 1999 08:01:48 PDT."
             <19990904080148.Z493@mencheca.ch.genedata.com>
Date: Sat, 04 Sep 1999 13:44:05 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> I just did the exact same thing and didn't get this error.  You are correct
> that the file has 0xd's in it... I wonder if it's which assembler your gcc
> has found?

Yes. jackpot.  I'm picking up the "ninstall" tool set and not the set
distributed from puffin.external.hp.com.  Let's see how painful it is
to get the newer toolset working...

grundler <427>as --version
GNU assembler 2.8.1
...

>   Try appending the `-v' flag to the end of the gcc line and see
> what you get:

make[2]: Entering directory `/linux/linux/arch/parisc/lib'
gcc -D__KERNEL__ -I/linux/linux/include -D__ASSEMBLY__  -traditional -c -v milli.S -o milli.o
Reading specs from /opt/GNU/lib/gcc-lib/hppa1.1-hp-hpux10.20/2.8.1/specs
gcc version 2.8.1
...

vs.

> Reading specs from /opt/depot/egcs-puffin/lib/gcc-lib/hppa1.0-hp-hpux11.00/eg
>   cs-2.91.60/specs
> gcc version egcs-2.91.60 19981201 (egcs-1.1.1 release)

BTW, I noticed "hppa1.0-hp-hpux11.00". Has anyone verified "hpux10.2O"
gcc tools produce the same output as "hpux11.00" flavor tools?
(I know they "should" but wouldn't even think of betting on it.)

I have access to several idle 11.X machines and will take another
look at using them. I didn't consider using them before because they
didn't have 10.20 installed.

thanks Matthew,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253

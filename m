Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD6EA4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 10 Feb 2004 12:26:10 -0700 (MST)
Date: Tue, 10 Feb 2004 14:14:55 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
Message-ID: <20040210191450.GG18972@baldric.uwo.ca>
References: <401530610000B6EA@ocpmta1.freegates.net>
	<4028678600000AEF@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4028678600000AEF@ocpmta1.freegates.net>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Feb 10, 2004 at 05:46:08PM +0100, Joel Soete wrote:
>  
> After some more hack I reach to this pb:
> /Develop/parisc-linux/build/glibc/elf/ld.so.1: undefined reference to `set_dp'
> collect2: ld returned 1 exit status
> make[2]: *** [/Develop/parisc-linux/build/glibc/iconv/iconvconfig] Error
> 1
> make[2]: Leaving directory `/Develop/parisc-linux/src/glibc-2.3.3-20040209/iconv'
> make[1]: *** [iconv/others] Error 2
> make[1]: Leaving directory `/Develop/parisc-linux/src/glibc-2.3.3-20040209'
> make: *** [all] Error 2
> 
> and set_dp only appears in sysdeps/hppa/dl-machine.h

The wrong files are being included. What is your configure line?

c.

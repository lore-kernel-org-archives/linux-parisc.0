Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA11220
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Sep 1999 23:59:58 -0600
Date: Sat, 4 Sep 1999 08:01:48 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] milli.S and 0xd's
Message-ID: <19990904080148.Z493@mencheca.ch.genedata.com>
References: <199909040036.RAA09488@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909040036.RAA09488@milano.cup.hp.com>; from Grant Grundler on Fri, Sep 03, 1999 at 05:36:18PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 03, 1999 at 05:36:18PM -0700, Grant Grundler wrote:
> 
> make[2]: Entering directory `/linux/linux/arch/parisc/lib'
> gcc -D__KERNEL__ -I/linux/linux/include -D__ASSEMBLY__  -traditional -c milli.S -o milli.o
> milli.S: Assembler messages:
> milli.S:16: Error: Rest of line ignored. First ignored character valued 0xd.
> milli.S:19: Error: Rest of line ignored. First ignored character valued 0xd.
> milli.S:21: Error: Rest of line ignored. First ignored character valued 0xd.
> ...
> 
> 
> I stripped the ^M characters out of the file and it compiles.
> Could others explain how they got past this error message?
> Could the gcc I'm using be the wrong one?

I just did the exact same thing and didn't get this error.  You are correct
that the file has 0xd's in it... I wonder if it's which assembler your gcc
has found?  Try appending the `-v' flag to the end of the gcc line and see
what you get:

Reading specs from /opt/depot/egcs-puffin/lib/gcc-lib/hppa1.0-hp-hpux11.00/egcs-2.91.60/specs
gcc version egcs-2.91.60 19981201 (egcs-1.1.1 release)
 /opt/depot/egcs-puffin/lib/gcc-lib/hppa1.0-hp-hpux11.00/egcs-2.91.60/cpp -lang-asm -v -I/linux/linux/include -undef -$ -Dhppa -Dhp9000s800 -D__hp9000s800 -Dhp9k8 -DPWB -Dhpux -Dunix -D__hppa__ -D__hp9000s800__ -D__hp9000s800 -D__hp9k8__ -D__PWB__ -D__hpux__ -D__unix__ -D__hppa -D__hp9000s800 -D__hp9k8 -D__PWB -D__hpux -D__unix -Asystem(unix) -Asystem(hpux) -Acpu(hppa) -Amachine(hppa) -D__ASSEMBLER__ -traditional -D_HPUX_SOURCE -D_HIUX_SOURCE -D__KERNEL__ -D__ASSEMBLY__ milli.S /var/tmp/ccrVZimC.s
GNU CPP version egcs-2.91.60 19981201 (egcs-1.1.1 release) (hppa)
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/include
 /opt/depot/egcs-puffin/hppa1.0-hp-hpux11.00/include
 /opt/depot/egcs-puffin/lib/gcc-lib/hppa1.0-hp-hpux11.00/egcs-2.91.60/include
 /usr/include
End of search list.
 as -o milli.o /var/tmp/ccrVZimC.s
bash-2.03$ which as
/export/willy/bin/as

(at some stage, someone needs to clean up all those default #defines.  But
not right now.)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

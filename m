From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hppa64-...-gcc-4.1 annoying pb?
Date: Fri, 19 May 2006 09:28:25 -0400 (EDT)
Message-ID: <200605191328.k4JDSPrm019529@hiauly1.hia.nrc.ca>
References: <IZI5N7$BB103ABBA779B9B522CAFD57168EE63C@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IZI5N7$BB103ABBA779B9B522CAFD57168EE63C@scarlet.be> from "Joel
	Soete" at May 19, 2006 09:47:31 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Just a follow up; if I well uderstand, the compilation cmdl with -v option
> return me:
> [snip]
> Thread model: single
> gcc version 4.1.1 20060511 (prerelease) (Debian 4.1.0-4)
>  /usr/lib/gcc/hppa64-linux-gnu/4.1.1/cc1 -quiet -nostdinc -v -Iinclude
> -Iinclude2 -I/CAD/linux-2.6.17-rc4-pa1/include -I/CAD/linux-2.6.17-rc4-pa1/mm
> -Imm -D__KERNEL__ -DKBUILD_STR(s)=#s -DKBUILD_BASENAME=KBUILD_STR(page_alloc)
> -DKBUILD_MODNAME=KBUILD_STR(page_alloc) -isystem
> /usr/lib/gcc/hppa64-linux-gnu/4.1.1/include -include include/linux/autoconf.h
> -MD mm/.page_alloc.o.d /CAD/linux-2.6.17-rc4-pa1/mm/page_alloc.c -quiet
> -dumpbase page_alloc.c -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
> -march=2.0 -mschedule=8000 -auxbase-strip mm/.tmp_page_alloc.o -O2 -Wall
> -Wundef -Wstrict-prototypes -Wno-trigraphs -Wdeclaration-after-statement
> -Wno-pointer-sign -version -fno-strict-aliasing -fno-common
> -fomit-frame-pointer -ffunction-sections -o - |
>  /usr/bin/hppa64-linux-gnu-as --traditional-format -V -o mm/.tmp_page_alloc.o -

Joel, would you send me offline the preprocessed .i file for the above.
I would like to try the compilation on a machine with more memory.  It's
a bit surprising that most of the time is spent in the expand pass.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Mon, 14 May 2012 18:38:31 -0400
Message-ID: <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>
References: <4FA9975C.5060708@bergerie> <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net> <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl> <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl> <4FB182F8.2040403@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB182F8.2040403@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 14-May-12, at 6:11 PM, Helge Deller wrote:

> The B160L and the 715/64 (both 32bit-only PA1.X machines) crashed  
> with the following trace.
> All logs attached.
>
> Any ideas?

This is exactly the same failure as reported by Vincent.

The most likely problem is the PA 1.1 tmpalias support in entry.S is  
broken.  For example,
the cache stride that is loaded in flush_dcache_page_asm to register  
r1 is wrong.  Probably,
the do_alias macro is wrong for PA 1.1.  This is hunk of code that  
should be executed
when a fdc non access fault occurs.

nadtlb_check_alias_11:
         do_alias        spc,t0,t1,va,pte,prot,nadtlb_emulate

         idtlba          pte,(va)
         idtlbp          prot,(va)

         rfir
         nop

The TLB insert instructions on PA 1.1 have a different format than on  
PA 2.0.  I'm not sure
how this would corrupt r1.

On the other hand, I had asked Vincent to put a "b,n ." instruction  
just before the fdc loop,
boot, hit the TOC button, and capture the setup registers for the  
flush operation.  It's possible
the stride variable has been clobbered.

Dave

--
John David Anglin	dave.anglin@bell.net




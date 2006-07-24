From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 15:01:36 -0400 (EDT)
Message-ID: <200607241901.k6OJ1aMN000440@hiauly1.hia.nrc.ca>
References: <20060724182758.GC15566@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org
To: kyle@parisc-linux.org (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060724182758.GC15566@athena.road.mcmartin.ca> from "Kyle
	McMartin" at Jul 24, 2006 02:27:58 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The good news, it compiled fine on the first shot. The bad news,
> it failed to link usr/klibc/libc.so, and I'm not clueful enough
> to know why.
> 
> hppa64-linux-gnu-ld  -Ttext 0x40001000 -o usr/klibc/libc.so --start-group
> [...]
> usr/klibc/socketcalls/recvmsg.o /usr/lib/gcc/hppa64-linux-gnu/4.1.2/libgcc.a --end-group
> hppa64-linux-gnu-ld: warning: cannot find entry symbol main; defaulting to 0000000040001000
> hppa64-linux-gnu-ld: usr/klibc/libc.so: Not enough room for program headers (allocated 5, need 6)
>  Section to Segment mapping:
>   Segment              Sections...
>   00:           PHDR:  
>   01:         INTERP:  .interp 
>   02:           LOAD:  .interp .dynamic .hash .dynsym .dynstr 
>   03:           LOAD:  .text .rodata .PARISC.unwind .eh_frame 
>   04:           LOAD:  .data.rel.ro .data .opd .dlt .bss 
>   05:        DYNAMIC:  .dynamic 
> hppa64-linux-gnu-ld: final link failed: Bad value

This is a ld bug.  I see the same problem on hpux with '-static'.  We
need another program header sometimes and I haven't figured out why.
I had a hack on my A500 that I might be able to find but it's down at
the moment.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
Date: Mon, 21 May 2007 12:19:19 -0400 (EDT)
Message-ID: <200705211619.l4LGJKaT004977__34055.7099007585$1416624358$gmane$org@hiauly1.hia.nrc.ca>
References: <20070520211900.GA22493@i386.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: libc-ports@sourceware.org,
 parisc-linux@lists.parisc-linux.org
To: aurelien@aurel32.net (Aurelien Jarno)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070520211900.GA22493@i386.aurel32.net> from "Aurelien Jarno"
	at May 20, 2007 11:19:01 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Then, what about this patch?
> 
> --- ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h.orig	2007-05-20 23:15:37.000000000 +0200
> +++ ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h	2007-05-20 23:15:59.000000000 +0200
> @@ -71,10 +71,10 @@
>  	"copy	%5, %%r24			\n\t"			\
>  	"ble	" LWS "(%%sr2, %%r0)		\n\t"			\
>  	"ldi	" LWS_CAS ", %%r20		\n\t"			\
> +        "sub	%%r0, %%r21, %%r21		\n\t"			\
>  	"cmpib,=,n " ASM_EAGAIN ",%%r21,0b	\n\t"			\

Hmmm, I think the original code was better since it keeps the sub
instruction outside the loop.  The cmpib instruction could be modified
to negate the ASM_EAGAIN.

On the otherhand, I'm now thinking that macros like LWS, LWS_CAS and
ASM_EAGAIN shouldn't be used as they are names that could be used in
user code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

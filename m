From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] input constraints in atomic.h too loose ?
Date: Sat, 10 Feb 2007 16:01:01 -0500 (EST)
Message-ID: <200702102101.l1AL11Ai017315__25716.0043264323$1416624283$gmane$org@hiauly1.hia.nrc.ca>
References: <200702022215.50914.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: vapier@gentoo.org (Mike Frysinger)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702022215.50914.vapier@gentoo.org> from "Mike Frysinger" at
	Feb 2, 2007 10:15:50 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> static void __lll_mutex_lock(int *futex)
> {
> 	int lws_errno = 14; 
> 	int lws_ret;
> 	asm (
> "0:					\n\t" 
> "copy	%3, %%r26			\n\t" 
> "copy	%4, %%r25			\n\t" 
> "copy	%5, %%r24			\n\t" 
> "ble	" "0xb0" "(%%sr2, %%r0)		\n\t" 
> "ldi	" "0" ", %%r20		\n\t" 
> "cmpib,=,n " "11" ",%%r21,0b	\n\t" 
> "nop					\n\t" 
> "stw	%%r28, %0			\n\t" 
> "sub	%%r0, %%r21, %%r21		\n\t" 
> "stw	%%r21, %1			\n\t"
> : "=m" (lws_ret), "=m"(lws_errno), "=m"(*futex)
> : "r"(futex), "r"(0), "r"(1)
> :"r1", "r26", "r25", "r24", "r23", "r22", "r21", "r20", "r28", "r31", "memory"
> );
> }

Aren't lws_errno and lws_ret supposed to be global?  As is, they
are just local variables and do nothing.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

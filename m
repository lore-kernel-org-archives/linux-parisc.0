From: "Joel Soete" <soete.joel@tiscali.be>
Subject: flush_kernel_[di]cache_page question? [WAS: [parisc-linux]
	2.6.10-rc1-pa11 profile data
Date: Fri, 26 Nov 2004 17:59:18 +0100
Message-ID: <418A81170000898E@mail-8-bnl.mail.tiscali.sys>
References: <20041111081154.GR15714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>,
 "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111081154.GR15714@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

> 
> hmm.. interesting. top consumers are (with idle loop functions removed)=

> 
>  40646 flush_kernel_icache_page                 406.4600
[...]
>   4089 flush_kernel_dcache_page                  40.8900
[...]
> we really need to do better at cache flushing..... anybody have any
> ideas? :)
> 
Is somebody can help me to understand those:
[...]
flush_kernel_dcache_page:
	.proc
	.callinfo NO_CALLS
	.entry

	ldil    L%dcache_stride,%r1
	ldw     R%dcache_stride(%r1),%r23

#ifdef __LP64__
	depdi,z 1,63-PAGE_SHIFT,1,%r25
#else
	depwi,z 1,31-PAGE_SHIFT,1,%r25
#endif
	add     %r26,%r25,%r25
	sub     %r25,%r23,%r25


1:      fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	fdc,m   %r23(%r26)
	CMPB<<  %r26,%r25,1b
	fdc,m   %r23(%r26)

	sync
	bv      %r0(%r2)
	nop
	.exit

	.procend
	
	.export flush_user_dcache_page

[...]
flush_kernel_icache_page:
	.proc
	.callinfo NO_CALLS
	.entry

	ldil    L%icache_stride,%r1
	ldw     R%icache_stride(%r1),%r23

#ifdef __LP64__
	depdi,z 1,63-PAGE_SHIFT,1,%r25
#else
	depwi,z 1,31-PAGE_SHIFT,1,%r25
#endif
	add     %r26,%r25,%r25
	sub     %r25,%r23,%r25


1:      fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	fic,m   %r23(%r26)
	CMPB<<  %r26,%r25,1b
	fic,m   %r23(%r26)

	sync
	bv      %r0(%r2)
	nop
	.exit

	.procend
[...]

I try google on the p-l m-l but I didn't reach to find out why those chai=
n
of 15 f[di]c,m?

Thanks in advance for your attention,
    Joel


-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

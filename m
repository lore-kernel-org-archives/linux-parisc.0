From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux]
	Re: =?ISO-8859-1?Q?2=2E6=2E8=2Drc2=20Fix=5Bwas=3A=20=5Bparisc=2Dlinux=5D=20k=2D2=2E6=2E8=2Drc2=2Dpa0=20failled=20to=20boot=20in=09muRO
Date: Thu, 29 Jul 2004 12:55:04 -0400 (EDT)
Message-ID: <200407291655.i6TGt4Xa001858@hiauly1.hia.nrc.ca>
References: <40FB8964000051B2@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40FB8964000051B2@ocpmta2.freegates.net> from "Joel Soete" at Jul
	29, 2004 05:31:27 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Well here is my fix:
> --- linux-2.6.8-rc2-pa2+/arch/parisc/kernel/entry.S.Orig	2004-07-29 10:59:50.000000000
> +0200
> +++ linux-2.6.8-rc2-pa2+/arch/parisc/kernel/entry.S	2004-07-29 11:04:32.000000000
> +0200
> @@ -494,6 +494,7 @@
>  	 * under 4GB of memory) */
>  	.macro		L3_ptep pgd,pte,index,va,fault
>  	extrd,u		\va,63-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
> +	copy		%r0,\pte
>  	extrd,u,*=	\va,31,32,%r0
>  	ldw,s		\index(\pgd),\pgd
>  	extrd,u,*=	\va,31,32,%r0
> ======><======

> Well I couldn't yet explain why that's required :( !

Just after the last insn above is the insn:

	bb,>=,n         \pgd,_PxD_PRESENT_BIT,\fault

You are setting pte to 0 for the case when the branch is taken.
The L2_ptep macro does this, so it makes some sense.  It's somewhat
tricky to track the uses of the register when a fault occurs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3456482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 09:43:45 -0700 (MST)
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m165rWD-000OrMC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 09:43:37 -0700 (MST)
Message-Id: <m165rWD-000OrMC@bame.riverrock.org>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What does this one mean ? 
In-Reply-To: Your message of "Mon, 19 Nov 2001 16:34:22 GMT."
             <20011119163421.A14821@hp.is>
References: <20011119163421.A14821@hp.is> 
Date: Mon, 19 Nov 2001 09:43:37 -0700
From: Paul Bame <bame@riverrock.org>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> 
> Can anyone give me a hint where rpm is failing ?

Wow that really jumped into hyperspace!  Maybe a bad function
pointer.  Generally r2 (0007c04f) is inside the calling function
and IAOQ is inside the currently-executing function, but in this
case it's bogus.  Look up r2 in rpm's symbol table to get a hint.

	-P
> 
> 
> do_page_fault() pid=27461 command='rpm' type=6 address=0x6bc63f53
> vm_start = 0x001e9000, vm_end = 0x00209000
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111
> r0-3     00000000 00110800 0007c04f bff00a08
> r4-7     001b9000 00000009 002085f0 0020866c
> r8-11    00002001 00200eb0 bff008d4 00206f60
> r12-15   001df060 00000000 bff00504 00000102
> r16-19   00000000 001f6fe8 00200eb0 001b9000
> r20-23   00074834 00200f5c 6bc63f51 00000002
> r24-27   bff00a08 00000009 00000009 001dd860
> r28-31   001e4108 00000000 bff00ac0 0007c04f
> sr0-3    000046f4 000046f4 00000000 000046f4
> sr4-7    000046f4 000046f4 000046f4 000046f4
> 
> IASQ: 000046f4 000046f4 IAOQ: 6bc63f53 6bc63f57
>  IIR: 43ffff80    ISR: 000046f4  IOR: 00074850
>  CPU:        0   CR30: 11034000 CR31: 10350000
>  ORIG_R28: 00200f40
> 
> 
> bofh:/chr/lib# uname -a
> Linux bofh 2.4.9-pa70 #1 Tue Nov 6 15:38:47 GMT 2001 parisc unknown
> 
> -- 
> Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
>                --  Solaris 7 Certified Systems and Network Administrator.
> Bell Labs Unix --  Reach out and grep someone.
> Those who do not understand Unix are condemned to reinvent it, poorly.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

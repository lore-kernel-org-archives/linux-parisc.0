Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9EC4A484D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 05:45:24 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18MpBu-0003G1-00; Fri, 13 Dec 2002 12:45:18 +0000
Date: Fri, 13 Dec 2002 12:45:18 +0000
From: Matthew Wilcox <willy@debian.org>
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] fic problem
Message-ID: <20021213124518.A10991@parcelfarce.linux.theplanet.co.uk>
References: <9A0482A7BD2506488AD9417C93F3714FC27735@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9A0482A7BD2506488AD9417C93F3714FC27735@xsp01.brazil.hp.com>; from leandro.farinati@hp.com on Fri, Dec 13, 2002 at 04:27:13AM -0800
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

On Fri, Dec 13, 2002 at 04:27:13AM -0800, FARINATI,LEANDRO (HP-Brazil,ex1) wrote:
>                 __asm__ __volatile__("fdc (%0)" :: "r" (spot) );
>                 __asm__ __volatile__("sync" ::);
>                 __asm__ __volatile__("fic (%0)" :: "r" (spot) );
> (segmentation fault in this line)
>                 __asm__ __volatile__("sync" ::);

don't do it like this.  do it this way:

		__asm__ __volatile__("\n\
			fdc (%0)\n\
			sync\n\
			fic (%0)\n\
			sync\n"
			: : "r" (spot)
		);

that ensures that these 4 insns really are together.  you might want to
look at the generated assembly output for this function (objdump -dr
foo.o |less) and/or recompile the kernel with PRINT_USER_TRAPS turned
on so you get a register dump so you can debug this yourself.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

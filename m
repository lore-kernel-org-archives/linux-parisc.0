Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4021C4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Dec 2002 17:33:05 -0700 (MST)
Date: Fri, 27 Dec 2002 16:34:17 -0800
From: Randolph Chung <randolph@tausq.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Why do we relax e_ident[EI_OSABI] in gdb?
Message-ID: <20021228003417.GX19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021227023137.GD8363@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021227023137.GD8363@systemhalted>
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

> Anyone have some ideas why we have this patch in gdb, and thus relax the 
> EI_OSABI check?
> 
> --- gdb-5.2.cvs20020401/bfd/elf64-hppa.c~	Sun Mar 31 19:09:41 2002
> +++ gdb-5.2.cvs20020401/bfd/elf64-hppa.c	Sat Apr 20 09:35:54 2002
> @@ -372,7 +372,8 @@
>    i_ehdrp = elf_elfheader (abfd);
>    if (strcmp (bfd_get_target (abfd), "elf64-hppa-linux") == 0)
>      {
> -      if (i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_LINUX)
> +      if (i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_LINUX &&
> +          i_ehdrp->e_ident[EI_OSABI] != ELFOSABI_NONE)

well... take a look at
http://bugs.debian.org/cgi-bin/bugreport.cgi?archive=no&bug=137316

but Grant's references explain it in more detail.

randolph

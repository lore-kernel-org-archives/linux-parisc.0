Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DE2348D1
	for <parisc-linux@parisc-linux.org>; Sun, 12 Oct 2003 17:58:11 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A8q6D-0002hB-MW; Mon, 13 Oct 2003 00:58:09 +0100
Date: Mon, 13 Oct 2003 00:58:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: k-2.6.0-test7-pa5: failled 2 pass
Message-ID: <20031012235809.GM27861@parcelfarce.linux.theplanet.co.uk>
References: <3F8739E2.2050205@tiscali.be> <3F893F92.4060606@tiscali.be> <3F894211.2090106@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F894211.2090106@tiscali.be>
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

On Sun, Oct 12, 2003 at 11:59:13AM +0000, Joel Soete wrote:
> May be the fix should be:
> --- Makefile.orig	2003-10-12 13:50:43.000000000 +0200
> +++ Makefile	2003-10-12 13:57:57.000000000 +0200
> @@ -627,8 +627,8 @@
>  # Can't rely on distributing these syminks as patches
>  include/user:
>  	@echo '  Making user->usr/include/linux symlink'
> -	@ln -s ../usr/include/linux $@
> -	@ln -s ../usr/include/asm-$(ARCH) include/user-asm
> +	@ln -fsn ../usr/include/linux $@
> +	@ln -fsn ../usr/include/asm-$(ARCH) include/user-asm
> 
>  # 	Split autoconf.h into include/linux/config/*

Argh.  I never intended to check this in.  My apologies.  I'll unbreak it now.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

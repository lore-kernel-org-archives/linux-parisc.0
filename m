Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CE83482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 05:17:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19dTEr-00021D-GP; Fri, 18 Jul 2003 12:17:25 +0100
Date: Fri, 18 Jul 2003 12:17:25 +0100
From: Matthew Wilcox <willy@debian.org>
To: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pdc_console_die: undefined reference to `log_end'
Message-ID: <20030718111725.GN23808@parcelfarce.linux.theplanet.co.uk>
References: <20030718043300.GB1582@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030718043300.GB1582@conectiva.com.br>
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

On Fri, Jul 18, 2003 at 01:33:00AM -0300, Arnaldo Carvalho de Melo wrote:
> Second try:
> 
> arch/parisc/kernel/built-in.o: In function `pdc_console_die':
> arch/parisc/kernel/built-in.o(.text.pdc_console_die+0x4c): undefined reference to `log_end'
> arch/parisc/kernel/built-in.o: In function `pdc_console_restart':
> arch/parisc/kernel/built-in.o(.text.pdc_console_restart+0x44): undefined reference to `log_end'
> make: ** [.tmp_vmlinux1] Erro 139

You're using Linus' kernel, not ours ;-)  The diff's pretty small these
days and can be found at
http://cvs.parisc-linux.org/download/linux-2.5/patch-2.6.0-test1-pa1.gz

This particular bit is far too ugly to ever go upstream, so if you have any
thoughts on doing it better, please let me know...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

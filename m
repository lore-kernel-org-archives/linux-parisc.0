Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23694482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 09:23:27 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19c5Ab-0001Mp-DY; Mon, 14 Jul 2003 16:23:17 +0100
Date: Mon, 14 Jul 2003 16:23:17 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] real2.S in linux-2.5
Message-ID: <20030714152317.GI23808@parcelfarce.linux.theplanet.co.uk>
References: <3F12C763.7010305@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3F12C763.7010305@hrzpub.tu-darmstadt.de>
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

On Mon, Jul 14, 2003 at 05:08:19PM +0200, Rüdiger Scholz wrote:
> Hi,
> 
> can someone please delete the whitespaces from line 126 in real2.S from 
> linux-2.5, else gcc-3.3 will throw an error . J.David Anglin explained 

Done.

 restore_control_regs:
-       load32  PA(save_cr_space + (N_SAVED_REGS * REG_SZ)), %r26
+       load32  PA(save_cr_space+(N_SAVED_REGS*REG_SZ)), %r26
        POP_CR(%cr15, %r26)

I'm a little annoyed this fix wasn't committed to 2.5 already.  I wonder
what other bits went into the 2.4 tree without going into 2.5 first?

BTW, it's not for gcc-3.3's benefit, but for binutils' benefit.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

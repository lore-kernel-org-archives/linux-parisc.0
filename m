Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2936486D
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 05:48:56 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18nI2R-0002Z3-00; Mon, 24 Feb 2003 12:48:55 +0000
Date: Mon, 24 Feb 2003 12:48:55 +0000
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>, binutils@sources.redhat.com,
	parisc-linux@parisc-linux.org
Message-ID: <20030224124855.G2938@parcelfarce.linux.theplanet.co.uk>
References: <20030223185847.C2938@parcelfarce.linux.theplanet.co.uk> <20030224062421.GA31111@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030224062421.GA31111@bubble.sa.bigpond.net.au>; from amodra@bigpond.net.au on Mon, Feb 24, 2003 at 04:54:21PM +1030
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
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

On Mon, Feb 24, 2003 at 04:54:21PM +1030, Alan Modra wrote:
>   ChangeLog entries shouldn't be sent as diffs.  Write this one as
> 
> 	* hppa-dis.c (print_insn_hppa <2 bit space register>): Do not print
> 	the space register when the value is zero.
> 
> and put the reason for the change as a comment in the code if you feel
> you need some justification for the change.

OK.  I'm just used to changelogs which're a little more verbose.  I
don't think it really needs justifying.

> Did you run the binutils testsuite?

I hadn't... but I have now, and it doesn't introduce any failures.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86816482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Sep 2001 06:53:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15eyet-0000qi-00; Thu, 06 Sep 2001 13:53:27 +0100
Date: Thu, 6 Sep 2001 13:53:27 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs update gives 'move away ....' on every file
Message-ID: <20010906135327.C316@parcelfarce.linux.theplanet.co.uk>
References: <20010906073538.A12771@middle.of.nowhere> <200109060608.AAA09806@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109060608.AAA09806@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Thu, Sep 06, 2001 at 12:08:10AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> One needs to:
> 1) echo $CVSROOT > ~/Root
> 2) find linux -name Root -exec cp ~/Root \{\} \;
> 
> (CVSROOT is the ":pserver:..." value posted several times earlier.)

easier is: for i in `find linux -name Root`; do echo $CVSROOT > $i; done

> I'm not sure who owns the script that make tarballs from cvs source trees.

Alex deVries...

> grundler <525>cat ~/.cvsrc
> cvs -z3 -q
> diff -uNp
> update -Pd
> rm -f

you're not using the most uptodate cvsrc... i fubar the last line, needs to be
`remove', not `rm'.

-- 
Revolutions do not require corporate support.

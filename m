Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33A29482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Apr 2002 05:32:18 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16xnfX-0005jQ-00; Wed, 17 Apr 2002 12:32:11 +0100
Date: Wed, 17 Apr 2002 12:32:11 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] linux-2.4.18-pa19 fpu problem
Message-ID: <20020417123211.L23804@parcelfarce.linux.theplanet.co.uk>
References: <1019034174.3cbd3a3e2c5a5@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1019034174.3cbd3a3e2c5a5@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Apr 17, 2002 at 11:02:54AM +0200
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

On Wed, Apr 17, 2002 at 11:02:54AM +0200, joel.soete@freebel.net wrote:
> Here is some trace I get from the kernel (2.4.18-pa19) make (after a make
> oldconfig):
...
> I do think that lacks a header to define some function.

this code is crufty old HPUX stuff... the warnings have been there
basically forever, and nobody's bothered to fix them.  Nobody's found a
problem either :-) If you want to eliminate these warnings by declaring
everything properly, feel free to send a patch, but I don't think it's
very important.

-- 
Revolutions do not require corporate support.

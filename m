Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D39194840
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Nov 2003 09:25:56 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AHmxI-0008KT-3W; Thu, 06 Nov 2003 16:25:56 +0000
Date: Thu, 6 Nov 2003 16:25:56 +0000
From: Matthew Wilcox <willy@debian.org>
To: "TIMMALOG,PHILIPP (HP-Germany,ex1)" <philipp.timmalog@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] getting FXe work
Message-ID: <20031106162556.GC26869@parcelfarce.linux.theplanet.co.uk>
References: <07A9D2E3B03BD4119FD300D0B747AB29049B32A7@mahler.bbn.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <07A9D2E3B03BD4119FD300D0B747AB29049B32A7@mahler.bbn.hp.com>
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

On Thu, Nov 06, 2003 at 04:57:31PM +0100, TIMMALOG,PHILIPP (HP-Germany,ex1) wrote:
> Hi all,
> 
> it thought, that only the FX-2,4,10 cards are not working under
> parisc-linux?!?

No, only the Vis-EG and earlier cards are supported (and even then,
only via the fb driver).

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

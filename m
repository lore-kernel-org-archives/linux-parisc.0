Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D183487A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 14:01:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16bpTg-0000RM-00; Fri, 15 Feb 2002 21:01:08 +0000
Date: Fri, 15 Feb 2002 21:01:08 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with dump driver.
Message-ID: <20020215210108.I7053@parcelfarce.linux.theplanet.co.uk>
References: <3C6AA3C3.D21C4164@admin.france.hp.com> <20020215064352.86A404858@dsl2.external.hp.com> <3C6D0555.BCDB04B6@admin.france.hp.com> <bruno_vidal@hpfrcu03.france.hp.com> <20020215190818.BB0464873@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020215190818.BB0464873@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Fri, Feb 15, 2002 at 12:08:18PM -0700
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

On Fri, Feb 15, 2002 at 12:08:18PM -0700, Grant Grundler wrote:
> You should be able to leverage most of the code from palo.
> Note that palo runs in th CPU in real-mode - not virtual mode.
> You might consider doing the same for the dump code and just
> be *very* careful about which functions you call.

You have to do that anyway.  If a device has managed to DMA all over
the kernel text, you have to have a completely independent dump
mechanism.  I personally HATE the idea of a kernel dump driver and
think that MPE's solution (on a TOC, dump the ram after reset) was
more elegant and easy to prove correct.

Note that grant disagrees with me on this.

-- 
Revolutions do not require corporate support.

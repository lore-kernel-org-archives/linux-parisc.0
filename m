Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 795014877
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 11:42:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18nNYX-0007Al-00; Mon, 24 Feb 2003 18:42:25 +0000
Date: Mon, 24 Feb 2003 18:42:25 +0000
From: Matthew Wilcox <willy@debian.org>
To: law@redhat.com
Cc: Matthew Wilcox <willy@debian.org>,
	Alan Modra <amodra@bigpond.net.au>, binutils@sources.redhat.com,
	parisc-linux@parisc-linux.org
Message-ID: <20030224184225.N2938@parcelfarce.linux.theplanet.co.uk>
References: <20030224182328.M2938@parcelfarce.linux.theplanet.co.uk> <200302241839.h1OIdqBf016932@localhost.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302241839.h1OIdqBf016932@localhost.redhat.com>; from law@redhat.com on Mon, Feb 24, 2003 at 11:39:52AM -0700
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

On Mon, Feb 24, 2003 at 11:39:52AM -0700, law@redhat.com wrote:
> Err, I built it without difficulty a few months ago (I don't do nearly as
> much PA work as I used to).  Presumably you have an HPUX box, right?  That's
> the easiest way to get it build and running.

nope, no hpux, only i386-linux and hppa-linux around here.  trying to
get binutils cvs to build a cross i386->hppa gdb dies in tix (no tk8.4
directory), trying with just `make all-binutils all-gdb' dies being
unable to find dl.h or machine/save_state.h.

so switch to trying native on an hppa-linux host with gdb-5.3.  that dies
claiming hppa-linux is unsupported.  apply the debian patches.  that build
dies trying to find texc.pro.

i'm willing to put in a certain amount of time & effort, but this is
too much.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16E9C4843
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Nov 2003 09:05:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AOfgT-0002pM-F0; Tue, 25 Nov 2003 16:05:01 +0000
Date: Tue, 25 Nov 2003 16:05:01 +0000
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hppa64-linux-ld segfault
Message-ID: <20031125160501.GI11694@parcelfarce.linux.theplanet.co.uk>
References: <20031124070724.GB26585@colo.lackof.org> <20031124071550.GZ975@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031124071550.GZ975@tausq.org>
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

On Sun, Nov 23, 2003 at 11:15:51PM -0800, Randolph Chung wrote:
> i wanted to update the package to use a newer gcc (it's using 3.0.4
> right now) but gcc-3.3 doesn't seem to produce working kernels for
> hppa64-linux :( for now i guess we want to build gcc-3.0.4+latest
> binutils

Since gcc after 3.0 won't produce functional SMP kernels for 32-bit
either, there's really no point in moving from 3.0 for 32-bit either.
I guess we need to rename it kgcc or something ;-(

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

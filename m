Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D25C482A
	for <parisc-linux@parisc-linux.org>; Sat, 12 May 2001 10:01:31 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: willy@ldl.fc.hp.com (Matthew Wilcox)
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ELFOSABI_LINUX
References: <20010501213458.Y6063@zumpano.fc.hp.com>
From: Jes Sorensen <jes@sunsite.dk>
Date: 12 May 2001 18:01:21 +0200
In-Reply-To: willy@ldl.fc.hp.com's message of "Tue, 1 May 2001 21:34:58 -0600"
Message-ID: <d3ae4id0a6.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Matthew" == Matthew Wilcox <willy@ldl.fc.hp.com> writes:

Matthew>  * Change binutils to produce binaries without ELFOSABI_LINUX
Matthew> set.  This implies rebuilding every debian package we've
Matthew> built so far -- over 1100 source packages.  This means we'd
Matthew> miss our deadline of shipping at the end of May.

Matthew> One subversive developer suggested a third alternative --
Matthew> that we think up & implement an extension to the ABI so we
Matthew> have to use ELFOSABI_LINUX :-)

The easy solution is to change binutils, keep the double check for
ELFOSABI_LINUX and ELFOSABI_SYSV in the hppa glibc for a while and
nuke it when everybody has updated. The important bit is to not put a
toolchain out there that produces the wrong binaries.

I've used similar tricks on the ia64 in the past.

Jes

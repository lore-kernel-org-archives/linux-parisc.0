Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FCAC4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Jun 2003 13:09:07 -0600 (MDT)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <16091.40975.478813.232803@gargle.gargle.HOWL>
Date: Mon, 2 Jun 2003 21:05:51 +0200
To: "Joel Soete" <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] compiler & kernel
In-Reply-To: <3ED70CF100000B3C@ocpmta2.freegates.net>
References: <3ED70CF100000B3C@ocpmta2.freegates.net>
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

Joel Soete writes:
> Well gcc-hppa64 pkg is a bit out dated but that is all is available.
> And I do not found courage to 
> oolchain the last gcc-3.3 :(

maybe it worth adding the biarch patch that debian-{sparc,s390,i386}
add for hppa as well, so you can use gcc-3.3 -m64 to build. binutils
already support hppa64, so patches for glibc and gcc are needed.

	Matthias

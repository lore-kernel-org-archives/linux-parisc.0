Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta07bw.bigpond.com (mta07bw.bigpond.com [144.135.24.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00B0D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Jun 2003 18:38:43 -0600 (MDT)
Received: from bubble.local ([144.135.24.81]) by mta07bw.email.bigpond.com
 (iPlanet Messaging Server 5.2 HotFix 1.14 (built Mar 18 2003))
 with SMTP id <0HH200G9OCD81R@mta07bw.email.bigpond.com> for
 parisc-linux@lists.parisc-linux.org; Thu, 26 Jun 2003 10:36:44 +1000 (EST)
Date: Thu, 26 Jun 2003 10:06:52 +0930
From: Alan Modra <amodra@bigpond.net.au>
In-reply-to: <16122.5027.155918.686357@gargle.gargle.HOWL>
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: parisc-linux@lists.parisc-linux.org, binutils@sources.redhat.com
Message-id: <20030626003652.GQ4022@bubble.sa.bigpond.net.au>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
References: <16122.5027.155918.686357@gargle.gargle.HOWL>
Subject: [parisc-linux] Re: binutils ICE while building todays gcc HEAD on hppa-linux
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

On Wed, Jun 25, 2003 at 11:26:59PM +0200, Matthias Klose wrote:
> ICE in binutils-2.14.90.0.4 building gcc HEAD 20030625, while linking
> the shared libstdc++ library:
> 
> [...]
> -Wl,-soname -Wl,libstdc++.so.6 -o .libs/libstdc++.so.6.0.0
> /usr/bin/ld: BFD 2.14.90.0.4 20030523 Debian GNU/Linux internal error, aborting at ../../bfd/elf32-hppa.c line 3864 in elf32_hppa_relocate_section

Please run the ld command under gdb, and let me know the results of
"p *h".  Note that you may need to recompile elf32-hppa.c at -O1 to
get useful debug info.

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre

From: Alan Modra <amodra@bigpond.net.au>
Subject: [parisc-linux] Re: binutils ICE while building todays gcc HEAD on hppa-linux
Date: Thu, 26 Jun 2003 10:06:52 +0930
Message-ID: <20030626003652.GQ4022__23431.4417154112$1416622540$gmane$org@bubble.sa.bigpond.net.au>
References: <16122.5027.155918.686357@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, binutils@sources.redhat.com
To: Matthias Klose <doko@cs.tu-berlin.de>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-reply-to: <16122.5027.155918.686357@gargle.gargle.HOWL>
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

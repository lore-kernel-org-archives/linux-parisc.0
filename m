Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F9C2482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 10:16:57 -0700 (MST)
Date: Tue, 25 Mar 2003 12:17:25 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Glibc 2.3.2 failures and possible fixes?
Message-ID: <20030325171725.GO8436@systemhalted>
References: <20030324213508.GA8436@systemhalted> <3E68A4AA0000385B@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E68A4AA0000385B@ocpmta8.freegates.net>
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

> 
> I also find:
> 
> into dynamic-link.h
> auto void __attribute__((always_inline))
> elf_machine_rela_relative (ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
>                            ElfW(Addr) *const reloc_addr);
> 
> into sysdeps/hppa/dl-machine.h:
> auto void __attribute__((always_inline))
> elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
>                            const Elf32_Rela *reloc,
>                            Elf32_Addr *const reloc_addr)
> 

Missing patch. My bad. 
I'll update in a few hours with a new sysdep-cancel patch.

Thanks for testing Joel!

c.

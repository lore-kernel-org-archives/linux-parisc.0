Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34018482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 11:01:17 -0700 (MST)
Date: Tue, 25 Mar 2003 19:01:10 +0100
Message-ID: <3E802FB00000055E@ocpmta1.freegates.net>
In-Reply-To: <20030325171725.GO8436@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Glibc 2.3.2 failures and possible fixes?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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


>> 
>> I also find:
>> 
>> into dynamic-link.h
>> auto void __attribute__((always_inline))
>> elf_machine_rela_relative (ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
>>                            ElfW(Addr) *const reloc_addr);
>> 
>> into sysdeps/hppa/dl-machine.h:
>> auto void __attribute__((always_inline))
>> elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
>>                            const Elf32_Rela *reloc,
>>                            Elf32_Addr *const reloc_addr)
>> 
>
>Missing patch. My bad. 

Don't worry.

>I'll update in a few hours with a new sysdep-cancel patch.

I will waiting for :)

>
>Thanks for testing Joel!
>
You know how much am i interested. I know my knowledge is limited but I try
to do my best. 

Always wellcome and thanks for your attention,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be

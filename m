From: Julia Lawall <julia@diku.dk>
Subject: question about arch/parisc/kernel/module.c
Date: Tue, 4 Aug 2009 21:43:57 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0908042140280.3737@ask.diku.dk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The file arch/parisc/kernel/module.c in the function module_finalize 
contains the following code:

	for (i = 1; i < hdr->e_shnum; i++) {
                if(sechdrs[i].sh_type == SHT_SYMTAB
                   && (sechdrs[i].sh_type & SHF_ALLOC)) {
	                int strindex = sechdrs[i].sh_link;
			/* FIXME: AWFUL HACK
	                 * The cast is to drop the const from
                         * the sechdrs pointer */
                        symhdr = (Elf_Shdr *)&sechdrs[i];
                        strtab = (char *)sechdrs[strindex].sh_addr;
	                break;
	        }
        }

The third line, (sechdrs[i].sh_type & SHF_ALLOC), loos suspicious, because 
actually SHT_SYMTAB and SHF_ALLOC have the same value.  Should the third 
line be (sechdrs[i].sh_flags & SHF_ALLOC) instead?

julia

From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: question about arch/parisc/kernel/module.c
Date: Tue, 4 Aug 2009 15:51:16 -0400
Message-ID: <20090804195116.GM28572@bombadil.infradead.org>
References: <Pine.LNX.4.64.0908042140280.3737@ask.diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org
To: Julia Lawall <julia@diku.dk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0908042140280.3737@ask.diku.dk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 04, 2009 at 09:43:57PM +0200, Julia Lawall wrote:
> 	for (i = 1; i < hdr->e_shnum; i++) {
>                 if(sechdrs[i].sh_type == SHT_SYMTAB
>                    && (sechdrs[i].sh_type & SHF_ALLOC)) {
> 	                int strindex = sechdrs[i].sh_link;
> 			/* FIXME: AWFUL HACK
> 	                 * The cast is to drop the const from
>                          * the sechdrs pointer */
>                         symhdr = (Elf_Shdr *)&sechdrs[i];
>                         strtab = (char *)sechdrs[strindex].sh_addr;
> 	                break;
> 	        }
>         }
> 
> The third line, (sechdrs[i].sh_type & SHF_ALLOC), loos suspicious, because 
> actually SHT_SYMTAB and SHF_ALLOC have the same value.  Should the third 
> line be (sechdrs[i].sh_flags & SHF_ALLOC) instead?
> 

Yup, you're quite right. Could you submit a patch, please?

regards, Kyle

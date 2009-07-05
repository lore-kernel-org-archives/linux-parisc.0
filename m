From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 19:07:38 -0400 (EDT)
Message-ID: <20090705230740.EE8624FC6@hiauly1.hia.nrc.ca>
References: <20090705171929.5C7205146@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090705171929.5C7205146@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 5, 2009 01:19:27 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> (gdb) p *(*preloads)->l_next
> $11 = {l_addr = 1076473856, l_name = 0x40000e78 "/lib/libdl.so.2", 
>   l_ld = 0x4029e5fc, l_next = 0x40001118, l_prev = 0x40000bf0, 
>   l_real = 0x40000e88, l_ns = 0, l_libname = 0x400010dc, l_info = {0x0, 
>   0x4029e5fc, 0x0 <repeats 74 times>}, l_phdr = 0x4029b034, 
>   l_entry = 1076477148, l_phnum = 7, l_ldnum = 31, l_searchlist = {
>   r_list = 0x0, r_nlist = 0}, l_symbolic_searchlist = {r_list = 0x400010d8, 
>   r_nlist = 0}, l_loader = 0x403d8880, l_versions = 0x0, l_nversions = 0, 
>   l_nbuckets = 0, l_gnu_bitmask_idxbits = 0, l_gnu_shift = 0, 
>   l_gnu_bitmask = 0x0, {l_gnu_buckets = 0x0, l_chain = 0x0}, {
>   l_gnu_chain_zero = 0x0, l_buckets = 0x0}, l_direct_opencount = 0, 
>   l_type = lt_library, l_relocated = 0, l_init_called = 0, l_global = 0, 
>   l_reserved = 1, l_phdr_allocated = 0, l_soname_added = 0, l_faked = 0, 
>   l_need_tls_init = 0, l_used = 0, l_auditing = 0, l_audit_any_plt = 0, 
>   l_removed = 0, l_contiguous = 1, l_rpath_dirs = {dirs = 0x0, malloced = 0}, 
>   l_reloc_result = 0x0, l_versyms = 0x0, l_origin = 0x400010f8 "/lib", 
>   l_map_start = 1076473856, l_map_end = 1076488476, l_text_end = 1076490240, 
>   l_scope_mem = {0x403d89dc, 0x0, 0x0, 0x0}, l_scope_max = 4, 
>   l_scope = 0x40001040, l_local_scope = {0x40000fe4, 0x0}, l_dev = 536937216, 
>   l_ino = 641559, l_runpath_dirs = {dirs = 0x0, malloced = 0}, 
>   l_initfini = 0x0, l_reldepsmax = 0, l_reldeps = 0x0, l_feature_1 = 0, 
>   l_flags_1 = 0, l_flags = 0, l_idx = 0, l_mach = {fptr_table_len = 0, 
>   fptr_table = 0x0}, l_lookup_cache = {sym = 0x0, type_class = 0, 
>   value = 0x0, ret = 0x0}, l_tls_initimage = 0x0, l_tls_initimage_size = 0, 
>   l_tls_blocksize = 0, l_tls_align = 0, l_tls_firstbyte_offset = 0, 
>   l_tls_offset = 0, l_tls_modid = 0, l_relro_addr = 0, l_relro_size = 0, 
>   l_serial = 3, l_audit = 0x400010d8}
> 
> (gdb) p &(*preloads)->l_next->l_info
> $14 = (Elf32_Dyn *(*)[76]) 0x40000ea8
> (gdb) p (*preloads)->l_next->l_info
> $15 = {0x0, 0x4029e5fc, 0x0 <repeats 74 times>}
> (gdb) p/x 0x40000ea8 + 5 * 4
> $17 = 0x40000ebc
> 
> So, the segmentation fault was caused by a 0x0 in the l_info field of
> the link map for "/lib/libdl.so.2".

After staring at the dynamic loader code for a while, I think the following
mmap call in dl-load.c doesn't correctly map the info data for /lib/libdl.so.2.

        /* Remember which part of the address space this object uses.  */
	l->l_map_start = (ElfW(Addr)) __mmap ((void *) mappref, maplength,
					      c->prot,
					      MAP_COPY|MAP_FILE,
					      fd, c->mapoff);

The info data is near the end of the mapped segment.  The l_info field
is initialized by elf_get_dynamic_info from the dynamic data mapped
at l->ld.

I seem to recall that the kernel mmap implementation on hppa is somewhat
unique.

In the above call, mappref is NULL.  The kernel selects the map location.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

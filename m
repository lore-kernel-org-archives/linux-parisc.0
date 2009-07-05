From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 14:01:54 -0400 (EDT)
Message-ID: <20090705180155.DE07A5146@hiauly1.hia.nrc.ca>
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

> Register $r10 contains the address of the next link map:
> (gdb) p (*preloads)->l_next
> $10 = (struct link_map *) 0x40000e88
> 
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

When I run the command directly under gdb, the info is a different location
and the string table entry is not null:

(gdb) bt
#0  _dl_map_object_deps (map=0x403d8880, preloads=0x40001170, npreloads=12, 
    trace_mode=0, open_mode=0) at dl-deps.c:224
#1  0x403b9bd4 in dl_main (phdr=0x10034, phnum=<value optimized out>, 
    user_entry=<value optimized out>) at rtld.c:1780
#2  0x403cb898 in _dl_sysdep_start (start_argptr=<value optimized out>, 
    dl_main=@0x403d7566: 0x403b8fe4 <dl_main>) at ../elf/dl-sysdep.c:239
#3  0x403b785c in _dl_start_final (arg=0xbff01028, info=0xbff01188)
    at rtld.c:332
#4  0x403b7adc in _dl_start (arg=0xbff01028) at rtld.c:560

(gdb) p *(*preloads)->l_next
$2 = {l_addr = 1076473856, l_name = 0x40000c50 "/lib/libdl.so.2", 
  l_ld = 0x4029e5fc, l_next = 0x40000ef0, l_prev = 0x400009c8, 
  l_real = 0x40000c60, l_ns = 0, l_libname = 0x40000eb4, l_info = {0x0, 
  0x4029e604, 0x4029e66c, 0x4029e664, 0x4029e634, 0x4029e644, 0x4029e64c, 
  0x4029e684, 0x4029e68c, 0x4029e694, 0x4029e654, 0x4029e65c, 0x4029e614, 
  0x4029e61c, 0x4029e60c, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4029e674, 0x0, 0x0, 
  0x4029e67c, 0x0, 0x4029e624, 0x0, 0x4029e62c, 0x0, 0x0, 0x0, 0x0, 0x0, 
  0x0, 0x4029e6b4, 0x4029e6ac, 0x4029e6a4, 0x4029e69c, 0x0, 0x0, 0x4029e6c4, 
  0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4029e6bc, 
  0x0 <repeats 25 times>, 0x4029e63c}, l_phdr = 0x4029b034, 
  l_entry = 1076477148, l_phnum = 7, l_ldnum = 31, l_searchlist = {
  r_list = 0x0, r_nlist = 0}, l_symbolic_searchlist = {r_list = 0x40000eb0, 
  r_nlist = 0}, l_loader = 0x403d8880, l_versions = 0x0, l_nversions = 0, 
  l_nbuckets = 22, l_gnu_bitmask_idxbits = 3, l_gnu_shift = 7, 
  l_gnu_bitmask = 0x4029b144, {l_gnu_buckets = 0x4029b154, 
  l_chain = 0x4029b154}, {l_gnu_chain_zero = 0x4029b148, 
  l_buckets = 0x4029b148}, l_direct_opencount = 0, l_type = lt_library, 
  l_relocated = 0, l_init_called = 0, l_global = 0, l_reserved = 1, 
  l_phdr_allocated = 0, l_soname_added = 0, l_faked = 0, l_need_tls_init = 0, 
  l_used = 0, l_auditing = 0, l_audit_any_plt = 0, l_removed = 0, 
  l_contiguous = 1, l_rpath_dirs = {dirs = 0x0, malloced = 0}, 
  l_reloc_result = 0x0, l_versyms = 0x0, l_origin = 0x40000ed0 "/lib", 
  l_map_start = 1076473856, l_map_end = 1076488476, l_text_end = 1076490240, 
  l_scope_mem = {0x403d89dc, 0x0, 0x0, 0x0}, l_scope_max = 4, 
  l_scope = 0x40000e18, l_local_scope = {0x40000dbc, 0x0}, l_dev = 536937216, 
  l_ino = 641559, l_runpath_dirs = {dirs = 0x0, malloced = 0}, 
  l_initfini = 0x0, l_reldepsmax = 0, l_reldeps = 0x0, l_feature_1 = 0, 
  l_flags_1 = 0, l_flags = 0, l_idx = 0, l_mach = {fptr_table_len = 0, 
  fptr_table = 0x0}, l_lookup_cache = {sym = 0x0, type_class = 0, 
  value = 0x0, ret = 0x0}, l_tls_initimage = 0x0, l_tls_initimage_size = 0, 
  l_tls_blocksize = 0, l_tls_align = 0, l_tls_firstbyte_offset = 0, 
  l_tls_offset = 0, l_tls_modid = 0, l_relro_addr = 0, l_relro_size = 0, 
  l_serial = 3, l_audit = 0x40000eb0}

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

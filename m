From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Tue, 26 Oct 2010 21:29:31 -0400 (EDT)
Message-ID: <20101027012932.3CB6E4FB4@hiauly1.hia.nrc.ca>
References: <alpine.DEB.1.10.1010261729410.25995@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: mikulas@artax.karlin.mff.cuni.cz (Mikulas Patocka)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010261729410.25995@artax.karlin.mff.cuni.cz> from "Mikulas Patocka" at Oct 26, 2010 06:02:13 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Heh. I think you may be lucking in here... see below.
> > 
> > > I found that gcc 4.3 from Debian 5 is buggy, it miscompiled the UP kernel. 
> > > Compiling it with -Os worked fine. Could you please recommend a compiler 
> > > to use? (4.4 from Debian 6 ... or some other version?)
> > > 
> > 
> > 4.4.5 from sid is what I'm using... I think it's working more or less
> > for me. I've only been building/booting UP/SMP on an rp3440 these days,
> > so I'm not sure about 32-bit.
> > 
> > > > our cache flushing is a bit... suboptimal right now (doing whole cache
> > > > flushes on fork and such.)
> > > 
> > > What is exactly the problem there? Could you describe it or refer to some 
> > > document that describes it? Why do you need to flush on fork?
> > > 
> > > Sparc has virtually indexed caches too, but there are not many problems 
> > > with it, basically the only needed thing is to flush the cache when kernel 
> > > touches some user page via its own mapping. (if they ran with 16kB page 
> > > size, they wouldn't have to care about data cache coherency at all).
> I'd say 3-way. If there are 768kB, the associativity must be 3*(2^n).
> 
> > So, on to the interesting bit!
> > 
> > Does your /proc/cpuinfo actually say 768kB? That's... amazingly
> > interesting. I wonder (out loud, sorry I should go back and look at the
> > prior emails) if that's the cause of your cpu issues...
> > 
> > processor       : 0
> > cpu family      : PA-RISC 2.0
> > cpu             : PA8800 (Mako)
> > cpu MHz         : 999.995500
> > capabilities    : os64
> > model           : 9000/800/rp3440  
> > model name      : Storm Peak Fast
> > hversion        : 0x00008890
> > sversion        : 0x00000491
> > I-cache         : 32768 KB
> > D-cache         : 32768 KB (WB, direct mapped)
> > ITLB entries    : 240
> > DTLB entries    : 240 - shared with ITLB
> > bogomips        : 1998.84
> > software id     : 4468984695822677774
> > 
> > is what mine says... (with the 32MB L2 cache.)
> 
> My says:
> processor       : 0
> cpu family      : PA-RISC 2.0
> cpu             : PA8900 (Shortfin)
> cpu MHz         : 900.000000
> capabilities    : os64
> model           : 9000/785/C8000
> model name      : Unknown machine
> hversion        : 0x00008920
> sversion        : 0x00000491
> I-cache         : 768 KB
> D-cache         : 768 KB (WB, direct mapped)
> ITLB entries    : 240
> DTLB entries    : 240 - shared with ITLB
> bogomips        : 1795.68
> software id     : 6249854628114153565
> 
> PA8900 is wrong, direct mapped is wrong.

"direct mapped" indicates that the PDC_CACHE call returned a D_loop value
of 1.  According to the documentation, this indicates that FDCE(addr) only
needs to be done once at any given address.  A N way cache may require
N FDCE(addr) executions or just 1, depending on implementation.  Thus, a
value of 1 doesn't provide any information about the details of the
implementation.

Probably, the I_loop and D_loop values should be saved for the cache
flush code.

> So, maybe the cache is the reason why it is fast and why it doesn't run on 
> SMP?

What happens when you run a SMP kernel?

> > Anyway, the L1 are usually 2/4-way associative on parisc, iirc, I
> > believe the L2 is as well.
> > 
> > The main problems we see on the pa8800 is due to the L2, which is
> > physically indexed, and exclusive. We had some bizarre
> > corruption due to incorrect evictions there. (And flushing 32MB on
> > fork is just utterly painful, we really need to fix that someday.)
> > 
> > --Kyle
> 
> When I read the specification, it says that equivalent virtual addresses 
> are those that are 16-MB (or multiplies of) apart. Warning, the PDF is 
> wrong (it says 1MB), there's an errata on HP website that extends it to 
> 16MB.
> 
> It also gives an option to hash parts of space-ID to the cache addressing, 
> I suppose this is turned off on Linux.
> 
> The hardware handles aliasing of equivalent addresses fine (both on UP or 
> SMP).
> 
> Multiple mappings on non-equivalent addresses are allowed only if all are 
> read-only (otherwise it generates machine-check conditions).
> 
> 
> 
> Based on the specification, I suppose that the processor finds the cache 
> address with a virtual address (and optionally a space-id hashed into it), 
> in parallel it finds the physical address using TLB, the cache contains 3 
> or 4 lines at a given address, each with a full physical address. The 
> phyiscal addresses are compared with the output from the TLB and if match 
> is found, that cache line is accessed.
> 
> 
> 
> So, if we want to implement it correctly, we must allow aliasing only on 
> equivalent virtual addresses.
> 
> - fork --- no problem, the mappings are equivalent after fork, I see no 
> need to flush cache there, hardware should do. If you see such need, 
> describe it.
> 
> - kmap (accessing user pages from the kernel) --- kmap will work if we 
> deliberately select an equivalent kernel address (that matches the user 
> address modulo 16M). If we do, no need to flush cache.

I have tried this but haven't reached a fully stable configuration.
Unfortunately, the hard drive on the system that I was testing on
is dying...

See __clear_user_page_asm.  I tried similar implementations for
copy_user_page, etc.

> - shared memory --- there is SHMLBA boundary that causes that all mappings 
> are aligned to this boundary --- it is **WRONG** in the current kernel!!! 
> It is only 4MB and should be 16MB!!!

James has said that the max for all PA-RISC implementations is
4 MB.  The value is returned by the PDC_CACHE call.  Maybe a BUG_ON is
called for.  The alias boundary can be determined by the alias field
in the D_conf return value.

> - mapped files --- I'd simply map them all so that (mapped_address - 
> file_offset) is divisiable by 16MB. One problem would be MAP_FIXED, this 
> should be simply rejected with -EINVAL and userspace linker be patched to 
> use conguent addresses.
> 
> Note that aliasing non-equivalent addresses may cause machine-check 
> exception according to the specifications, so we simply can't allow the 
> userspace to do them. I don't know how many programs will be broken by 
> restricting MAP_FIXED, but I don't see any other reasonable way (well, 
> you can unmap the other mappings when creating a non-equivalent mapping, 
> but what to do with mlock() then?).
> 
> How does HP-UX solve MAP_FIXED to non-equivalent addresses? Does it abort 
> it with -EINVAL?

I believe that the call fails.  This was a problem in getting PCH to
work on hppa.

> If we obey these rules, we can run with no cache flushing in page mapping 
> or unmappinh at all. There is one case where we'd need to flush cache --- 
> freeing a page and allocating it to a different virtual address. We'd need 
> to free cache on all page freeings or allocations. (it could be later 
> minigated with an arch-specific wrapper around page allocator)
> 
> Mikulas
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Mon, 14 Jun 2004 12:29:03 -0600
Message-ID: <20040614182903.GA15866@colo.lackof.org>
References: <20040611055819.GA32005@colo.lackof.org>
	<008a01c45015$9205b780$f463f40f@jh733133>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: 'James Bottomley' <James.Bottomley@steeleye.com>,
 'PARISC list' <parisc-linux@lists.parisc-linux.org>
To: Jim Hull <jim.hull@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <008a01c45015$9205b780$f463f40f@jh733133>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 11, 2004 at 05:38:24PM -0700, Jim Hull wrote:
> PDC_CACHE returns parameters for both the architected FDCE loop and the
> architected FICE loop.  They are D_base, D_count, D_loop, and D_stride for the
> FDCE loop and I_base, I_count, I_loop, and I_stride for the FICE loop.
> 
> The PDC_CACHE description also contains a Programming Note which explain how
> you might use the values in the various bit-fields from two other returned
> parameters (D_conf and I_conf) to flush a range of addresses using FDC or FIC.
> Technically, these aren't "architected loops", they're just a suggestion.

ah ok. In general, I prefer to do whatever I know HPUX is doing.
Because architected or not, there is a precendence that works (even
if for the wrong reasons).

> I checked the Mako ERS; it clearly describes what parameters PDC must
> return in order for the flush loops to work.  The values you show match
> those in the ERS.

Ok - thanks for confirming.

> > 3) I'm not sure if loop=1 indicates 2-way associative or 
> > direct mapped.
> >    I expect direct mapped.  I need to re-read the docs.
> >    Maybe someone knows? jsm?
> 
> You should not think about the FDCE/FICE parameters as corresponding to any
> particular property of the given cache.  They are simply abstract values to
> plug into the architected flush loops in order to make them flush the whole
> cache.

Understood. I'm not so worried about the "flush whole cache" as the
"flush range" functions where I thought we do need to know the
cache properties.

> For example, since the Mako caches are all 4-way associative, you might
> think that the "loop" parameter(s) would be 4.  However, because of the
> design of the Mako FDCE and FICE instructions, executing with "loop" equal
> 4, and with "count" equal to 1/4 of its current value, would (sometimes)
> fail to flush the whole cache.

Ouch. Does that mean FDCE and FICE modify the L2 cache also?
Do FDC/FIC also affect the L2?

Someone was asserting it was not necessary to flush the L2 since the L2 is
a PIPT cache and would always be coherent. I don't really know but
that makes sense to me.

...
> > I noticed HPUX was calculating the stride differently than
> > parisc-linux. I didn't realize until later the difference
> > could be due to older/newer firmware versions and/or differences
> > in the "architected loop" initialization.
> 
> For FDC/FIC loops, the architecture was changed to handle machines with line
> sizes larger than 64 bytes (like Mako, where it's 128).  The correct equation,
> which will work on both new and old machines, is:
> 
>   stride = (1 << (block - 1)) * ((line * 16) << shift)

The above results in stride=128 on C8000 as well (output appended below).
I now have three variants to calculate stride:

#define CAFL_STRIDE(cnf) ((1 << (cnf.cc_block + 3)) * cnf.cc_line)
#define CAFL_STRIDE(cnf) (cnf.cc_block * (cnf.cc_line << (4 + cnf.cc_shift)))
#define CAFL_STRIDE(cnf) ((1 << (cnf.cc_block-1)) * (cnf.cc_line << (4 + cnf.cc_shift)))

1) original parisc-linux
2) "borrowed" from HPUX (i80_latest, maybe HPUX wants to use
   Jim Hull's suggestion as well?)
3) "New and Improved" :^)

> If the "4 + cnf.cc_shift" is trying to compute a stride, then this may be the
> source of the problem.  Try changing it as above.

I've tested stride of 32/64/128 and they all behave the same.
I'm skeptical stride is the cause of the problem.

So far, just once have I had problems booting with stride=128 and that
was with a suspect kernel (not built/linked clean).
In general, things work from the console (eg ssh foo, apt-get update,
apt-get upgrade, RC scripts, etc).

But sshd segfaults or get's illegal insn faults when trying to ssh
into the c8000. Seems like if it were an IO coherency problem, I'd see
more problems during boot time too...maybe there is something
related to non-zero spaceid.

Jim, do you know if Space Id hashing is disabled the same way
on PA8800 as for PA8500/8600/8700 CPUs?

Or maybe it's easier to verify in the Make ERSthe following is correct:
(See arch/parisc/kernel/pacache.S)
srdis_pa20:

	/* Disable Space Register Hashing for PCXU,PCXU+,PCXW,PCXW+ */

	.word           0x144008bc  /* mfdiag %dr2,%r28 */
	depdi           0,54,1,%r28 /* clear DIAG_SPHASH_ENAB (bit 54) */
	.word           0x145c1840  /* mtdiag %r28,%dr2 */


thanks,
grant

...
Command line for kernel: 'root=/dev/nfs nfsroot=192.168.1.61:/home/tftpboot/pa8'
Selected kernel: HOME=/ from partition 0                                        
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 64-bit ke
Entry 00100000 first 00100000 n 3                                               
Segment 0 load 00100000 size 5013888 mediaptr 0x1000                            
Segment 1 load 005cc000 size 362512 mediaptr 0x4ca000                           
Segment 2 load 00628000 size 393349 mediaptr 0x523000                           
Branching to kernel entry point 0x00100000.  If this is the last                
message you see, you may need to switch your console.  This is                  
a common symptom -- search the FAQ and mailing list at parisc-linux.org         
                                                                                
Linux version 2.6.7-rc2-pa4 (grundler@gsyprf11.external.hp.com) (gcc version 3.4
FP[0] enabled: Rev 1 Model 20                                                   
The 64-bit Kernel has started...                                                
Determining PDC firmware type: 64 bit PAT.                                      
model 000088a0 00000491 00000000 00000002 d4936494c9f85489 100000f0 00000008 002
vers  00000301                                                                  
CPUID vers 20 rev 4 (0x00000284)                                                
capabilities 0x35                                                               
model 9000/785/C8000                                                            
ic_size 2000000 dc_size 2000000 it_size f0                                      
DC  base 0x0 stride 0x80 count 0x40000 loop 0x1                                 
dc_conf = 0x1882000  alias 0 blk 1 line 4 shift 1                               
        wt 0 sh 0 cst 1 assoc 0                                                 
IC  base 0x0 stride 0x80 count 0x40000 loop 0x1                                 
ic_conf = 0x1882000  alias 0 blk 1 line 4 shift 1                               
        wt 0 sh 0 cst 1 assoc 0                                                 
D-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0                                      
I-TLB conf: sh 3 page 1 cst 1 aid 3 pad1 0                                      
dcache_stride 128   icache_stride 128                                           
parisc_cache_init: Only equivalent aliasing supported!                          
Total Memory: 1024 Mb                                                           
On node 0 totalpages: 262144                                                    
  DMA zone: 262144 pages, LIFO batch:16                                         
  Normal zone: 0 pages, LIFO batch:1                                            
  HighMem zone: 0 pages, LIFO batch:1                                           
Built 1 zonelists                                                               
Kernel command line: root=/dev/nfs nfsroot=192.168.1.61:/home/tftpboot/pa8800 i/
PID hash table entries: 16 (order 4: 256 bytes)  
...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

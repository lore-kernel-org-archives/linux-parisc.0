From: "Joel Soete" <soete.joel@scarlet.be>
Subject: About iommu-helpers.h: where can I find detailed info on the scatter
	list programming?
Date: Tue,  1 Jul 2008 15:29:10 +0100
Message-ID: <K3C08M$52B5B257A95AE32854A54A32CC567578@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Grant,

I am looking for such kind of reference because I am totally ignorant on this
subject (as well as many others ;-) ) and didn't find yet the good entry point?

Re-reading ccio-dma code for the n*1000 time, I noticed your comment:
/* Fast path single entry scatterlists */
if (nents == 1) {
[snip]

This comment make me thought: it's just a shortcut and the rest of the code
would just slowdown operation?

No?

In fact the 2 drivers (sba and ccio) without this hunk of code make panicing
the boot. 
For the ccio: some where in the initialization of the first scsi drive (no
more info)
For the sba: seems nearly at the same place but with addtional message
[snip]
sym0: <895a> rev 0x1 at pci 0000:00:0f.0 irq 20
sym0: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
Kernel panic - not syncing:
/Extra/linux-current-trace/drivers/parisc/sba_iommu.c: I/O MMU @ 0000a000 is
out of mapping resources   

Is it normal?

Then with help of relayfs and Mathieu Denoyer's patch, I introduced some
tracepoint in iommu-helpers.h as follow:

static inline unsigned int
iommu_fill_pdir(struct ioc *ioc, struct scatterlist *startsg, int nents,
                unsigned long hint,
                void (*iommu_io_pdir_entry)(u64 *, space_t, unsigned long,
                                            unsigned long))
{
        struct scatterlist *dma_sg = startsg;   /* pointer to current DMA */
        unsigned int n_mappings = 0;
        unsigned long dma_offset = 0, dma_len = 0;
        u64 *pdirp = NULL;

#ifdef CONFIG_RELAY_DEBUGFS
START:
        {
        unsigned long start = (unsigned long)&&START;
        TRC_RES(iommu_fill_pdir_start, "%s() at 0x%lx\n", __func__, start);
        };
#endif

[snip]
        while (nents-- > 0) {
                unsigned long vaddr;
                long size;

                DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
                           (unsigned long)sg_dma_address(startsg),
sg_dma_len(startsg),
                           sg_virt_addr(startsg), startsg->length
                );

#ifdef CONFIG_RELAY_DEBUGFS
                TRC_RUN_SG(iommu_fill_pdir_1,
                        " %d : 0x%lx/0x%x 0x%lx/%x\n", nents,
                        (unsigned long)sg_dma_address(startsg),
sg_dma_len(startsg),
                        sg_virt_addr(startsg), startsg->length
                );
#endif

[snip]

                        vaddr += IOVP_SIZE;
                        size -= IOVP_SIZE;
                        pdirp++;
                } while(unlikely(size > 0));
                startsg++;
        }

#ifdef CONFIG_RELAY_DEBUGFS
DONE:
        {
        unsigned long done = (unsigned long)&&DONE;
        TRC_RES(iommu_fill_pdir_done, "%s() at 0x%lx\n", __func__, done);
        };
#endif

        return(n_mappings);
}

Well relayfs is may be not perfect (some time I lost some messages) but I can
anyway collect info like:

[snip]
  1882 :1214908412951002084:ccio_alloc_range_2:ccio_alloc_range() res_idx
0xd13 res_hint: 0x1fc3ad10
  1883 :1214908412951265428:iommu_coalesce_chunks_done:iommu_coalesce_chunks()
at 0x1024c26c
  1884 :1214908412951325361:iommu_fill_pdir_start:iommu_fill_pdir() at 0x1024c2ac
  1885 :1214908412951393706:iommu_fill_pdir_1: 11 : 0x86893c00/0x400
0x1b5d4c00/400
  1886 :1214908412951462584:iommu_fill_pdir_2: dma_sg == 0x1fd37420 ?< startsg
== 0x1fd37420
  1887 :1214908412951531800:iommu_fill_pdir_1: 10 : 0x86894800/0x400
0x1f6e8800/400
  1888 :1214908412951599045:iommu_fill_pdir_2: dma_sg == 0x1fd37434 ?< startsg
== 0x1fd37434
  1889 :1214908412951666334:iommu_fill_pdir_1: 9 : 0x86895c00/0x400 0x1f14ac00/400
  1890 :1214908412951733250:iommu_fill_pdir_2: dma_sg == 0x1fd37448 ?< startsg
== 0x1fd37448
  1891 :1214908412951800517:iommu_fill_pdir_1: 8 : 0x86896800/0x400 0x10526800/400
  1892 :1214908412951867600:iommu_fill_pdir_2: dma_sg == 0x1fd3745c ?< startsg
== 0x1fd3745c
  1893 :1214908412951935067:iommu_fill_pdir_1: 7 : 0x86897800/0x400 0x10525800/400
  1894 :1214908412952003684:iommu_fill_pdir_2: dma_sg == 0x1fd37470 ?< startsg
== 0x1fd37470
  1895 :1214908412952070750:iommu_fill_pdir_1: 6 : 0x86898800/0x400 0x100d9800/400
  1896 :1214908412952137567:iommu_fill_pdir_2: dma_sg == 0x1fd37484 ?< startsg
== 0x1fd37484
  1897 :1214908412952204734:iommu_fill_pdir_1: 5 : 0x86899000/0x400 0x10753000/400
  1898 :1214908412952271684:iommu_fill_pdir_2: dma_sg == 0x1fd37498 ?< startsg
== 0x1fd37498
  1899 :1214908412952338850:iommu_fill_pdir_1: 4 : 0x8689ac00/0x400 0x100f7c00/400
  1900 :1214908412952405934:iommu_fill_pdir_2: dma_sg == 0x1fd374ac ?< startsg
== 0x1fd374ac
  1901 :1214908412952473067:iommu_fill_pdir_1: 3 : 0x8689b800/0x400 0x1f5f7800/400
  1902 :1214908412952539984:iommu_fill_pdir_2: dma_sg == 0x1fd374c0 ?< startsg
== 0x1fd374c0
  1903 :1214908412952607284:iommu_fill_pdir_1: 2 : 0x8689c400/0x400 0x1f2f6400/400
  1904 :1214908412952674367:iommu_fill_pdir_2: dma_sg == 0x1fd374d4 ?< startsg
== 0x1fd374d4
  1905 :1214908412952741700:iommu_fill_pdir_1: 1 : 0x8689dc00/0x400 0x1d7abc00/400
  1906 :1214908412952808922:iommu_fill_pdir_2: dma_sg == 0x1fd374e8 ?< startsg
== 0x1fd374e8
  1907 :1214908412952875811:iommu_fill_pdir_1: 0 : 0x8689e800/0x400 0x1d3a5800/400
  1908 :1214908412952942472:iommu_fill_pdir_2: dma_sg == 0x1fd374fc ?< startsg
== 0x1fd374fc
  1909 :1214908412953004089:iommu_fill_pdir_done:iommu_fill_pdir() at 0x1024c52c
  1910 :1214908412953063117:ccio_map_sg_2:ccio_map_sg() DONE 12 mappings
  1911 :1214908412968545783:ccio_unmap_sg_1:ccio_unmap_sg() START 12 entries,
 1b5d4c00,400

[snip]
  7125 :1214908449024631922:iommu_coalesce_chunks_done:iommu_coalesce_chunks()
at 0x1024c26c
  7126 :1214908449024692195:iommu_fill_pdir_start:iommu_fill_pdir() at 0x1024c2ac
  7127 :1214908449024759656:iommu_fill_pdir_1: 24 : 0x82e40000/0x10000
0x177dc000/1000
  7128 :1214908449024829078:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd382c0
  7129 :1214908449024895239:iommu_fill_pdir_1: 23 : 0x0/0x0 0x177db000/1000
  7130 :1214908449024965489:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd382d4
  7131 :1214908449025030956:iommu_fill_pdir_1: 22 : 0x0/0x0 0x177da000/1000
  7132 :1214908449025095917:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd382e8
  7133 :1214908449025161356:iommu_fill_pdir_1: 21 : 0x0/0x0 0x177d9000/1000
  7134 :1214908449025226456:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd382fc
  7135 :1214908449025291889:iommu_fill_pdir_1: 20 : 0x0/0x0 0x177d8000/1000
  7136 :1214908449025356850:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd38310
  7137 :1214908449025422456:iommu_fill_pdir_1: 19 : 0x0/0x0 0x177d7000/1000
  7138 :1214908449025487589:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd38324
  7139 :1214908449025553222:iommu_fill_pdir_1: 18 : 0x0/0x0 0x177d6000/1000
  7140 :1214908449025618484:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd38338
  7141 :1214908449025683789:iommu_fill_pdir_1: 17 : 0x0/0x0 0x177d5000/1000
  7142 :1214908449025748622:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd3834c
  7143 :1214908449025814056:iommu_fill_pdir_1: 16 : 0x0/0x0 0x177d4000/1000
  7144 :1214908449025879050:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd38360
  7145 :1214908449025944539:iommu_fill_pdir_1: 15 : 0x0/0x0 0x177d3000/1000
  7146 :1214908449026009672:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd38374
  7147 :1214908449026075139:iommu_fill_pdir_1: 14 : 0x0/0x0 0x177d2000/1000
  7148 :1214908449026140100:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd38388
  7149 :1214908449026205672:iommu_fill_pdir_1: 13 : 0x0/0x0 0x177d1000/1000
  7150 :1214908449026270806:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd3839c
  7151 :1214908449026336422:iommu_fill_pdir_1: 12 : 0x0/0x0 0x177d0000/1000
  7152 :1214908449026401684:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd383b0
  7153 :1214908449026467206:iommu_fill_pdir_1: 11 : 0x0/0x0 0x177dd000/1000
  7154 :1214908449026532200:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd383c4
  7155 :1214908449026598072:iommu_fill_pdir_1: 10 : 0x0/0x0 0x177eb000/1000
  7156 :1214908449026665228:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd383d8
  7157 :1214908449026730839:iommu_fill_pdir_1: 9 : 0x0/0x0 0x177ea000/1000
  7158 :1214908449026796150:iommu_fill_pdir_2: dma_sg == 0x1fd382c0 ?< startsg
== 0x1fd383ec
  7159 :1214908449026864200:iommu_fill_pdir_1: 8 : 0x82e50000/0x9000
0x177e9000/1000
  7160 :1214908449026932067:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd38400
  7161 :1214908449026997739:iommu_fill_pdir_1: 7 : 0x0/0x0 0x177e8000/1000
  7162 :1214908449027063117:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd38414
  7163 :1214908449027129006:iommu_fill_pdir_1: 6 : 0x0/0x0 0x177e7000/1000
  7164 :1214908449027194417:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd38428
  7165 :1214908449027260439:iommu_fill_pdir_1: 5 : 0x0/0x0 0x177e6000/1000
  7166 :1214908449027325356:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd3843c
  7167 :1214908449027391039:iommu_fill_pdir_1: 4 : 0x0/0x0 0x177e5000/1000
  7168 :1214908449027455872:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd38450
  7169 :1214908449027521739:iommu_fill_pdir_1: 3 : 0x0/0x0 0x177e4000/1000
  7170 :1214908449027586800:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd38464
  7171 :1214908449027652606:iommu_fill_pdir_1: 2 : 0x0/0x0 0x177e3000/1000
  7172 :1214908449027717417:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd38478
  7173 :1214908449027783189:iommu_fill_pdir_1: 1 : 0x0/0x0 0x177e2000/1000
  7174 :1214908449027848139:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd3848c
  7175 :1214908449027913478:iommu_fill_pdir_1: 0 : 0x0/0x0 0x177e1000/1000
  7176 :1214908449027978322:iommu_fill_pdir_2: dma_sg == 0x1fd382d4 ?< startsg
== 0x1fd384a0
  7177 :1214908449028039450:iommu_fill_pdir_done:iommu_fill_pdir() at 0x1024c52c
  7178 :1214908449028097834:ccio_map_sg_2:ccio_map_sg() DONE 2 mappings

and what is specially confusing to me are the values of couple "(unsigned
long)sg_dma_address(startsg)/sg_dma_len(startsg)" (see trace point
iommu_fill_pdir_1).

As I have no clue on what is correct or what is wrong, I very need more advises.

Tx in adavance,
    j.



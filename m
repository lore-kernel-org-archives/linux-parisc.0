From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] ccio-dma more debuging
Date: Tue, 21 Jun 2005 18:01:21 +0200
Message-ID: <42933E2F0000A9DC@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: "Grundler Grant" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,

2 small stuff:
    o testing the following patch on my d380, I just figure out that (by
accident ;-) ) 2.6.12-pa1 was working in _smp_  ;-)
      (it compiled 2 kernels (a 32 and a 64bit) in the same time in two d=
ifferent
fs during more then 2h 
       without neither smp error messages nor hanging ;-)
      may be a better basis to test Ingo stuff (if you have new patches t=
o
make me test)?

    o some additional ccio-dma stuff I would like to submit you (if you s=
till
have some time):
 --- drivers/parisc/ccio-dma.c.Orig      2005-06-21 17:15:16.000000000 +0=
200
+++ drivers/parisc/ccio-dma.c   2005-06-21 17:19:46.000000000 +0200
@@ -226,14 +226,16 @@
 */
 
 struct ioc {
-       struct ioa_registers __iomem *ioc_regs;  /* I/O MMU base address
*/
-       u8  *res_map;                   /* resource map, bit =3D=3D pdir =
entry
*/
-       u64 *pdir_base;                 /* physical base address */
-       u32 pdir_size;                  /* bytes, function of IOV Space s=
ize
*/
-       u32 res_hint;                   /* next available IOVP - 
+       struct ioa_registers
+               __iomem *ioc_regs;      /* I/O MMU base address */
+       unsigned char   *res_map;       /* resource map, bit =3D=3D pdir =
entry
*/
+       u64             *pdir_base;     /* physical base address */
+       unsigned int     pdir_size;     /* bytes, function of IOV Space s=
ize
*/
+       unsigned long    res_hint;      /* next available IOVP - 
                                           circular search */
-       u32 res_size;                   /* size of resource map in bytes
*/
-       spinlock_t res_lock;
+       spinlock_t       res_lock;
+       unsigned int     res_size;      /* size of resource map in bytes
*/
+       unsigned int     res_bitshift;  /* from the LEFT! */
 
 #ifdef CCIO_SEARCH_TIME
 #define CCIO_SEARCH_SAMPLE 0x100
@@ -302,7 +304,7 @@
        for(; res_ptr < res_end; ++res_ptr) { \
                if(0 =3D=3D (*res_ptr & mask)) { \
                        *res_ptr |=3D mask; \
-                       res_idx =3D (unsigned int)((unsigned long)res_ptr=
 -
(unsigned long)ioc->res_map); \
+                       res_idx =3D ((unsigned long)res_ptr - (unsigned l=
ong)ioc->res_map);
\
                        ioc->res_hint =3D res_idx + (size >> 3); \
                        goto resource_found; \
                } \
@@ -341,14 +343,16 @@
 static int
 ccio_alloc_range(struct ioc *ioc, size_t size)
 {
-       unsigned int pages_needed =3D size >> IOVP_SHIFT;
-       unsigned int res_idx;
+       unsigned int    pages_needed;
+       unsigned long   res_idx;
 #ifdef CCIO_SEARCH_TIME
        unsigned long cr_start =3D mfctl(16);
 #endif
 
+       pages_needed =3D size >> IOVP_SHIFT;
+
        BUG_ON(pages_needed =3D=3D 0);
-       BUG_ON((pages_needed * IOVP_SIZE) > DMA_CHUNK_SIZE);
+       BUG_ON(pages_needed > BITS_PER_LONG);
      
        DBG_RES("%s() size: %d pages_needed %d\n", 
                __FUNCTION__, size, pages_needed);
@@ -383,12 +387,11 @@
                CCIO_FIND_FREE_MAPPING(ioc, res_idx, ~0UL, 64);
 #endif
        } else {
-               panic("%s: %s() Too many pages to map. pages_needed: %u\n=
",
-                      __FILE__,  __FUNCTION__, pages_needed);
+               panic("%s() Too many pages to map. pages_needed: %u\n",
+                      __FUNCTION__, pages_needed);
        }
 
-       panic("%s: %s() I/O MMU is out of mapping resources.\n", __FILE__=
,
-             __FUNCTION__);
+       panic("%s() I/O MMU is out of mapping resources.\n", __FUNCTION__=
);
 
 resource_found:
 
@@ -435,7 +438,6 @@
        unsigned int res_idx =3D PDIR_INDEX(iovp) >> 3;
 
        BUG_ON(pages_mapped =3D=3D 0);
-       BUG_ON((pages_mapped * IOVP_SIZE) > DMA_CHUNK_SIZE);
        BUG_ON(pages_mapped > BITS_PER_LONG);
 
        DBG_RES("%s():  res_idx: %d pages_mapped %d\n", 
=3D=3D=3D=3D<>=3D=3D=3D=3D

As previoulsy said, tested with success on d380 smp 32bit kernel (the 64b=
it
twin is ongoing to be compiled...)

Thanks in advance,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

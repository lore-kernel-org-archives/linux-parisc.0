Return-Path: <knaresh@india.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D2CC484B
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 01:39:56 -0700 (MST)
Received: from redsea.india.hp.com (redsea.india.hp.com [15.76.97.3])
	by palrel13.hp.com (Postfix) with ESMTP id A58EC1C02B4C
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 00:39:54 -0800 (PST)
Received: from india.hp.com (eb9856.india.hp.com [15.76.98.56])
	by redsea.india.hp.com (8.9.3 (PHNE_29774)/8.9.3 SMKit7.02) with ESMTP
	id OAA08623 for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 14:23:12 +0530 (IST)
Message-ID: <401623CA.59AE3CCD@india.hp.com>
Date: Tue, 27 Jan 2004 14:09:38 +0530
From: Naresh Kumar <knaresh@india.hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Using PAT_IO calls for PCI config space reads and
	writes.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

When I was trying to bring up PA-Linux-2.4 on some of the newer boxes, I
discovered that reads/writes from the PCI config space were failing (
system crashes and hangs during the boot). Currently, reads and writes
to the config space happen through memory loads and stores to PCI config
addresses directly  (lba_cfg_[read|write]##size in lba_pci.c ). Grant
Grundler advised me to use PDC_PAT_IO calls instead, for PAT based
systems, since they are more reliable and take care of border cases on
newer systems. I have made the changes and tested them on an L-Class
system. I am posting the diff of the files I have changed. The changes
have been made to three files:

1. arch/parisc/kernel/firmware.c - Rev 1.47
2. arch/parisc/kernel/lba_pci.c - Rev 1.54
3. include/asm-parisc/pdc.h - Rev 1.48

Kindly let me know your comments:

--------------------START------------------------------------------------------------------------------

--- lba_pci.c.1.54       Fri Jan 23 15:47:41 2004
+++ lba_pci.c.modified   Fri Jan 23 15:53:15 2004
@@ -504,6 +504,13 @@ lba_rd_cfg(struct lba_device *d, u32 tok
        return(data);
 }

+#ifdef __LP64__
+#define PAT_CFG_READ(a,b,c)    pdc_pat_io_pci_cfg_read(a,b,c)
+#define PAT_CFG_WRITE(a,b,c)   pdc_pat_io_pci_cfg_write(a,b,c)
+#else
+#define PAT_CFG_READ(a,b,c)
+#define PAT_CFG_WRITE(a,b,c)
+#endif

 #define LBA_CFG_RD(size, mask) \
 static int lba_cfg_read##size (struct pci_dev *dev, int pos, u##size
*data) \
@@ -512,6 +519,21 @@ static int lba_cfg_read##size (struct pc
        u32 local_bus = (dev->bus->parent == NULL) ? 0 :
dev->bus->secondary; \
        u32 tok = LBA_CFG_TOK(local_bus,dev->devfn); \
  \
+       if (is_pdc_pat()) { \
+               int ret; \
+               tok = LBA_CFG_TOK(dev->bus->number,dev->devfn); \
+               ret = PAT_CFG_READ((tok | pos ), \
+                                        sizeof(u##size), (u##size *)
data); \
+               if ( ret == 0 ) { \
+                       DBG_CFG("%s(%s+%2x) -> 0x%x (c)\n",
__FUNCTION__, dev->slot_name, pos, *data
); \
+                       return(*data == (u##size) -1); \
+               } else { \
+                       DBG_CFG("LBA: CFG read failed: ret = %d,
d->hba.base_addr = 0x%lx\n", \
+                                               ret, d->hba.base_addr );
\
+                       return (1); \
+               } \
+       } \
+ \
 /* FIXME: B2K/C3600 workaround is always use old method... */ \
        /* if (!LBA_TR4PLUS(d) && !LBA_SKIP_PROBE(d)) */ { \
                /* original - Generate config cycle on broken elroy \
@@ -611,6 +633,11 @@ static int lba_cfg_write##size (struct p
        } \
  \
        DBG_CFG("%s(%s+%2x) = 0x%x (c)\n", __FUNCTION__, dev->slot_name,
pos, data); \
+       if (is_pdc_pat()) { \
+               tok = LBA_CFG_TOK(dev->bus->number,dev->devfn); \
+               PAT_CFG_WRITE((tok | pos ), sizeof(u##size), (u##size
*)&data); \
+               return 0; \
+       } \
        /* Basic Algorithm */ \
        LBA_CFG_TR4_ADDR_SETUP(d, tok | pos); \
        WRITE_REG##size(data, d->hba.base_addr + LBA_PCI_CFG_DATA + (pos
& mask)); \
-------------------------------------END---------------------------------------------------------------

------------------------------------START-------------------------------------------------------------

--- firmware.c.1.47      Fri Jan 23 16:57:51 2004
+++ firmware.c.modified   Tue Jan 27 12:32:43 2004
@@ -1035,6 +1035,46 @@ int pdc_pat_pd_get_addr_map(unsigned lon

        return retval;
 }
+
+/**
+ * pdc_pat_io_pci_cfg_read - Read PCI configuration space.
+ * @pci_addr: PCI configuration space address for which the read
request is being made.
+ * @pci_size: Size of read in bytes. Valid values are 1, 2, and 4.
+ * @mem_addr: Pointer to return memory buffer.
+ *
+ */
+int pdc_pat_io_pci_cfg_read(unsigned long pci_addr, int pci_size, void
*mem_addr)
+{
+       int retval;
+       spin_lock_irq(&pdc_lock);
+       retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_PCI_CONFIG_READ,
__pa(pdc_result),
+                             pci_addr, pci_size);
+       memcpy((char *)mem_addr, (char *) ((char *)pdc_result +
(sizeof(unsigned long) - pci_size))
, pci_size);
+       spin_unlock_irq(&pdc_lock);
+
+       return retval;
+}
+
+/**
+ * pdc_pat_io_pci_cfg_write - Retrieve information about memory address
ranges.
+ * @pci_addr: PCI configuration space address for which the write
request is being made.
+ * @pci_size: Size of write in bytes. Valid values are 1, 2, and 4.
+ * @value: Pointer to 1, 2, or 4 byte value in low order end of
argument to be
+ *         written to PCI Config space.
+ *
+ */
+int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, void
*value)
+{
+       int retval;
+       unsigned long *val_ptr;
+       spin_lock_irq(&pdc_lock);
+       memcpy((char *)((char *)val_ptr + (sizeof(unsigned long) -
pci_size)), (char *)value, pci_si
ze);
+       retval = mem_pdc_call(PDC_PAT_IO, PDC_PAT_IO_PCI_CONFIG_WRITE,
pci_addr,
+                             pci_size, *val_ptr);
+       spin_unlock_irq(&pdc_lock);
+
+       return retval;
+}
 #endif /* __LP64__ */
-------------------------------------END---------------------------------------------------------------

------------------------------------START-------------------------------------------------------------

--- pdc.h.1.48   Fri Jan 23 16:57:52 2004
+++ pdc.h.modified        Fri Jan 23 12:21:46 2004
@@ -972,6 +972,8 @@ int pdc_pat_get_irt_size(unsigned long *
 int pdc_pat_get_irt(void *r_addr, unsigned long cell_num);
 int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr,
                            unsigned long count, unsigned long offset);
+int pdc_pat_io_pci_cfg_read(unsigned long pci_addr, int pci_size, void
*mem_addr);
+int pdc_pat_io_pci_cfg_write(unsigned long pci_addr, int pci_size, void
*value);

 /******************************************************************** *

 *PDC_PAT_CELL[Return Cell Module] memaddr[0] conf_base_addr
-------------------------------------END---------------------------------------------------------------

A couple of questions:
1. In the definition of 'pdc_pat_io_pci_cfg_read( )' and
'pdc_pat_io_pci_cfg_write( )' above, can I  use 'cpu_to_le64( )' kind of
function instead of ordering the bytes manually in the 'memcpy( )'?
2. Can these changes be propagated to 2.6 also?

Thanks,
Naresh.

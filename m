Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1DC7482B
	for <parisc-linux@parisc-linux.org>; Sun,  8 Jul 2001 17:44:03 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15JODa-0007R2-00
	for parisc-linux@parisc-linux.org; Mon, 09 Jul 2001 00:44:02 +0100
Date: Mon, 9 Jul 2001 00:44:02 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010709004402.Q6103@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] I think WAX is broken
List-ID: <linux-parisc.vger.kernel.org>

Lamont just reported:

<lamont_work> Wax EISA: Ack, cannot read from 0xff48
<lamont_work> Wax EISA: Ack, cannot write to 0xff48
<lamont_work> Wax EISA: Ack, cannot read from 0xff48

so I took a look.

#define WAX_EISA_OUT(type, size) \
static void wax_out##type (struct pci_hba_data *hba, u16 addr, u##size d) \
{ \
	u32 out_addr; \
	if (((addr >= 0x00080000) && (addr < 0x00100000)) || \
		((addr >= 0x00500000) && (addr < 0x03C00000))) { \
		out_addr = 0xfc000000 + ((addr & 0xfc00) >> 6) + \
			((addr & 0x03f8) << 9) + (addr & 0x0007) ; \
		gsc_write##type(d,out_addr); \
	} else { \
		printk(KERN_ERR "Wax EISA: Ack, cannot write to 0x%x\n",addr); \
	} \
} 

`addr' is a u16.  it can't possibly be >= 0x00080000 or >= 0x00500000.
in <asm-parisc/pci.h>:

/* 
** We support 2^16 I/O ports per HBA.  These are set up in the form
** 0xbbxxxx, where bb is the bus number and xxxx is the I/O port
** space address.
*/
#define HBA_PORT_SPACE_BITS	16

#define HBA_PORT_BASE(h)	((h) << HBA_PORT_SPACE_BITS)
#define HBA_PORT_SPACE_SIZE	(1UL << HBA_PORT_SPACE_BITS)

#define PCI_PORT_HBA(a)		((a) >> HBA_PORT_SPACE_BITS)
#define PCI_PORT_ADDR(a)	((a) & (HBA_PORT_SPACE_SIZE - 1))

struct pci_port_ops {
	  u8 (*inb)  (struct pci_hba_data *hba, u16 port);
	 u16 (*inw)  (struct pci_hba_data *hba, u16 port);
	 u32 (*inl)  (struct pci_hba_data *hba, u16 port);
	void (*outb) (struct pci_hba_data *hba, u16 port,  u8 data);
	void (*outw) (struct pci_hba_data *hba, u16 port, u16 data);
	void (*outl) (struct pci_hba_data *hba, u16 port, u32 data);
};

Then in arch/parisc/kernel/pci.c, we have the wonderfully obscured:

#define PCI_PORT_OUT(type, size) \
void out##type (u##size d, int addr) \
{ \
	int b = PCI_PORT_HBA(addr); \
	ASSERT(pci_port); \
	pci_port->out##type(parisc_pci_hba[b], PCI_PORT_ADDR(addr), d); \
}

PCI_PORT_OUT(b,  8)
PCI_PORT_OUT(w, 16)
PCI_PORT_OUT(l, 32)

So I _think_ the right fix is to change WAX_EISA_OUT to:

#define WAX_EISA_OUT(type, size) \
static void wax_out##type (struct pci_hba_data *hba, u16 addr, u##size d) \
{ \
	u32 out_addr = 0xfc000000 + ((addr & 0xfc00) >> 6) + \
			((addr & 0x03f8) << 9) + (addr & 0x0007) ; \
	gsc_write##type(d,out_addr); \
} 

(and WAX_EISA_IN has the same issue, of course).

Comments?

-- 
Revolutions do not require corporate support.

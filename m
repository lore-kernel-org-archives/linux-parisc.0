Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id B827A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 15:38:50 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 8 Jun 2001 23:37:31 +0200
MIME-Version: 1.0
Message-Id: <20010608213850.B827A482A@dsl2.external.hp.com>
Subject: [parisc-linux] memcpy_fromio() seems partially broken [with patch]
List-ID: <linux-parisc.vger.kernel.org>

Hi,

while I was playing with a few network-cards in the c3k I found a strange 
behaviour when copying unaligned data with memcpy_fromio() off the PCI bus.

Background: 
I wanted to copy data off the network-card (HP J2585A) from an 4-byte aligned 
PCI address to an 2-byte aligned (b/c of skb_reserve(skb, 2)) memory-address 
with memcpy_fromio().
The current code in CVS for memcpy_fromio() copied byteswapped and/or 
completely wrong data for all copied values, while the following 
memcpy_fromio() worked without problems:

/* Copies a block of memory from a device in an efficient manner.
 * Assumes the device can cope with 32-bit transfers.  If it can't,
 * don't use this function.
 */
void memcpy_fromio(const void *dest, unsigned long src, int count)
{
        u32 value;
        if (((unsigned long)dest & 3) != (src & 3))
                goto wordcopy;
        while (src & 3) {
                *(char *)dest = readb(src++);
                ((char *)dest)++;
                count--;
        }
        while (count > 3) {
                *(u32 *)dest = readl(src);
                dest += 4;
                src += 4;
                count -= 4;
        }
        if (!count)
                return;
 wordcopy:
        if (src & 3)
                goto bytecopy;
 wordcopy_loop:
        value = readl(src);
        *((char*)dest) = (char) (value >> 24);  dest++;
        if (--count == 0) return;
        *((char*)dest) = (char) (value >> 16);  dest++;
        if (--count == 0) return;
        *((char*)dest) = (char) (value >> 8);   dest++;
        if (--count == 0) return;
        *((char*)dest) = (char) (value);  dest++;
        if (count) goto wordcopy_loop;
        return;
 
 bytecopy:
        while (count--) {
                *(char *)dest = readb(src++);
                ((char *)dest)++;
        }
}

The previous version copied all data with readb() while this implementation 
tries to access the (pci-)bus most of the time with readl()s. 
I know, this is not the best or cleanest implementation, but I think we need 
to change memcpy_fromio() in such a manner.

What is your thought about it, or any ideas why the previous version sucked ?

Greetings,
Helge

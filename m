Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57FEB485C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 22:40:49 -0700 (MST)
Received: from hpindda.cup.hp.com (hpindda.cup.hp.com [15.13.95.92])
	by palrel12.hp.com (Postfix) with ESMTP id 88DBC60030F
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 21:40:48 -0800 (PST)
Received: from cup.hp.com (maverick.cup.hp.com [15.13.105.84])
	by hpindda.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with ESMTP id VAA03844
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 21:40:43 -0800 (PST)
Message-ID: <3C96CF57.CA169520@cup.hp.com>
Date: Mon, 18 Mar 2002 21:40:39 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
References: <1016088869.3c904925683bb@webmail.tiscali.be> <3C924032.6E5BB55D@cup.hp.com> <20020315190021.Z30538@parcelfarce.linux.theplanet.co.uk> <3C92E60D.E9D9A8ED@cup.hp.com> <20020316132221.A2179@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Call to IODC hangs.!!!!
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>


I am using the following code to write a page to the swap space
using the iodc calls.

The IODC call for writing a boot device in blocks is
ENTRY_IO  with a subfunction BOOT_BLK_DEV_WRITE  = 17.

The call never returns.
Is there anythin I need to do more...


-------------------------------PARTITION TABLE Start -----------------
This is the partition of my disk.

Disk /dev/sda: 67 heads, 62 sectors, 1009 cylinders
Units = sectors of 1 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1            62     33231     16585   f0  Linux/PA-RISC boot
/dev/sda2         33232    531711    249240   82  Linux swap
/dev/sda3        531712   1030191    249240   83  Linux
/dev/sda4       1030192   4191385   1580597   83  Linux
-------------------------------------------PARTITION TABLE End-----------------

-------------------------CALL to Firmware.c-----------------------------
I am calling a pdc_iodc_bootout() as below.

err = pdc_iodc_bootout((unsigned long)17014784, dump_page_buf,
                                1, &count);

17014784  is the start of the swap space.
                     I got this number by doing this.
Start sector of the swap partition * 512
33232 * 512 = 17014784


-------------------------------------------------------------END calling
-------------


---------------------------------------Call to
IODC------------------------------
This is the call to IODC

int
pdc_iodc_bootout(unsigned devaddr, char *memaddr, unsigned size,
                 unsigned *count)
{
    int r;

    static int __attribute__((aligned(8)))   iodc_retbuf[32];
    static char __attribute__((aligned(64))) iodc_dbuf[4096];
    memcpy(iodc_dbuf, memaddr, size);

    if(!(PAGE0->mem_boot.iodc_io)) {
        return -1;
    }

    r = real32_call(PAGE0->mem_boot.iodc_io,
                    (unsigned long)PAGE0->mem_boot.hpa,
ENTRY_IO_BLK_BOOTOUT,
                    PAGE0->mem_boot.spa, __pa(PAGE0->mem_boot.dp.layers),
                    __pa(iodc_retbuf), devaddr, __pa(iodc_dbuf), size,
size);
    memcpy(count, iodc_retbuf, sizeof(*count));

    if (r == 3) /* EOF */
    {
        printk("pdc_iodc_bootin:EOF\n");
        return 0;                       /* count = 0 at EOF */
    }
    else if (r >= 0)
    {
        convert_to_wide(pdc_result);
        return pdc_result[0];           /* count */
    }
    return r;                           /* r < 0; error */
}

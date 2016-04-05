From: Mikulas Patocka <mpatocka@redhat.com>
Subject: kernel 4.6-rc unbootable due to module changes
Date: Tue, 5 Apr 2016 13:31:08 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

The patch "parisc: Use generic extable search and sort routines" makes the 
kernel unable to load any modules. It fails with:

module unix: Unknown relocation: 9
modprobe: FATAL: Error inserting unix (/lib/modules/4.6.0-rc2/kernel/net/unix/unix.ko): Invalid module format

When I revert the patch, the kernel 4.6-rc2 boots fine.

Apparently, the function apply_relocate_add in arch/parisc/kernel/module.c 
doesn't handle the new relocation type.

Mikulas

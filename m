Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 478EC482A
	for <parisc-linux@parisc-linux.org>; Wed, 12 Feb 2003 10:17:36 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18j0Vr-0003i0-00
	for parisc-linux@parisc-linux.org; Wed, 12 Feb 2003 17:17:35 +0000
Date: Wed, 12 Feb 2003 17:17:35 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030212171735.W5992@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] local symbols appearing in objdump/nm output
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

nm and objdump both output local symbols from vmlinux.  this doesn't
happen on x86 (how about other architectures?)  let me give an example:

101a2700 T ext2_get_group_desc
101a27b8 T ext2_free_blocks
101a2824 t .L773
101a28ec t .L873
101a2970 t .L887
101a2b48 t .L844
101a2bd8 t .L888
101a2be0 t grab_block

on x86, that is:

c018b950 T ext2_get_group_desc
c018ba20 t read_block_bitmap
c018bac0 T ext2_free_blocks
c018be10 t grab_block

i have insufficient toolchain-fu to figure out what's going on and
what needs to be fixed, but these local symbols make CONFIG_KALLSYMS
basically useless.  Let me show you:

Kernel addresses on the stack:                                                  
 [<10127b8c>] .L1041+0x64/0xa8                                                  
 [<10105f6c>] show_trace+0x8c/0xc0                                              
 [<10127a30>] .L1018+0x0/0x38                                                   
 [<10105df0>] dump_stack+0x10/0x1c                                              
 [<101588e4>] __find_get_block+0x50/0x84                                        
 [<101589d0>] __getblk+0x20/0x30                                                
 [<10158a08>] .L1623+0xc/0x18                                                   
 [<101a605c>] ext2_get_branch+0x70/0x13c                                        
 [<101a6528>] ext2_get_block+0x88/0x408                                         
 [<1023b8bc>] .L1006+0x10/0x34                                                  
 [<10176a14>] .L1121+0x84/0xb0                                                  
 [<101393f4>] .L1477+0x44/0x74                                                  
 [<10176e38>] .L1155+0x8/0x34                                                   
 [<1013da40>] .L1106+0x34/0x74                                                  
 [<1013fbe8>] read_pages+0x58/0xe4                                              

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

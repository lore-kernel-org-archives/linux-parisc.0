Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 6 Aug 2003 08:32:19 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030806143219.GC30797@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] kernel BUG at include/linux/skbuff.h:834!
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

When I included a 4th a500 ("ios") into my distcc cluster, I didn't think
much of it running 2.6.0-test1 (IIRC). System panic'd near the end
of a kernel build. Output and stack "contents" appended.
NIC which was under load was tg3 .

grant


kernel BUG at include/linux/skbuff.h:834!
Kernel addresses on the stack:
 [<00000000103065e4>]  [<00000000000c49c0>]  [<0000000010306aa0>]  [<00000000101445c4>] 
 [<0000000010248e4c>]  [<000000001019d900>]  [<00000000101115f0>]  [<000000001010a074>] 
 [<00000000101893b8>]  [<000000001018a218>]  [<000000001019d900>]  [<00000000101115f0>] 
 [<0000000010161888>]  [<000000001032b644>]  [<000000001032bfd4>]  [<0000000010161d50>] 
 [<0000000010354cc0>]  [<00000000101cd1dc>]  [<0000000010184a34>]  [<0000000010184b74>] 
 [<000000001019d900>]  [<0000000010184cfc>]  [<000000001010ae4c>]  [<000000001010a074>] 

kernel BUG at include/linux/skbuff.h:870!
Kernel addresses on the stack:
 [<00000000103065e4>]  [<00000000000c49c0>]  [<0000000010306aa0>]  [<00000000101445c4>] 
 [<0000000010248e4c>]  [<000000001019d900>]  [<00000000101115f0>]  [<000000001010a074>] 
 [<00000000101893b8>]  [<000000001018a218>]  [<000000001019d900>]  [<00000000101115f0>] 
 [<0000000010161888>]  [<000000001032b644>]  [<000000001032bfd4>]  [<0000000010161d50>] 
 [<0000000010354cc0>]  [<00000000101cd1dc>]  [<0000000010184a34>]  [<0000000010184b74>] 
 [<000000001019d900>]  [<0000000010184cfc>]  [<000000001010ae4c>]  [<000000001010a074>] 



0x103065e4 netif_receive_skb+16c
0xc49c0 _DYNAMIC+c49c0
0x10306aa0 net_rx_action+148
0x101445c4 do_softirq+cc
0x10248e4c iosapic_interrupt+4c
0x1019d900 locate_fd+100
0x101115f0 pdc_pat_chassis_send_log+78
0x1010a074 intr_return+0
0x101893b8 unmap_underlying_metadata+20
0x1018a218 __block_prepare_write+5a0
0x1019d900 locate_fd+100
0x101115f0 pdc_pat_chassis_send_log+78
0x10161888 generic_file_aio_write_nolock+820
0x1032b644 cleanup_rbuf+bc
0x1032bfd4 tcp_recvmsg+374
0x10161d50 generic_file_aio_write+c0
0x10354cc0 inet_recvmsg+58
0x101cd1dc ext3_file_write+34
0x10184a34 do_sync_write+84
0x10184b74 vfs_write+fc
0x1019d900 locate_fd+100
0x10184cfc sys_write+64
0x1010ae4c syscall_exit+0
0x1010a074 intr_return+0

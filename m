Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19BD6482E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Aug 2003 08:57:02 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19kPim-0007Zb-KD; Wed, 06 Aug 2003 15:57:00 +0100
Date: Wed, 6 Aug 2003 15:57:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel BUG at include/linux/skbuff.h:834!
Message-ID: <20030806145700.GU22222@parcelfarce.linux.theplanet.co.uk>
References: <20030806143219.GC30797@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030806143219.GC30797@dsl2.external.hp.com>
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

On Wed, Aug 06, 2003 at 08:32:19AM -0600, Grant Grundler wrote:
> When I included a 4th a500 ("ios") into my distcc cluster, I didn't think
> much of it running 2.6.0-test1 (IIRC). System panic'd near the end
> of a kernel build. Output and stack "contents" appended.
> NIC which was under load was tg3 .

"I don't believe you" ;-)

> kernel BUG at include/linux/skbuff.h:834!
> Kernel addresses on the stack:
>  [<00000000103065e4>]  [<00000000000c49c0>]  [<0000000010306aa0>]  [<00000000101445c4>] 
>  [<0000000010248e4c>]  [<000000001019d900>]  [<00000000101115f0>]  [<000000001010a074>] 
>  [<00000000101893b8>]  [<000000001018a218>]  [<000000001019d900>]  [<00000000101115f0>] 
>  [<0000000010161888>]  [<000000001032b644>]  [<000000001032bfd4>]  [<0000000010161d50>] 
>  [<0000000010354cc0>]  [<00000000101cd1dc>]  [<0000000010184a34>]  [<0000000010184b74>] 
>  [<000000001019d900>]  [<0000000010184cfc>]  [<000000001010ae4c>]  [<000000001010a074>] 

^^^^^ these addresses

> kernel BUG at include/linux/skbuff.h:870!
> Kernel addresses on the stack:
>  [<00000000103065e4>]  [<00000000000c49c0>]  [<0000000010306aa0>]  [<00000000101445c4>] 
>  [<0000000010248e4c>]  [<000000001019d900>]  [<00000000101115f0>]  [<000000001010a074>] 
>  [<00000000101893b8>]  [<000000001018a218>]  [<000000001019d900>]  [<00000000101115f0>] 
>  [<0000000010161888>]  [<000000001032b644>]  [<000000001032bfd4>]  [<0000000010161d50>] 
>  [<0000000010354cc0>]  [<00000000101cd1dc>]  [<0000000010184a34>]  [<0000000010184b74>] 
>  [<000000001019d900>]  [<0000000010184cfc>]  [<000000001010ae4c>]  [<000000001010a074>] 

^^^^^ are the same as these addresses

The first BUG is in skb_put() and the second BUG is in skb_pull().  Neither
are called from netif_receive_skb(), nor net_rx_action().  

> 0x103065e4 netif_receive_skb+16c
> 0xc49c0 _DYNAMIC+c49c0
> 0x10306aa0 net_rx_action+148
> 0x101445c4 do_softirq+cc
> 0x10248e4c iosapic_interrupt+4c
> 0x1019d900 locate_fd+100
> 0x101115f0 pdc_pat_chassis_send_log+78
> 0x1010a074 intr_return+0
> 0x101893b8 unmap_underlying_metadata+20
> 0x1018a218 __block_prepare_write+5a0
> 0x1019d900 locate_fd+100
> 0x101115f0 pdc_pat_chassis_send_log+78
> 0x10161888 generic_file_aio_write_nolock+820
> 0x1032b644 cleanup_rbuf+bc
> 0x1032bfd4 tcp_recvmsg+374
> 0x10161d50 generic_file_aio_write+c0
> 0x10354cc0 inet_recvmsg+58
> 0x101cd1dc ext3_file_write+34
> 0x10184a34 do_sync_write+84
> 0x10184b74 vfs_write+fc
> 0x1019d900 locate_fd+100
> 0x10184cfc sys_write+64
> 0x1010ae4c syscall_exit+0
> 0x1010a074 intr_return+0

So none of these addresses make any sense ;-(

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

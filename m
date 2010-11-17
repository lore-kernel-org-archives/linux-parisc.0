From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 16 Nov 2010 21:21:41 -0500
Message-ID: <20101117022140.GA2110@hiauly1.hia.nrc.ca>
References: <20101104153507.GA7198@lackof.org> <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca> <20101110033527.GA24762@hiauly1.hia.nrc.ca> <20101114234212.GA20422@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101114234212.GA20422@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 14 Nov 2010, John David Anglin wrote:

> kernel BUG at arch/parisc/kernel/unaligned.c:215!
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001000000000000001111 Not tainted
> r00-03  000000000804000f 000000007ef35920 0000000040119780 000000007ef35c70
> r04-07  000000001c533000 000000007ef355e0 000000007ef355e0 000000007ef35434
> r08-11  000000007ef3542c 000000007d216cf8 000000007cfe13a8 00000000000000e8
> r12-15  000000007cfe12c0 0000000000000000 0000000000000001 00000000b41aa62a
> r16-19  000000007ef355e0 000000004059faa0 000000007f88e048 000000000c000000
> r20-23  0000000024000000 000000007ef3542c 0000000000000000 0000000000000006
> r24-27  000000007ef3541c 0000000000000001 000000000f3010f3 00000000405e9db0
> r28-31  0000000000000000 000000007ef35c40 000000007ef35e90 000000000c0010c0
> sr00-03  000000000000d800 000000000000d800 0000000000000000 000000000000d800
> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401219b8 00000000401219bc
>  IIR: 03ffe01f    ISR: 0000000000000000  IOR: 0000000000000000
>  CPU:        0   CR30: 000000007ef34000 CR31: 886904b488140042
>  ORIG_R28: 0000000000000000
>  IAOQ[0]: .L320+0x3c/0x70
>  IAOQ[1]: .L320+0x40/0x70
>  RP(r2): handle_interruption+0x2a8/0x940
> Backtrace:
>  [<0000000040119780>] handle_interruption+0x2a8/0x940
>  [<000000001c57b460>] __tcp_v6_send_check+0xf0/0x1e8 [ipv6]
>  [<000000001c57cd10>] tcp_v6_send_response+0x238/0x368 [ipv6]
>  [<000000001c57cebc>] tcp_v6_send_reset+0x7c/0x218 [ipv6]
>  [<000000001c57e4b8>] tcp_v6_rcv+0x3e8/0x980 [ipv6]
>  [<000000001c54b0d0>] ip6_input_finish+0x188/0x438 [ipv6]
>  [<000000001c54b40c>] ip6_input+0x8c/0x148 [ipv6]
>  [<000000001c54bc78>] ipv6_rcv+0x3a8/0x480 [ipv6]
>  [<0000000040342454>] __netif_receive_skb+0x3dc/0x4a0
>  [<00000000403425c4>] process_backlog+0xac/0x188
>  [<0000000040342a70>] net_rx_action+0x178/0x228
>  [<000000004014d698>] __do_softirq+0x100/0x1f0
>  [<0000000040115a1c>] do_softirq+0x6c/0x70
>  [<000000004014db08>] local_bh_enable+0xc0/0xc8
>  [<00000000403442c8>] dev_queue_xmit+0x138/0x458
>  [<000000004034fc14>] neigh_resolve_output+0x154/0x310

This ldd alignment error is not fixed using 4.4.5, so it is likely a
kernel bug.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

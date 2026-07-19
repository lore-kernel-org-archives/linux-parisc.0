Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C9918A6DB
	for <linux-parisc@vger.kernel.org>; Sun, 19 Jul 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784477919; cv=none; b=exzW4np7ZsHKcLhtPMuF0+WM7ASbitckEKWLgf+I6MiLKFBEJc+HPZ9Mh3s21BWS6id8NV884or7vFsvG1ktRqsunTdtPIiE+GxwgSwioLyVgfa7EWB+qXIN92pYgEeK9lxZiSitNd7ZUbZaQiLEeTolZrrSpJv74xRClFgBuJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784477919; c=relaxed/simple;
	bh=xJG7SC9kLUI2SzM/uh7qJzr3vZ8F49kNMOMaXayHEJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RB7HOQDUEtt335y3B3Msd+l7/5Ywlw8aHtZgsu2/ppn6ivNDkjLnOiZ7jiC7BnHPjRcXw/jE4Jg9ERJxchmPdTetavkESsAd0gtgqn88Lw2PrMNVUtQoOBkrJ1UxBWLC2dznNtVjNd1XsQh7k9eONoy5fWH7Vpo3ExIRFjI11A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=t2uBPoRW; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="t2uBPoRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784477913; x=1785082713; i=deller@gmx.de;
	bh=5GEasaCl3qftAfbkJOCqpLYjOCmIOh0MDoKiE+pTBn8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=t2uBPoRW6ohG3d1fTswoE58AY7roiOz5D0MBS9cRkttwd+e5iARBqLgvUyjnX64W
	 mmTl8gftmB3w8wogNGx4awdRI79BtWoZ+5/6keSIU9bs5eMnyMQsKy1MjI4aq9GGc
	 eCJV/vy3chzns2ldLHcKRxG60gffHcCZESsz3US7UAoU5rmyGRN2DUt53yi2Ach40
	 n4Mpr324MN0ZKSIlsvceGDHAXC2ZJbZHH6EceOntf/BXXQ/1cbnXsPQj4fZiTXc/N
	 yJt5hwgZL2Lf5axaVJSC35S73LNz3TkQNZQAtfJSz/4TPsavNiexPxLRh6D9rNTx8
	 tt4jmOr3VsMOyMLBgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Nv-1xGPBh3lez-00jFcg; Sun, 19
 Jul 2026 18:18:32 +0200
Message-ID: <cca5a099-a406-484b-88d2-17281826748b@gmx.de>
Date: Sun, 19 Jul 2026 18:18:31 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Crash building vtk9 9.6.2+dfsg1-2 on mx3210
To: John David Anglin <dave.anglin@bell.net>,
 linux-parisc <linux-parisc@vger.kernel.org>
References: <6f678534-19ab-427a-916e-61145f359fd4@bell.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <6f678534-19ab-427a-916e-61145f359fd4@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WgnRV1z1gFyp4anWaEd9E6+kBgng3Yv4RdS1V1wqTeRKoNTJnLD
 tm6t2RswG8WCEjXlQPR4g63vrzQ8zFsG8FGJgvPM0N3xIateZz2QyTHuMFw5DtTGJCh8scm
 wVcurBECZ/Ft7LfmWRSOW2iItB7/gnQX/j3LzuSOWtOfaLKoxUX8D8+KsByQyJRpl8UsHr4
 Xsv8o/pns0l9OK0wf/0rA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zjckIv6m31I=;TmNt+/y6wyfhLJCr8W0Hk6SMwuQ
 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

On 7/19/26 14:50, John David Anglin wrote:
> FWIW:
>=20
> mx3210 login: [475406.368656] Kernel panic - not syncing: corrupted stac=
k end detected inside scheduler
> [475406.368804] CPU: 2 UID: 0 PID: 10231 Comm: kworker/u32:1 Not tainted=
 7.1.3+deb14-parisc64 #1 VOLUNTARY  Debian 7.1.3-1
> [475406.369172] Hardware name: 9000/800/rp3440
> [475406.375748] Workqueue: writeback wb_workfn (flush-8:0)
> [475406.375748] Backtrace:
> [475406.375748]  [<0000000040329614>] show_stack+0x88/0xc0
> [475406.379764]  [<000000004031ca70>] dump_stack_lvl+0x120/0x188
> [475406.379764]  [<000000004031cb0c>] dump_stack+0x34/0x48
> [475406.383759]  [<0000000040302278>] vpanic+0x22c/0x640
> [475406.383759]  [<00000000403026e4>] panic+0x58/0x78
> [475406.389759]  [<00000000415ab598>] __schedule+0x11f0/0x1214
> [475406.389759]  [<00000000415ab614>] schedule+0x58/0x1b0
> [475406.391764]  [<00000000415ab84c>] io_schedule+0x80/0xc8
> [475406.391764]  [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
> [475406.399759]  [<0000000040cabfac>] wbt_wait+0xf8/0x178
> [475406.399759]  [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
> [475406.403753]  [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xdc8
> [475406.407752]  [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
> [475406.407752]  [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0x24c/0x=
468
> [475406.415768]  [<0000000040c3fc44>] submit_bio_noacct+0x188/0x970
> [475406.415768]  [<0000000040c40514>] submit_bio+0xe8/0x1c8
> [475406.419765]  [<00000000408344d0>] __swap_writepage+0x2ac/0x7b8
> [475406.423747]  [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
> [475406.423747]  [<0000000040760bec>] shrink_folio_list+0x17a0/0x1cb0
> [475406.431756]  [<0000000040761430>] evict_folios+0x334/0xc40
> [475406.431756]  [<000000004076412c>] try_to_shrink_lruvec+0x208/0x458
> [475406.435752]  [<0000000040764448>] shrink_one+0xcc/0x2b0
> [475406.435752]  [<00000000407692d8>] shrink_node+0xe6c/0x15b8
> [475406.439749]  [<000000004076b520>] do_try_to_free_pages+0x154/0x8d8
> [475406.444017]  [<000000004076bdbc>] try_to_free_pages+0x118/0x400
> [475406.444017]  [<000000004080d68c>] __alloc_pages_slowpath.constprop.0=
+0xbbc/0x1b64
> [475406.447748]  [<000000004080e81c>] __alloc_frozen_pages_noprof+0x1e8/=
0x4a8
> [475406.455746]  [<000000004080ed10>] get_free_pages_noprof+0x3c/0x158
> [475406.455746]  [<000000001cced740>] jbd2_alloc+0xe4/0x148 [jbd2]
> [475406.547746] Backtrace:
> [475406.547746]  [<000000004033f000>] unwind_once+0x30/0x78
> [475406.547746]  [<0000000040300a1c>] do_show_stack+0x100/0x188
> [475406.547746]  [<0000000040329614>] show_stack+0x88/0xc0
> [475406.547746]  [<000000004031ca70>] dump_stack_lvl+0x120/0x188
> [475406.555747]  [<000000004031cb0c>] dump_stack+0x34/0x48
> [475406.555747]  [<0000000040302278>] vpanic+0x22c/0x640
> [475406.559743]  [<00000000403026e4>] panic+0x58/0x78
> [475406.559743]  [<00000000415ab598>] 	+0x11f0/0x1214
> [475406.563749]  [<00000000415ab614>] schedule+0x58/0x1b0
> [475406.563749]  [<00000000415ab84c>] io_schedule+0x80/0xc8
> [475406.567783]  [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
> [475406.567783]  [<0000000040cabfac>] wbt_wait+0xf8/0x178
> [475406.575742]  [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
> [475406.575742]  [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xdc8
> [475406.579743]  [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
> [475406.579743]  [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0x24c/0x=
468
> [475406.583743]  [<0000000040c3fc44>] submit_bio_noacct+0x188/0x970
> [475406.587743]  [<0000000040c40514>] submit_bio+0xe8/0x1c8
> [475406.587743]  [<00000000408344d0>] __swap_writepage+0x2ac/0x7b8
> [475406.595743]  [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
> [475406.595743]  [<0000000040760bec>] shrink_folio_list+0x17a0/0x1cb0
> [475406.603742]  [<0000000040761430>] evict_folios+0x334/0xc40
> [475406.603742]  [<000000004076412c>] try_to_shrink_lruvec+0x208/0x458
> [475406.607743]  [<0000000040764448>] shrink_one+0xcc/0x2b0
> [475406.611744]  [<00000000407692d8>] shrink_node+0xe6c/0x15b8
> [475406.611744]  [<000000004076b520>] do_try_to_free_pages+0x154/0x8d8
> [475406.615742]  [<000000004076bdbc>] try_to_free_pages+0x118/0x400
> [475406.615742]  [<000000004080d68c>] __alloc_pages_slowpath.constprop.0=
+0xbbc/0x1b64
> [475406.619743]  [<000000004080e81c>] __alloc_frozen_pages_noprof+0x1e8/=
0x4a8
> [475406.627743]  [<000000004080ed10>] get_free_pages_noprof+0x3c/0x158
> [475406.627743]
> [475406.627743]
> [475406.627743] Kernel Fault: Code=3D15 (Data TLB miss fault) at addr 00=
0000001e91e6c0
> [475406.631743] CPU: 2 UID: 0 PID: 10231 Comm: kworker/u32:1 Not tainted=
 7.1.3+deb14-parisc64 #1 VOLUNTARY  Debian 7.1.3-1
> [475406.635742] Hardware name: 9000/800/rp3440
> [475406.643749] Workqueue: writeback wb_workfn (flush-8:0)
> [475406.643749]
> [475406.643749]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> [475406.647745] PSW: 00001000000001001111111100001110 Not tainted
> [475406.647745] r00-03  000000ff0804ff0e 0000000041645e80 000000004033e4=
44 00000000536939f0
> [475406.655743] r04-07  0000000041642e80 00000000536937c8 00000000536937=
c8 0000000041c2ee68
> [475406.659743] r08-11  000000001cced740 000000000800000e 000000004ca856=
80 00000000415f18a0
> [475406.659743] r12-15  0000000040236340 0000000002c52000 000000004167de=
80 000000004a8175c8
> [475406.663743] r16-19  000000004167de80 0000000041c1dfc0 0000000041c1e0=
b0 0000000000017c00
> [475406.667743] r20-23  000000000800000e 0000000000002f80 00000000080000=
0e 000000001e906ac0
> [475406.675742] r24-27  0000000053693ec8 3ffffffffffff57c 0000000041c2ee=
60 0000000041642e80
> [475406.675742] r28-31  00000000000017c0 0000000053693a80 0000000053693a=
b0 0000000000000000
> [475406.679743] sr00-03  0000000000d4c000 0000000000000000 0000000000000=
000 0000000000d4c000
> [475406.687743] sr04-07  0000000000000000 0000000000000000 0000000000000=
000 0000000000000000
> [475406.691743]
> [475406.691743] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040=
33e4b8 000000004033e4bc
> [475406.695744]  IIR: 0e770098    ISR: 0000000000000000  IOR: 000000001e=
91e6c0
> [475406.695744]  CPU:        2   CR30: 00000001d0b88000 CR31: ffffffffff=
ffffff
> [475406.703743]  ORIG_R28: 0000000041652e80
> [475406.703743]  IAOQ[0]: unwind_frame_regs+0xf0/0x5f0
> [475406.707743]  IAOQ[1]: unwind_frame_regs+0xf4/0x5f0
> [475406.707743]  RP(r2): unwind_frame_regs+0x7c/0x5f0
> [475406.711743] Backtrace:
> [475406.711743]  [<000000004033f000>] unwind_once+0x30/0x78
> [475406.711743]  [<0000000040300a1c>] do_show_stack+0x100/0x188
> [475406.715743]  [<0000000040329614>] show_stack+0x88/0xc0
> [475406.715743]  [<000000004031ca70>] dump_stack_lvl+0x120/0x188
> [475406.723742]  [<000000004031cb0c>] dump_stack+0x34/0x48
> [475406.723742]  [<0000000040302278>] vpanic+0x22c/0x640
> [475406.731742]  [<00000000403026e4>] panic+0x58/0x78
> [475406.731742]  [<00000000415ab598>] __schedule+0x11f0/0x1214
> [475406.735743]  [<00000000415ab614>] schedule+0x58/0x1b0
> [475406.735743]  [<00000000415ab84c>] io_schedule+0x80/0xc8
> [475406.739743]  [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
> [475406.739743]  [<0000000040cabfac>] wbt_wait+0xf8/0x178
> [475406.743745]  [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
> [475406.743745]  [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xdc8
> [475406.751742]  [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
> [475406.751742]  [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0x24c/0x=
468
> [475406.755743]  [<0000000040c3fc44>] submit_bio_noacct+0x188/0x970
> [475406.759743]  [<0000000040c40514>] submit_bio+0xe8/0x1c8
> [475406.759743]  [<00000000408344d0>] __swap_writepage+0x2ac/0x7b8
> [475406.763742]  [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
> [475406.763742]  [<0000000040760bec>] shrink_folio_list+0x17a0/0x1cb0
> [475406.771743]  [<0000000040761430>] evict_folios+0x334/0xc40
> [475406.771743]  [<000000004076412c>] try_to_shrink_lruvec+0x208/0x458
> [475406.779742]  [<0000000040764448>] shrink_one+0xcc/0x2b0
> [475406.783798]  [<00000000407692d8>] shrink_node+0xe6c/0x15b8
> [475406.783798]  [<000000004076b520>] do_try_to_free_pages+0x154/0x8d8
> [475406.787763]  [<000000004076bdbc>] try_to_free_pages+0x118/0x400
> [475406.787763]  [<000000004080d68c>] __alloc_pages_slowpath.constprop.0=
+0xbbc/0x1b64
> [475406.791742]  [<000000004080e81c>] __alloc_frozen_pages_noprof+0x1e8/=
0x4a8
> [475406.799742]  [<000000004080ed10>] get_free_pages_noprof+0x3c/0x158
> [475406.799742]
> [475406.799742] Kernel panic - not syncing: Kernel Fault
> [475406.803743] ---[ end Kernel panic - not syncing: Kernel Fault ]---
>=20
> I think it also happened on paladin.
Yes, it did.
Maybe we need to increase the stack size.

Helge

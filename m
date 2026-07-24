Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A9324716
	for <linux-parisc@vger.kernel.org>; Fri, 24 Jul 2026 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905077; cv=none; b=HzluOJgF4rT90tNBI6/HnMSLl0jAn8PLka7KHqWGnJ0Bffun49dU3BW5MErxMEHlQyipJAO6nnimEIXnvuf4eVj+EhutOjym5F1qOQOZKFrtIsRKm1S2adMJsWJJwLSJwLX8M1yBbpmh0OSjGHdphXlKNmpxzznCj7TAnU7fpsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905077; c=relaxed/simple;
	bh=gKRrCJPr9eI3/1MEGODAT6G02NgfbvAb+8RSYcbwXYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Cdkt/adUaNz5wBqLjM0VQUJCp65kUqR7YBZILiqcMUiXbCp2RbddizkYHEf2fViMemjwbxPv7gjBLYPJmW0YfR+UjVLw+tmrRGptIcOEvslH8cqeQ/5ZUt7BzG+B8/jX9Mt0TSNxizWdvHJ9iSi7p4YR1iXVSkTOiZuh6auEd2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ENn8ZliH; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ENn8ZliH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784905070; x=1785509870; i=deller@gmx.de;
	bh=IR1CTjcbGTKmpoQd+qOeP0dlrQya0q02TU2bj333NUA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ENn8ZliHfetoihhrAXODwwEvYVFzCAhHOaGcHlf6lT5tVYl5OkTEKDqmUDN9XIUK
	 FmkHgC2DXq8++u5N66hL6AezXUBU++MC8EX02s/ulei8VzHEdc65ORlzVtzqYZcBy
	 z/412Erof8BDWvPv5a1aInI4WjbgtaeAd6JAHKn0dT8sxKjKuIMkVxGDqVViZ/qW5
	 aaqSa/YeMsgJn7qhAonTGtjbf46/L132j59c0s2nd+B8GG1UQHKLj7ETZ/0Fp1hbo
	 SWvT5TU2FiJmMqms0lrQjIOMQe7e9cuUxci4yi42s5JEeKtMAQ58YYhyR94HsSmKs
	 Ppou8G0+GTrglU3j8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHGCu-1wipMT3OG8-009x6B; Fri, 24
 Jul 2026 16:57:49 +0200
Message-ID: <2cd65714-9da1-46bc-afab-31dd46f39efe@gmx.de>
Date: Fri, 24 Jul 2026 16:57:48 +0200
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
 <cca5a099-a406-484b-88d2-17281826748b@gmx.de>
 <ab61aaa9-d348-4f8a-b107-62c4dcf511d4@bell.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ab61aaa9-d348-4f8a-b107-62c4dcf511d4@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4u2j6BXgVrt0n1Q1I+AoUyzgEW326Z/PvrVy1XVSkdTfYV+IUOt
 pcV5vr2vhNaNkNzG/IAO8vOSz3onzpObtBjvQ1/ct60yUovQsaiLtGb14rfC0NXK4g+Q97L
 02Irh7rowtAbymv9jag/E4Db7JV4YOO6Dba3iBuR9Wf2cfdzVH6pQrNuErpUsdmOrhmnFyj
 O2MPNXb1NxVr3q1kI7XGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ilmuuHfVOpA=;eOKb/mADXnrAcPlTjA1FaZ5ayhb
 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

On 7/24/26 14:09, John David Anglin wrote:
> On 2026-07-19 12:18 p.m., Helge Deller wrote:
>> On 7/19/26 14:50, John David Anglin wrote:
>>> FWIW:
>>>
>>> mx3210 login: [475406.368656] Kernel panic - not syncing: corrupted st=
ack end detected inside scheduler
>>> [475406.368804] CPU: 2 UID: 0 PID: 10231 Comm: kworker/u32:1 Not taint=
ed 7.1.3+deb14-parisc64 #1 VOLUNTARY=C2=A0 Debian 7.1.3-1
>>> [475406.369172] Hardware name: 9000/800/rp3440
>>> [475406.375748] Workqueue: writeback wb_workfn (flush-8:0)
>>> [475406.375748] Backtrace:
>>> [475406.375748]=C2=A0 [<0000000040329614>] show_stack+0x88/0xc0
>>> [475406.379764]=C2=A0 [<000000004031ca70>] dump_stack_lvl+0x120/0x188
>>> [475406.379764]=C2=A0 [<000000004031cb0c>] dump_stack+0x34/0x48
>>> [475406.383759]=C2=A0 [<0000000040302278>] vpanic+0x22c/0x640
>>> [475406.383759]=C2=A0 [<00000000403026e4>] panic+0x58/0x78
>>> [475406.389759]=C2=A0 [<00000000415ab598>] __schedule+0x11f0/0x1214
>>> [475406.389759]=C2=A0 [<00000000415ab614>] schedule+0x58/0x1b0
>>> [475406.391764]=C2=A0 [<00000000415ab84c>] io_schedule+0x80/0xc8
>>> [475406.391764]=C2=A0 [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
>>> [475406.399759]=C2=A0 [<0000000040cabfac>] wbt_wait+0xf8/0x178
>>> [475406.399759]=C2=A0 [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
>>> [475406.403753]=C2=A0 [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xd=
c8
>>> [475406.407752]=C2=A0 [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
>>> [475406.407752]=C2=A0 [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0=
x24c/0x468
>>> [475406.415768]=C2=A0 [<0000000040c3fc44>] submit_bio_noacct+0x188/0x9=
70
>>> [475406.415768]=C2=A0 [<0000000040c40514>] submit_bio+0xe8/0x1c8
>>> [475406.419765]=C2=A0 [<00000000408344d0>] __swap_writepage+0x2ac/0x7b=
8
>>> [475406.423747]=C2=A0 [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
>>> [475406.423747]=C2=A0 [<0000000040760bec>] shrink_folio_list+0x17a0/0x=
1cb0
>>> [475406.431756]=C2=A0 [<0000000040761430>] evict_folios+0x334/0xc40
>>> [475406.431756]=C2=A0 [<000000004076412c>] try_to_shrink_lruvec+0x208/=
0x458
>>> [475406.435752]=C2=A0 [<0000000040764448>] shrink_one+0xcc/0x2b0
>>> [475406.435752]=C2=A0 [<00000000407692d8>] shrink_node+0xe6c/0x15b8
>>> [475406.439749]=C2=A0 [<000000004076b520>] do_try_to_free_pages+0x154/=
0x8d8
>>> [475406.444017]=C2=A0 [<000000004076bdbc>] try_to_free_pages+0x118/0x4=
00
>>> [475406.444017]=C2=A0 [<000000004080d68c>] __alloc_pages_slowpath.cons=
tprop.0+0xbbc/0x1b64
>>> [475406.447748]=C2=A0 [<000000004080e81c>] __alloc_frozen_pages_noprof=
+0x1e8/0x4a8
>>> [475406.455746]=C2=A0 [<000000004080ed10>] get_free_pages_noprof+0x3c/=
0x158
>>> [475406.455746]=C2=A0 [<000000001cced740>] jbd2_alloc+0xe4/0x148 [jbd2=
]
>>> [475406.547746] Backtrace:
>>> [475406.547746]=C2=A0 [<000000004033f000>] unwind_once+0x30/0x78
>>> [475406.547746]=C2=A0 [<0000000040300a1c>] do_show_stack+0x100/0x188
>>> [475406.547746]=C2=A0 [<0000000040329614>] show_stack+0x88/0xc0
>>> [475406.547746]=C2=A0 [<000000004031ca70>] dump_stack_lvl+0x120/0x188
>>> [475406.555747]=C2=A0 [<000000004031cb0c>] dump_stack+0x34/0x48
>>> [475406.555747]=C2=A0 [<0000000040302278>] vpanic+0x22c/0x640
>>> [475406.559743]=C2=A0 [<00000000403026e4>] panic+0x58/0x78
>>> [475406.559743]=C2=A0 [<00000000415ab598>]=C2=A0=C2=A0=C2=A0=C2=A0 +0x=
11f0/0x1214
>>> [475406.563749]=C2=A0 [<00000000415ab614>] schedule+0x58/0x1b0
>>> [475406.563749]=C2=A0 [<00000000415ab84c>] io_schedule+0x80/0xc8
>>> [475406.567783]=C2=A0 [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
>>> [475406.567783]=C2=A0 [<0000000040cabfac>] wbt_wait+0xf8/0x178
>>> [475406.575742]=C2=A0 [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
>>> [475406.575742]=C2=A0 [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xd=
c8
>>> [475406.579743]=C2=A0 [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
>>> [475406.579743]=C2=A0 [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0=
x24c/0x468
>>> [475406.583743]=C2=A0 [<0000000040c3fc44>] submit_bio_noacct+0x188/0x9=
70
>>> [475406.587743]=C2=A0 [<0000000040c40514>] submit_bio+0xe8/0x1c8
>>> [475406.587743]=C2=A0 [<00000000408344d0>] __swap_writepage+0x2ac/0x7b=
8
>>> [475406.595743]=C2=A0 [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
>>> [475406.595743]=C2=A0 [<0000000040760bec>] shrink_folio_list+0x17a0/0x=
1cb0
>>> [475406.603742]=C2=A0 [<0000000040761430>] evict_folios+0x334/0xc40
>>> [475406.603742]=C2=A0 [<000000004076412c>] try_to_shrink_lruvec+0x208/=
0x458
>>> [475406.607743]=C2=A0 [<0000000040764448>] shrink_one+0xcc/0x2b0
>>> [475406.611744]=C2=A0 [<00000000407692d8>] shrink_node+0xe6c/0x15b8
>>> [475406.611744]=C2=A0 [<000000004076b520>] do_try_to_free_pages+0x154/=
0x8d8
>>> [475406.615742]=C2=A0 [<000000004076bdbc>] try_to_free_pages+0x118/0x4=
00
>>> [475406.615742]=C2=A0 [<000000004080d68c>] __alloc_pages_slowpath.cons=
tprop.0+0xbbc/0x1b64
>>> [475406.619743]=C2=A0 [<000000004080e81c>] __alloc_frozen_pages_noprof=
+0x1e8/0x4a8
>>> [475406.627743]=C2=A0 [<000000004080ed10>] get_free_pages_noprof+0x3c/=
0x158
>>> [475406.627743]
>>> [475406.627743]
>>> [475406.627743] Kernel Fault: Code=3D15 (Data TLB miss fault) at addr =
000000001e91e6c0
>>> [475406.631743] CPU: 2 UID: 0 PID: 10231 Comm: kworker/u32:1 Not taint=
ed 7.1.3+deb14-parisc64 #1 VOLUNTARY=C2=A0 Debian 7.1.3-1
>>> [475406.635742] Hardware name: 9000/800/rp3440
>>> [475406.643749] Workqueue: writeback wb_workfn (flush-8:0)
>>> [475406.643749]
>>> [475406.643749]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 YZrvWESTHLNXBCVMcbcbcbcb=
OGFRQPDI
>>> [475406.647745] PSW: 00001000000001001111111100001110 Not tainted
>>> [475406.647745] r00-03=C2=A0 000000ff0804ff0e 0000000041645e80 0000000=
04033e444 00000000536939f0
>>> [475406.655743] r04-07=C2=A0 0000000041642e80 00000000536937c8 0000000=
0536937c8 0000000041c2ee68
>>> [475406.659743] r08-11=C2=A0 000000001cced740 000000000800000e 0000000=
04ca85680 00000000415f18a0
>>> [475406.659743] r12-15=C2=A0 0000000040236340 0000000002c52000 0000000=
04167de80 000000004a8175c8
>>> [475406.663743] r16-19=C2=A0 000000004167de80 0000000041c1dfc0 0000000=
041c1e0b0 0000000000017c00
>>> [475406.667743] r20-23=C2=A0 000000000800000e 0000000000002f80 0000000=
00800000e 000000001e906ac0
>>> [475406.675742] r24-27=C2=A0 0000000053693ec8 3ffffffffffff57c 0000000=
041c2ee60 0000000041642e80
>>> [475406.675742] r28-31=C2=A0 00000000000017c0 0000000053693a80 0000000=
053693ab0 0000000000000000
>>> [475406.679743] sr00-03=C2=A0 0000000000d4c000 0000000000000000 000000=
0000000000 0000000000d4c000
>>> [475406.687743] sr04-07=C2=A0 0000000000000000 0000000000000000 000000=
0000000000 0000000000000000
>>> [475406.691743]
>>> [475406.691743] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000=
4033e4b8 000000004033e4bc
>>> [475406.695744]=C2=A0 IIR: 0e770098=C2=A0=C2=A0=C2=A0 ISR: 00000000000=
00000=C2=A0 IOR: 000000001e91e6c0
>>> [475406.695744]=C2=A0 CPU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=
=C2=A0=C2=A0 CR30: 00000001d0b88000 CR31: ffffffffffffffff
>>> [475406.703743]=C2=A0 ORIG_R28: 0000000041652e80
>>> [475406.703743]=C2=A0 IAOQ[0]: unwind_frame_regs+0xf0/0x5f0
>>> [475406.707743]=C2=A0 IAOQ[1]: unwind_frame_regs+0xf4/0x5f0
>>> [475406.707743]=C2=A0 RP(r2): unwind_frame_regs+0x7c/0x5f0
>>> [475406.711743] Backtrace:
>>> [475406.711743]=C2=A0 [<000000004033f000>] unwind_once+0x30/0x78
>>> [475406.711743]=C2=A0 [<0000000040300a1c>] do_show_stack+0x100/0x188
>>> [475406.715743]=C2=A0 [<0000000040329614>] show_stack+0x88/0xc0
>>> [475406.715743]=C2=A0 [<000000004031ca70>] dump_stack_lvl+0x120/0x188
>>> [475406.723742]=C2=A0 [<000000004031cb0c>] dump_stack+0x34/0x48
>>> [475406.723742]=C2=A0 [<0000000040302278>] vpanic+0x22c/0x640
>>> [475406.731742]=C2=A0 [<00000000403026e4>] panic+0x58/0x78
>>> [475406.731742]=C2=A0 [<00000000415ab598>] __schedule+0x11f0/0x1214
>>> [475406.735743]=C2=A0 [<00000000415ab614>] schedule+0x58/0x1b0
>>> [475406.735743]=C2=A0 [<00000000415ab84c>] io_schedule+0x80/0xc8
>>> [475406.739743]=C2=A0 [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
>>> [475406.739743]=C2=A0 [<0000000040cabfac>] wbt_wait+0xf8/0x178
>>> [475406.743745]=C2=A0 [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
>>> [475406.743745]=C2=A0 [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xd=
c8
>>> [475406.751742]=C2=A0 [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
>>> [475406.751742]=C2=A0 [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0=
x24c/0x468
>>> [475406.755743]=C2=A0 [<0000000040c3fc44>] submit_bio_noacct+0x188/0x9=
70
>>> [475406.759743]=C2=A0 [<0000000040c40514>] submit_bio+0xe8/0x1c8
>>> [475406.759743]=C2=A0 [<00000000408344d0>] __swap_writepage+0x2ac/0x7b=
8
>>> [475406.763742]=C2=A0 [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
>>> [475406.763742]=C2=A0 [<0000000040760bec>] shrink_folio_list+0x17a0/0x=
1cb0
>>> [475406.771743]=C2=A0 [<0000000040761430>] evict_folios+0x334/0xc40
>>> [475406.771743]=C2=A0 [<000000004076412c>] try_to_shrink_lruvec+0x208/=
0x458
>>> [475406.779742]=C2=A0 [<0000000040764448>] shrink_one+0xcc/0x2b0
>>> [475406.783798]=C2=A0 [<00000000407692d8>] shrink_node+0xe6c/0x15b8
>>> [475406.783798]=C2=A0 [<000000004076b520>] do_try_to_free_pages+0x154/=
0x8d8
>>> [475406.787763]=C2=A0 [<000000004076bdbc>] try_to_free_pages+0x118/0x4=
00
>>> [475406.787763]=C2=A0 [<000000004080d68c>] __alloc_pages_slowpath.cons=
tprop.0+0xbbc/0x1b64
>>> [475406.791742]=C2=A0 [<000000004080e81c>] __alloc_frozen_pages_noprof=
+0x1e8/0x4a8
>>> [475406.799742]=C2=A0 [<000000004080ed10>] get_free_pages_noprof+0x3c/=
0x158
>>> [475406.799742]
>>> [475406.799742] Kernel panic - not syncing: Kernel Fault
>>> [475406.803743] ---[ end Kernel panic - not syncing: Kernel Fault ]---
>>>
>>> I think it also happened on paladin.
>> Yes, it did.
>> Maybe we need to increase the stack size.
> Happened again on mx3210.  Is it the irq stack that you think is corrupt=
ed?
Sorry, haven't done anything on this. Not even some thought....
Too much other stuff...

Helge

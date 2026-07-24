Received: from cmx-mtlrgo001.bell.net (mta-mtl-001.bell.net [209.71.208.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F7411F89
	for <linux-parisc@vger.kernel.org>; Fri, 24 Jul 2026 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894961; cv=none; b=tP/HidQeQ5qfZToH9rGEf2srsXUaHt8K7X+2P2pFkYqaev3DdKrK/5Zcm1NSY/1o+3BXV8RYX1F39OWqT5x2vYRy+t+H2JRiM+lMs45QMwQGNkcCReO1gvYGHiFh1R4EzPIPkIOsvQg7f70meNPWfiLKiilxhlWzjfze9PlrqmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894961; c=relaxed/simple;
	bh=+YoId/kXuw59l3y5jM+46Yxx64jiJudHk4Fs/kb37m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a+lmFHKIas8+QJbb+1QaOwQntCCt3H52cXQFdjAXuPG4stKR1nmtDyr3e0z7cQ3iRzq6VYwmo/yT+AD6uFOeRkVKpAOZyVmMlhALHDxppPPCvonb3bhoyAUxQrI7LX1CqfnTAos6RYba+0gRen9DT+RCy+Peww7H4pjiQeUITfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=wapqC7cr; arc=none smtp.client-ip=209.71.208.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="wapqC7cr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1784894958; 
        bh=ybfWadapRrJbZtM295fHjvH8BvQEVe3Qs8EJnCDCpK8=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=wapqC7cruDh5+j+qxW0ignm0Lt5t09+jGhN6HBscsgMtcCAOBde7MKC79y6rQgia7ZM4rFL6yMzxMmmlMZPmQfEjRiveEVkkTCuxnMzfCP8dpeQEuEHa29K5wMNxNR+x7qKXQgePYp/3uPFSQx7mjukFBY17/spJ3Z4S/bOxVuViJucO+Tv6+eTe5dsFbqWS7LURZeL50dEYKM/QAmUCnq6C2tf+nvMKQvB5Z4GsCt3hP8VSCwlXwWphJJA+anYaBllkElHPudIhRGO0QuRlmSlbAeSGc9N787P9x+0UqqDV2HZOlIRFVAsKtturUUY3FBcbdptRCeLep2+SbKXidw==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6A28288905F5E8DB
X-RazorGate-Vade: dmFkZTGpjazkoJMtBePrtB8+hUfOjxzml/5kM6P78SEpCe0Ftqs7cMI6PeEGVMxD2RJnkZ5qrmiz43ccTnR7cNjCtvH03LelVdwQ+whG8V/TtKXuIjgo0mPi8VzyvRLpsYMc+NXMGl3UMRKfM8geGYKenW/sDzvFUqZnSHqiYhTzimpJ+gdqlh//MuuPcj33d3yjKtpRSgJ6oGyRNRKLDh0jpfi2aBXSa7/t9a8YiF9QSHCLhrg2+RE3OvC055L6Lcrc1UAsC8900bLrMtJaXAIM5p+c64qIOUdK2WjfgwC/A9Udb5ugnfXK7SK0WDQn0XpvTsNvtDcm49dpIoCdcn68gZlyBgHeWSjhtFwZpRZnTv1DvOWf4Q51HIuH0rcZFTfS43gGSJuGtT5/XPQjF5IkyPG+8OS604mHFOOwogVfOYD0F5ehn9olepOSEA83mMm1GnqT/bhs/LywPcqBzpKfPgsUUv4oG+H1Iswim+VSMVkM/H1EvrcIZUzTqfh5iFx6bkX6OmV0ysubVuwVdJrRHw2hxZfcjYfNnSYQjlGIFn546vN3bsGgoBGOlTW3kbXvZVVVXzg7Ta2u0QbrICcqxg+eZo1+iS6VcolSQEnnFYLJ80gw+wUH+MjQIquIioYbhDAl2opDq3K6jqWPJ7P1vHSWjF3uXUEUmGTBH6MPEMy7Hw
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (70.26.67.32) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 6A28288905F5E8DB; Fri, 24 Jul 2026 08:09:08 -0400
Message-ID: <ab61aaa9-d348-4f8a-b107-62c4dcf511d4@bell.net>
Date: Fri, 24 Jul 2026 08:09:09 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Crash building vtk9 9.6.2+dfsg1-2 on mx3210
To: Helge Deller <deller@gmx.de>, linux-parisc <linux-parisc@vger.kernel.org>
References: <6f678534-19ab-427a-916e-61145f359fd4@bell.net>
 <cca5a099-a406-484b-88d2-17281826748b@gmx.de>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <cca5a099-a406-484b-88d2-17281826748b@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026-07-19 12:18 p.m., Helge Deller wrote:
> On 7/19/26 14:50, John David Anglin wrote:
>> FWIW:
>>
>> mx3210 login: [475406.368656] Kernel panic - not syncing: corrupted stack end detected inside scheduler
>> [475406.368804] CPU: 2 UID: 0 PID: 10231 Comm: kworker/u32:1 Not tainted 7.1.3+deb14-parisc64 #1 VOLUNTARY  Debian 7.1.3-1
>> [475406.369172] Hardware name: 9000/800/rp3440
>> [475406.375748] Workqueue: writeback wb_workfn (flush-8:0)
>> [475406.375748] Backtrace:
>> [475406.375748]  [<0000000040329614>] show_stack+0x88/0xc0
>> [475406.379764]  [<000000004031ca70>] dump_stack_lvl+0x120/0x188
>> [475406.379764]  [<000000004031cb0c>] dump_stack+0x34/0x48
>> [475406.383759]  [<0000000040302278>] vpanic+0x22c/0x640
>> [475406.383759]  [<00000000403026e4>] panic+0x58/0x78
>> [475406.389759]  [<00000000415ab598>] __schedule+0x11f0/0x1214
>> [475406.389759]  [<00000000415ab614>] schedule+0x58/0x1b0
>> [475406.391764]  [<00000000415ab84c>] io_schedule+0x80/0xc8
>> [475406.391764]  [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
>> [475406.399759]  [<0000000040cabfac>] wbt_wait+0xf8/0x178
>> [475406.399759]  [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
>> [475406.403753]  [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xdc8
>> [475406.407752]  [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
>> [475406.407752]  [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0x24c/0x468
>> [475406.415768]  [<0000000040c3fc44>] submit_bio_noacct+0x188/0x970
>> [475406.415768]  [<0000000040c40514>] submit_bio+0xe8/0x1c8
>> [475406.419765]  [<00000000408344d0>] __swap_writepage+0x2ac/0x7b8
>> [475406.423747]  [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
>> [475406.423747]  [<0000000040760bec>] shrink_folio_list+0x17a0/0x1cb0
>> [475406.431756]  [<0000000040761430>] evict_folios+0x334/0xc40
>> [475406.431756]  [<000000004076412c>] try_to_shrink_lruvec+0x208/0x458
>> [475406.435752]  [<0000000040764448>] shrink_one+0xcc/0x2b0
>> [475406.435752]  [<00000000407692d8>] shrink_node+0xe6c/0x15b8
>> [475406.439749]  [<000000004076b520>] do_try_to_free_pages+0x154/0x8d8
>> [475406.444017]  [<000000004076bdbc>] try_to_free_pages+0x118/0x400
>> [475406.444017]  [<000000004080d68c>] __alloc_pages_slowpath.constprop.0+0xbbc/0x1b64
>> [475406.447748]  [<000000004080e81c>] __alloc_frozen_pages_noprof+0x1e8/0x4a8
>> [475406.455746]  [<000000004080ed10>] get_free_pages_noprof+0x3c/0x158
>> [475406.455746]  [<000000001cced740>] jbd2_alloc+0xe4/0x148 [jbd2]
>> [475406.547746] Backtrace:
>> [475406.547746]  [<000000004033f000>] unwind_once+0x30/0x78
>> [475406.547746]  [<0000000040300a1c>] do_show_stack+0x100/0x188
>> [475406.547746]  [<0000000040329614>] show_stack+0x88/0xc0
>> [475406.547746]  [<000000004031ca70>] dump_stack_lvl+0x120/0x188
>> [475406.555747]  [<000000004031cb0c>] dump_stack+0x34/0x48
>> [475406.555747]  [<0000000040302278>] vpanic+0x22c/0x640
>> [475406.559743]  [<00000000403026e4>] panic+0x58/0x78
>> [475406.559743]  [<00000000415ab598>]     +0x11f0/0x1214
>> [475406.563749]  [<00000000415ab614>] schedule+0x58/0x1b0
>> [475406.563749]  [<00000000415ab84c>] io_schedule+0x80/0xc8
>> [475406.567783]  [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
>> [475406.567783]  [<0000000040cabfac>] wbt_wait+0xf8/0x178
>> [475406.575742]  [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
>> [475406.575742]  [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xdc8
>> [475406.579743]  [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
>> [475406.579743]  [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0x24c/0x468
>> [475406.583743]  [<0000000040c3fc44>] submit_bio_noacct+0x188/0x970
>> [475406.587743]  [<0000000040c40514>] submit_bio+0xe8/0x1c8
>> [475406.587743]  [<00000000408344d0>] __swap_writepage+0x2ac/0x7b8
>> [475406.595743]  [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
>> [475406.595743]  [<0000000040760bec>] shrink_folio_list+0x17a0/0x1cb0
>> [475406.603742]  [<0000000040761430>] evict_folios+0x334/0xc40
>> [475406.603742]  [<000000004076412c>] try_to_shrink_lruvec+0x208/0x458
>> [475406.607743]  [<0000000040764448>] shrink_one+0xcc/0x2b0
>> [475406.611744]  [<00000000407692d8>] shrink_node+0xe6c/0x15b8
>> [475406.611744]  [<000000004076b520>] do_try_to_free_pages+0x154/0x8d8
>> [475406.615742]  [<000000004076bdbc>] try_to_free_pages+0x118/0x400
>> [475406.615742]  [<000000004080d68c>] __alloc_pages_slowpath.constprop.0+0xbbc/0x1b64
>> [475406.619743]  [<000000004080e81c>] __alloc_frozen_pages_noprof+0x1e8/0x4a8
>> [475406.627743]  [<000000004080ed10>] get_free_pages_noprof+0x3c/0x158
>> [475406.627743]
>> [475406.627743]
>> [475406.627743] Kernel Fault: Code=15 (Data TLB miss fault) at addr 000000001e91e6c0
>> [475406.631743] CPU: 2 UID: 0 PID: 10231 Comm: kworker/u32:1 Not tainted 7.1.3+deb14-parisc64 #1 VOLUNTARY  Debian 7.1.3-1
>> [475406.635742] Hardware name: 9000/800/rp3440
>> [475406.643749] Workqueue: writeback wb_workfn (flush-8:0)
>> [475406.643749]
>> [475406.643749]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>> [475406.647745] PSW: 00001000000001001111111100001110 Not tainted
>> [475406.647745] r00-03  000000ff0804ff0e 0000000041645e80 000000004033e444 00000000536939f0
>> [475406.655743] r04-07  0000000041642e80 00000000536937c8 00000000536937c8 0000000041c2ee68
>> [475406.659743] r08-11  000000001cced740 000000000800000e 000000004ca85680 00000000415f18a0
>> [475406.659743] r12-15  0000000040236340 0000000002c52000 000000004167de80 000000004a8175c8
>> [475406.663743] r16-19  000000004167de80 0000000041c1dfc0 0000000041c1e0b0 0000000000017c00
>> [475406.667743] r20-23  000000000800000e 0000000000002f80 000000000800000e 000000001e906ac0
>> [475406.675742] r24-27  0000000053693ec8 3ffffffffffff57c 0000000041c2ee60 0000000041642e80
>> [475406.675742] r28-31  00000000000017c0 0000000053693a80 0000000053693ab0 0000000000000000
>> [475406.679743] sr00-03  0000000000d4c000 0000000000000000 0000000000000000 0000000000d4c000
>> [475406.687743] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [475406.691743]
>> [475406.691743] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004033e4b8 000000004033e4bc
>> [475406.695744]  IIR: 0e770098    ISR: 0000000000000000  IOR: 000000001e91e6c0
>> [475406.695744]  CPU:        2   CR30: 00000001d0b88000 CR31: ffffffffffffffff
>> [475406.703743]  ORIG_R28: 0000000041652e80
>> [475406.703743]  IAOQ[0]: unwind_frame_regs+0xf0/0x5f0
>> [475406.707743]  IAOQ[1]: unwind_frame_regs+0xf4/0x5f0
>> [475406.707743]  RP(r2): unwind_frame_regs+0x7c/0x5f0
>> [475406.711743] Backtrace:
>> [475406.711743]  [<000000004033f000>] unwind_once+0x30/0x78
>> [475406.711743]  [<0000000040300a1c>] do_show_stack+0x100/0x188
>> [475406.715743]  [<0000000040329614>] show_stack+0x88/0xc0
>> [475406.715743]  [<000000004031ca70>] dump_stack_lvl+0x120/0x188
>> [475406.723742]  [<000000004031cb0c>] dump_stack+0x34/0x48
>> [475406.723742]  [<0000000040302278>] vpanic+0x22c/0x640
>> [475406.731742]  [<00000000403026e4>] panic+0x58/0x78
>> [475406.731742]  [<00000000415ab598>] __schedule+0x11f0/0x1214
>> [475406.735743]  [<00000000415ab614>] schedule+0x58/0x1b0
>> [475406.735743]  [<00000000415ab84c>] io_schedule+0x80/0xc8
>> [475406.739743]  [<0000000040c7c488>] rq_qos_wait+0x10c/0x268
>> [475406.739743]  [<0000000040cabfac>] wbt_wait+0xf8/0x178
>> [475406.743745]  [<0000000040c7bd88>] __rq_qos_throttle+0x54/0xa0
>> [475406.743745]  [<0000000040c5ee84>] blk_mq_submit_bio+0x638/0xdc8
>> [475406.751742]  [<0000000040c3f220>] __submit_bio+0xa4/0x4d8
>> [475406.751742]  [<0000000040c3f8a0>] submit_bio_noacct_nocheck+0x24c/0x468
>> [475406.755743]  [<0000000040c3fc44>] submit_bio_noacct+0x188/0x970
>> [475406.759743]  [<0000000040c40514>] submit_bio+0xe8/0x1c8
>> [475406.759743]  [<00000000408344d0>] __swap_writepage+0x2ac/0x7b8
>> [475406.763742]  [<0000000040834cb8>] swap_writeout+0x2dc/0x6b0
>> [475406.763742]  [<0000000040760bec>] shrink_folio_list+0x17a0/0x1cb0
>> [475406.771743]  [<0000000040761430>] evict_folios+0x334/0xc40
>> [475406.771743]  [<000000004076412c>] try_to_shrink_lruvec+0x208/0x458
>> [475406.779742]  [<0000000040764448>] shrink_one+0xcc/0x2b0
>> [475406.783798]  [<00000000407692d8>] shrink_node+0xe6c/0x15b8
>> [475406.783798]  [<000000004076b520>] do_try_to_free_pages+0x154/0x8d8
>> [475406.787763]  [<000000004076bdbc>] try_to_free_pages+0x118/0x400
>> [475406.787763]  [<000000004080d68c>] __alloc_pages_slowpath.constprop.0+0xbbc/0x1b64
>> [475406.791742]  [<000000004080e81c>] __alloc_frozen_pages_noprof+0x1e8/0x4a8
>> [475406.799742]  [<000000004080ed10>] get_free_pages_noprof+0x3c/0x158
>> [475406.799742]
>> [475406.799742] Kernel panic - not syncing: Kernel Fault
>> [475406.803743] ---[ end Kernel panic - not syncing: Kernel Fault ]---
>>
>> I think it also happened on paladin.
> Yes, it did.
> Maybe we need to increase the stack size.
Happened again on mx3210.  Is it the irq stack that you think is corrupted?

Dave
-- 
John David Anglin  dave.anglin@bell.net

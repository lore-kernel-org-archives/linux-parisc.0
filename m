Received: from cmx-mtlrgo001.bell.net (mta-mtl-002.bell.net [209.71.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00912B2D7
	for <linux-parisc@vger.kernel.org>; Sun, 10 May 2026 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778421428; cv=none; b=VRsFV9uB+WMdqO531Q1VBjcNSddhM/dtJHwBFFS6klNsctsLYpdrEtaAjYhpDVzZNPfyRN/wnubauy64ozGY7VW8T71Pu3dxh324F4b65IJeUPJu57o2BI0O3xUIKj7EDBV7zvg4jNekfbg94su7nLAakuNOMQUYEYJYXJmEw3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778421428; c=relaxed/simple;
	bh=gAEecVBcVfna8mBe68uz4rOwRjY0IqRBPe3T1k8gpIo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=RJMClCHf2KmxOEK3eqDQhrb02AZLuiDcexHE4xShjmWHZ+AdUZbJHDpT7GK120FoCWSOJb8VhNgK9EWlT4tCn0GJYYU0wWGj/Qpxdyzw1CMe9qfZtTW9xz/swSDM8u2CUad7LIqPcYi6PuuLyZhct36G/mljmOKhSNBUW250Csw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=S/dPsuaY; arc=none smtp.client-ip=209.71.208.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="S/dPsuaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1778421427; 
        bh=RkzM8MQoLUqxNJfOh0/YoCkydCfg1RejiD1ZUIX+enI=;
        h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
        b=S/dPsuaYG60G9OyTMbEjvQoUugoClWm7wRevqPGu4IE7DLmgyWBz9gICn6SZBog1AspCoV4k4gu52wrjUsCdVZWlspja7xbSSsUHSUveNSG/VQcHF+BOhS2yuziJjE1iGKslnra42XiIOBKtTa1YvbE2ZZC8iZH6jKVPGaNnz2jk/XeqQYW57hA+3fAD5TK/pckgUb5hiIcvNfzr1DmMp3gSrk6q3JphSSjWh7yF0ojQhyYO2pP3UimhVP321T0vF9E+fF2ewF8A+R6leII4xRsDnRbyGoTGW0AoBsHnTr5c13Ja98KSUwfv89fYl0eors384JWEtqVYV84heYYnZg==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 69BEEF930735EAF9
X-RazorGate-Vade: dmFkZTF7/+6O7pXBxYGcXDRRNfY1Gm+m1fBYfPHl63IPFBvT7gxjM1Tm96cKBwGUzMAj9F8GDY1it129XUvhCLlA0kyJCamL0oYJL/v7q2pJWh+S/Ak1/3O1Gqy9qSlvO4krTIibRPRw56R+MDmt0PiKuhtYgiySm7np67mN61nTx5yDlXbrEm2Hq7LAdAqvgJ2h6J3qTFKtq8XEJ3BCwtTUQTjbs5gYSElN++R3pOcyN8Cclyf+U+xQPly5IKE7PBSIoMI915Omf1B7Vz1R3diOATZP4kSrq5/mAX/GKiX0tdYjdQHWH7s6Wqqy23nJhZuMtwmInr1ASTd0zvJXY8lz7sVrdKllevb8uEyEGCqqPzDeUHWJbfdbqttPNr9Ika3gqVdGTgPXuK3XeEK4GvStpFonyB8YCNvKV0VYDYuk75cp1kS+QebeZXmxKi7+UPWxc8osIujj1wfEkIsQ3l6aWYWvOIEG9URN6sG2sP1meBUCIQVv/oDJVFzsCwt0Ig9AFHwtSRDkl5J7av0hy19WwNhoq1Tg6UuCB8IBGgNP4kXIDLY5TPuukiv7ZzbQ7SDexE29EG574y1j/06OIXjBpzmqmbpefhEdqKhMxw16OtJCPMaVCguo9bTTadtrDtKNIiWrqyobuGbVDTQsKvv/XWVTMTlxQCNxJ6Fx9AWeFuc0fQ
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (70.26.67.152) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 69BEEF930735EAF9; Sun, 10 May 2026 09:55:46 -0400
Message-ID: <6cdd815c-3239-4ff1-bd4a-25cd8619f9cd@bell.net>
Date: Sun, 10 May 2026 09:55:47 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-parisc <linux-parisc@vger.kernel.org>
From: John David Anglin <dave.anglin@bell.net>
Subject: Crash with latest debian kernel
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[43529.731938] Kernel panic - not syncing: corrupted stack end detected inside scheduler
[43529.732083] CPU: 1 UID: 0 PID: 8726 Comm: kworker/u32:4 Not tainted 7.0.4+deb14-parisc64 #1 VOLUNTARY  Debian 7.0.4-1
[43529.732347] Hardware name: 9000/800/rp3440
[43529.736345] Workqueue: writeback wb_workfn (flush-259:0)
[43529.736345] Backtrace:
[43529.736345]  [<0000000040329614>] show_stack+0x88/0xc0
[43529.740397]  [<000000004031c800>] dump_stack_lvl+0x120/0x188
[43529.740397]  [<000000004031c89c>] dump_stack+0x34/0x48
[43529.748350]  [<0000000040302280>] vpanic+0x22c/0x640
[43529.748350]  [<00000000403026ec>] panic+0x58/0x78
[43529.752346]  [<0000000041592c84>] __schedule+0x112c/0x114c
[43529.752346]  [<0000000041592cfc>] schedule+0x58/0x1f8
[43529.756343]  [<0000000041592f7c>] io_schedule+0x80/0xc8
[43529.756343]  [<0000000040c72448>] rq_qos_wait+0x10c/0x268
[43529.760343]  [<0000000040c9fb64>] wbt_wait+0xf8/0x178
[43529.760343]  [<0000000040c71d48>] __rq_qos_throttle+0x54/0xa0
[43529.764351]  [<0000000040c54eb4>] blk_mq_submit_bio+0x690/0xd68
[43529.772345]  [<0000000040c353f0>] __submit_bio+0xa4/0x4d8
[43529.772345]  [<0000000040c35a70>] submit_bio_noacct_nocheck+0x24c/0x470
[43529.780340]  [<0000000040c35e1c>] submit_bio_noacct+0x188/0x978
[43529.780340]  [<0000000040c366f4>] submit_bio+0xe8/0x1c8
[43529.784350]  [<0000000040824978>] __swap_writepage+0x254/0x738
[43529.784350]  [<0000000040825138>] swap_writeout+0x2dc/0x6a8
[43529.788342]  [<0000000040752ff8>] shrink_folio_list+0x184c/0x1c98
[43529.788342]  [<0000000040753778>] evict_folios+0x334/0xc90
[43529.792340]  [<00000000407542dc>] try_to_shrink_lruvec+0x208/0x410
[43529.800346]  [<00000000407545b0>] shrink_one+0xcc/0x2b0
[43529.800346]  [<000000004075b150>] shrink_node+0xf4c/0x1510
[43529.804342]  [<000000004075d1e8>] do_try_to_free_pages+0x154/0x8a0
[43529.804342]  [<000000004075da4c>] try_to_free_pages+0x118/0x408
[43529.808350]  [<00000000407fdc90>] __alloc_pages_slowpath.constprop.0+0xbc8/0x1b8c
[43529.808350]  [<00000000407fee3c>] __alloc_frozen_pages_noprof+0x1e8/0x4b0
[43529.816342]  [<00000000407ff230>] __folio_alloc_noprof+0x34/0x100
[43529.824359]  [<000000004072116c>] __filemap_get_folio_mpol+0x250/0x890
[43529.824359]  [<0000000040970228>] __getblk_slow+0x13c/0x618
[43529.828350]
[43529.828350] ---[ end Kernel panic - not syncing: corrupted stack end detected inside scheduler ]---

Dave
-- 
John David Anglin  dave.anglin@bell.net


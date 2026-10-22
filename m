Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683140;
	b=IoQYPQMrIZ274CH1eMjAwjPrz7Zv6un/NfRQOkgeoz3jT/lDjJL3lkmRVfqPrm7+lbmE
	 FDQ6wiMJXkQ18A7PaT7hlyr4BeDvGXkk1V9Zi14OXlQx0OelM5De0KoyMET65F1rjrywf
	 8hdRwNlXePBLD3uMhbaMnu/R/+UIhkIKTIJOiUscTjyqRmqekMkNXzgX0J3WorGt5QEP3
	 Lg5aPcW0/BGi4QMMaBTUM2aaVvhZunHLItmWhWE2drha8rg4ou5bDUikhMrPbNzF5Yshs
	 EsSTw93sNjfw7+v0XurPOkW5SA77Ds40/aAJGVNcXqRGWQPwhxwDawd6cGnDlPK1GFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=wILF8iSij6P3SFE3aoQZMYOYp0L+rKnBrfNdu2SvpGs=;
	b=RIdbGwkabVyj50D/1WYE6STM4kkFmcoapHjk8KJn+glX9ElNIyZXkJlE5uL3JDCxLbOZ
	 iooBT+ezOmM1CdrCBF8OLK8AWmnoqgvOnveswjTzw2Bydh4qfetGaju8KHLpm0whcSfSh
	 +4WFHgI5KYEmwJcOcyM86VSO4OKBx/DB7oXk2BZ0jNc4kLAONU0HUTEtO6wnjbKFr67u1
	 +W7zCBb5jb5GoYzU87AtFC07ClXHkDtq4pwkABeHHoF19mdJSXnZFKFkLq0eKuIClhA8e
	 fb0c2hVcW5RnC6OoomZLhjwTQY1l8cfKV8ogIMjP/CDgKksvBQchKYgdE0kAkWVO3jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pbHvvPQY;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D87606A31B
	for <linux-parisc@vger.kernel.org>; Thu, 22 Oct 2026 15:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D87606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pbHvvPQY
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36681e85e87so4183720eec.1
        for <linux-parisc@vger.kernel.org>; Thu, 22 Oct 2026 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683139; x=1793287939; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wILF8iSij6P3SFE3aoQZMYOYp0L+rKnBrfNdu2SvpGs=;
        b=pbHvvPQYdGAcoP5f76vUZWpUkwp0k94ZktpUhQlO91+lGCQrrDULpF3XA3eznnVfn9
         kPZdoY+4KFlXn5fnD3S8zfP5vU3KaPfd6U1sJnEwL4q6NNZW/KNab+Js/wM3e2weyQ/E
         dJhEkhu7qMjLvAvL0dsGE6a+N+CYPZQtv3634FOJ5GhHh/9j/AH9Xa03cHlhiNJ54mlP
         pMUWt4KxRmoqm8I+PXsjbZ6tcHJh9GhdezMlijH/UJ3HSUv+y1Xw0mRQdQRkbeP8ezrf
         kjLOG1Yuy9LM+Zk3l0JgeON3Krxf+TWRDr2KaOkOL0EfFCMKrNd7yawD5K1M4W5i+9XG
         QAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683139; x=1793287939;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wILF8iSij6P3SFE3aoQZMYOYp0L+rKnBrfNdu2SvpGs=;
        b=tYexcXWJw5IrnHC0k+1yIOk7oqn3PFTEDO7h8uQv3b1aopkyHckp2+/du2Nwe8FZt4
         qnKlIlVMapWzP9I8Q/n1txkuhjbzcqAYWRdJHeKZN8V5xC9m9QvzbboRnC1h40DAlKt7
         7o/VWqyVWgA8xf2UmcbpmaUQ1Hk27DRqpsEWKyV93IAL0Pgu++OslyoZx0xGA4jOUgK5
         mbuh2JPVaOgPpadGn30+xv7vYSqS12b0QlXjn2vOn1v0rn2Md2JUuVAXvb2/1HV/2N0V
         AmHV2SnOplRnPe/aY1IqGLsT9A0A9QARF/wGCh4JZKBCfDuluqu20qezpHNpwvR+peHn
         CAFA==
X-Gm-Message-State: AFq9FYKs2plE1BzQz7/swxaWPu8FmSGhOEnY40VvhE0h6ImA5YgUah8u
	vTqYFh/+S/KBlNnSK4KkVVuIVPAbr2pm7e+9WTVfbq1AmHF6qEBhknxSC9PAAQ==
X-Gm-Gg: AYBFou0Yt3v+lmEEKiDZHajcA8S2Hzo7U6hrTysg7AP8T29RT0uzcFCrx2DvgkCYRIP
	8jFgNbSE5Lt3v/RCQEfz3npZu1NOCzRHESJFaLWSOkIra86QvFWzrD+9ABX6Vhd4wr0oZFArBkA
	lC7FfSRLA6G0PF5hiasQOI/M6QlqoTGCDGf2ksighCT7+L9nt2hVojT0xPne6Ay4PG6kfVBVo6u
	crloEMEruYkyIXhjMw4YKfQVcVAKtgW0KpDyyuJPtjIZ8z12jFaIm8gztK4GKE8kbR9pX6fJwGf
	X2Iqc9i0msTUqU/uqekaPgEG1M759JlXlgAJoclTIkYq5c9GtGUJ4A8Hp9WfpoWcZdzj5bebI07
	FRkGd5fc0XXaExFvRMZp4T2tLqthVgr+ZKpFFPNbIM4ugXfdfBAuSlRB40iy0jOFbbE7cMS6QSE
	UUZ0dgEBL8SIfutxKvfD6sBT0mZvY7EMOie5d86vyYKmmZtCruo9PwrOJp7M8apKwMVoPVFfvhe
	PrUkJwCbuHf26iaQmW0mJ+NbPk8SWLpurHYSCc/ejpNacbn0h+Ff786DqSOsWvpzXN2zA==
X-Received: by 2002:a05:7300:e9c5:20b0:35d:f7f4:bc1c with SMTP id 5a478bee46e88-3674d84d341mr8193895eec.6.1792683139225;
        Thu, 22 Oct 2026 08:32:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm19582140eec.25.2026.10.22.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:32:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 22 Oct 2026 08:32:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: Crash when running 32-bit kernels on qemu with C3700 machine
Message-ID: <b9a0a102-701e-4160-b15e-ddf053f02775@roeck-us.net>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

as part of my kernel boot tests, I run 32-bit parisc kernels with the C3700
qemu machine. That used to work fine. However, it started crashing a while
ago.

[    0.259126] Backtrace:
[    0.259266]  [<1010653c>] alloc_tree_node+0xf0/0x1b0
[    0.259743]  [<10106778>] alloc_pa_dev+0xfc/0x274
[    0.259912]  [<10106118>] do_device_inventory+0x190/0x36c
[    0.260095]  [<101050e4>] parisc_init+0xa4/0x178
[    0.260256]  [<104262cc>] do_one_initcall+0x98/0x510
[    0.260438]  [<10101564>] kernel_init_freeable+0x29c/0x34c
[    0.260623]  [<1118f274>] kernel_init+0x2c/0x15c
[    0.260799]  [<1042301c>] ret_from_kernel_thread+0x1c/0x24

Bisect points to commit b8425ceefee5df2 ("parisc: drivers: switch to
dynamic root device") as the culprit and, indeed, analyzing the above
backtrace shows that the "root" variable in arch/parisc/kernel/inventory.c
is NULL when the crash is seen.

However, as it turns out, that is not the real cause of the problem.
The actual problem is that 'root' is overwritten in
pdc_system_map_find_mods() during the first call of mem_pdc_call().
Apparently that code (or, rather, the firmware) writes over the end
of pdc_result[] and/or pdc_result2[], and the 'root' variable is just
close to those arrays in the memory map. The following hack "fixes"
the problem.

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index c35a34809743..ae172a78f893 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -74,8 +74,8 @@
 static DEFINE_SPINLOCK(pdc_lock);
 #endif

-static unsigned long pdc_result[NUM_PDC_RESULT]  __aligned(8);
-static unsigned long pdc_result2[NUM_PDC_RESULT] __aligned(8);
+static unsigned long pdc_result[NUM_PDC_RESULT * 2]  __aligned(8);
+static unsigned long pdc_result2[NUM_PDC_RESULT * 2] __aligned(8);

Questions: Is that a bug in the kernel or in the firmware ?
Am I not supposed to test a 32-bit kernel with the C3700 machine ?
If so, would it make sense to prevent 32-bit kernels from running
on that machine in the first place ?

Thanks,
Guenter

Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E445320393
	for <linux-parisc@vger.kernel.org>; Sun, 30 Aug 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123175; cv=none; b=aM3urh1W+IVpEjXDoW5wsvxGdnpYiNH6m6HrDORy4b8xnm7lpMd9XZUGFuKqk0b70pXia4mhyroC+OaSjT9dvb2dVSvoMcrOFAgFJ86YWtx3KFdBDEi+2vdFlXs1xxcYNrn5inXYPQKFyo4jX56OZN0UxBRxg5D89yCotW5+SrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123175; c=relaxed/simple;
	bh=J1XnXvUhkya2ACpjnSJHwTSg5sxeBkJnQgGmjFu/XDY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ikel06xFBVpKYZ4EIadsvi3AY93oUWU3w6O2TbY5+JUuQxsxrxsVm1Qb+Uao8EF/kt/+IvLZ+AaG0SbedQEBxN4/oWbR2izr/KDXjPzluAnj5kB1ZTb/+qd5wSXPnYMJ5Gxb5T5J1vib2RdoLOKxRJX9RDW3Ycv6nK2pvTPikNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCQ2r/Gs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCQ2r/Gs"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84830c774a0so3033721b3a.1
        for <linux-parisc@vger.kernel.org>; Sun, 30 Aug 2026 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123173; x=1788727973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e3NLpNy+BDe0j0QP8+nBDEi6sQEUt8fjxuUZyp+2VTs=;
        b=jCQ2r/Gsp3BwOES5IdhGU3B3cKwFtJautNu9DEA+HEiwERjF9IyprJTDlv03KVmZne
         p7RkvwJB7p3QHel1aW986friAar0yl5hp2Vtfr2HeCXFZDfecSiycFhswNiu7ejmu3HD
         sSC9+i6+jJ+9usMKKRxU/3wu3q4aWhOZR8OOxvPAYaaFcupghdewVVr3UHQizg8P13cA
         ksD+/MJkAk5fTEnxKPInChZhwOcOW+RNeG3M9/iSv40UNKMfDP7x4pF1o1l+OQdjdPGS
         EXlFR2H3SIoZvwbJL20zNuYiVJZ3LlI5ufj6m4UbqLg7YEXRz5CPXy9IEX64+tPnpjR4
         TgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123173; x=1788727973;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e3NLpNy+BDe0j0QP8+nBDEi6sQEUt8fjxuUZyp+2VTs=;
        b=F+azPvnBO9bCpiP2W8NV2phjr3p6AoKdnAA1OPMzgp/Bpbo3Xbokzzk7bix/rR15Ql
         ceFzcS77O3LufejWknKkI7tDghv4Me/2+qTlmO/HDqgeHWwoTG+ZExXutM89Xbt+k24P
         maasQpu7E5B74ROyHb9R+/HboZ6I0jsKHKqfaHfKiJR7p06ByoMJNIJr74/UmnB74SXE
         SXwIQ1uPFS4PjROp+SawuQSTOnH5gbwBdrPrleOsHXwX/+Su0SZuJYIYZ1QOfBLnvVli
         VUdbmMS6+YJ7MqMpRCadjqDkSy64YttSbAdpNfnedu8wBAAas0pwZ3foG4Whp/oSAeg2
         o5CA==
X-Forwarded-Encrypted: i=1; AHgh+RrvaKuh37EFNDIS75N42odbfYfWCZxZdgLDS+ofksEDT9Slc0CLvi+V75PzLQSidpxPYP8Jpr5cO9+rcGk=@vger.kernel.org
X-Gm-Message-State: AFuF++kSjnU1cLmGFwKsZrgvsQmuUiQ2akn+nZ2mngZ9I9rhgU9E7Cpy
	TYE2428bAOoEUlTMTf7o3DsVpD9DhHi/esBygmJk7OVbXkrbsCKbTK6e
X-Gm-Gg: AR+sD11un4LGuVm4cU2xQI6luHAZ7FqHTps1TXe0pbprgPiRrFEtA+kARDGPf10zpSR
	8e4GbsCOUiVR/NG/Ljx+q43faO0HZePh5VUdaCfeJ5Owr3dWceDKf6TqjagjxwD5oYEVV4xj6Uy
	Kbq5l73u2QbGwQXL83hWXsj9ILJPlxCah6qEyz/1XVtboyiBddzmYZO0ky1MVTDXUMSO6WdbUes
	wfQ9xdwA5/5S2YvcyCuGEyYnQDlkf5QkdY8IN48tdsWtn1pdHx9t86YW6W0JaOGmw9q10i4cNYg
	X1dOHXZekjm6iYsfpmGcRwwOTOOzxrygrnX0kzIKrJXXV09Rn7A1n9D7jvOEAU9MHX4ecPf15bM
	yz3dBjyCysMTu7sTxmyZp2V3gLqOrufGLyAqCYm9zrEJ/XNa7e54tESvYA/AuLCF9qvl2HN09cW
	MeRpG4HnqID2BtxDRCAm7aJB63VuwubYRwE8YvML0IKU+qRSjpucx+F2G6+BdhwhIkF4d4+55Kp
	yK4kqVVzUmIVrFiY/sdURisA1a0acTeaDN21iftaoKcUcHcF5Q=
X-Received: by 2002:a05:6a20:9c87:b0:3d1:60d3:9a10 with SMTP id adf61e73a8af0-3d26784f276mr36532863637.5.1788123172866;
        Sun, 30 Aug 2026 13:52:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm26849437eec.24.2026.08.30.13.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:52:52 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/7] Input: gscps2: cleanups and locking fixes
Date: Sun, 30 Aug 2026 13:52:45 -0700
Message-Id: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2YlGoC/yXMSwqAMAxF0a1IxhZqwe9WxEGNqcaBSqMiFPdu1
 eGB+14AIc8k0CQBPJ0svC4RWZoATnYZSfEQDUabQle6VqPgJkZZ5whztLZ0NcR48+T4+o7a7rc
 c/Uy4v2u47wc98uSqagAAAA==
X-Change-ID: 20260809-gscps2-affec5caa7f9
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev-b242f

This series cleans up the PA-RISC GSC PS/2 driver (gscps2) and addresses
several concurrency, locking, and interrupt handling issues.

The series performs code style and structural cleanups, including removing
forward declarations, converting printk calls to dev_* logging helpers,
and simplifying enable/disable handling.

Additionally, it resolves several concurrency, locking, and interrupt
handling issues:
- Protect ps2port_list traversal with RCU and manage port registration in
  open/close rather than probe/remove to avoid use-after-free during
  device unregistration.
- Protect ring buffer indices with ps2port->lock in read and report
  helpers while releasing the lock before calling serio_interrupt().
- Assert and enforce ps2port->lock across gscps2_flush() callers.
- Return IRQ_NONE when no data was handled on shared interrupt lines to
  preserve core spurious interrupt detection.
- Serialize concurrent interrupt handlers using a try-lock to guarantee
  in-order byte delivery.
- Drop the 6 ms busy-wait and manual interrupt pump on transmit in favor
  of standard asynchronous hardware interrupt delivery.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (7):
      Input: gscps2 - clean up driver code style and structure
      Input: gscps2 - use RCU for ps2port_list and manage it in open/close
      Input: gscps2 - protect buffer access in read and report helpers
      Input: gscps2 - serialize hardware and buffer access in gscps2_flush()
      Input: gscps2 - return IRQ_NONE when interrupt is not handled
      Input: gscps2 - serialize concurrent interrupt handlers
      Input: gscps2 - drop busy-wait and manual interrupt pump on transmit

 drivers/input/serio/gscps2.c | 277 ++++++++++++++++++++++---------------------
 1 file changed, 139 insertions(+), 138 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260809-gscps2-affec5caa7f9

Thanks.

-- 
Dmitry


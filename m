Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1883ACA6C
	for <linux-parisc@vger.kernel.org>; Tue,  4 Aug 2026 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849782; cv=none; b=gC6jbBBd1Gi1dyoaEx9Ytl4MPJ6VDwog79rFpZwn7c2lCWV90XjN65/a12ikV1UI5g4/+AZu7ckWQC4+JXqS034t3shUL5IuJjtin/3/0AtdEZ/SAG4YrnBsHw1yw5bI/XESiyJJ7rVOGS3L74D6yYE+PmwRH5ZM2xbIC1Y2ex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849782; c=relaxed/simple;
	bh=mjZHqIZ+cGjNbNTdaQCXiWLQxTRY4IiRvtwjvT1EDsc=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=HRsY/ach2fISUs8xMJLiwVu6oUVYkby9AGaVvcCuelpUTNWNFEJoOUBoTNvlhs87cOTP6h5gxuFxTzyXEGKbnsdPkHtHL68MWPQBpVpmq/XuSUYxwstCm0sRMSlU87wexWyqzC+Rj3hNKCCygEgj6tRHoyfgP8DhF+8p/YwOKEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=IdRrBqmj; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="IdRrBqmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785849777; x=1786454577; i=deller@gmx.de;
	bh=qHeosQcdmF5PLlsQo5+SjLfFJaJHA57jpA63bpmxErY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:
	 References:To:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IdRrBqmjs82q+U0Ymm0KcLwgeT3mZZGhRPupJKM5S8ttFw9mnPcC1RxBI1RZTb8r
	 LaexPujJExntH8HQ2EZTmHbhPyiCwny0zU4TbhZHsp3vlB35Nh+QA4gsfNeMFW6Nr
	 2MvWmcCjQpbzNmwrs0XSRsgJk6JjEc/dkEsbjyhs+a1/3nhfOwvZDZL/ydNVrZwBG
	 9kPa4mU19yy8YEce7FfiaM4GTZMlIm4BoXkSYvuHD75NwTnWI5PLeMjztTxZaZxhI
	 WwJup1w3EssU2WJoahLXd3VWC65pS/KeAR2L2aeZwtMhYKJE4hUpGXzzoWgdaVFet
	 AGDgtgGJNRpyMGmuzA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1wWHwL2Hjw-00YGXL for
 <linux-parisc@vger.kernel.org>; Tue, 04 Aug 2026 15:22:57 +0200
Message-ID: <b02e35be-9df5-49a4-adf9-c19781824355@gmx.de>
Date: Tue, 4 Aug 2026 15:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH] [RFC] UAPI: Add QEMU linux-user emulation flag
References: <20260731150949.5536-1-deller@kernel.org>
To: linux-parisc <linux-parisc@vger.kernel.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260731150949.5536-1-deller@kernel.org>
X-Forwarded-Message-Id: <20260731150949.5536-1-deller@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LZ1R1cI3dzuBsij98EkhpcQHhXbTHMfOD0DQhT89aDNFwqIhgrx
 X9MyGndVwStkIdXNwurYVgJiwhQ1qGIWBeX2ifezLEXPXskJDFLxvndHj4CHxH8H10hXSUe
 LpCaOX8K+t0GVOcrGogtsweBjo4SiVB8JezlnKwXJTbwxEiWki51vBRCzs3XFIzqW1PGdfL
 Ok+QbVNfJBLjzItu1NN5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P8rb2A/p1l8=;2FHHnfB8QCWSEYDHFvnbq6rP3GF
 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

=2D------- Forwarded Message --------
Subject: [PATCH] [RFC] UAPI: Add QEMU linux-user emulation flag
Date: Fri, 31 Jul 2026 17:09:49 +0200
From: Helge Deller <deller@kernel.org>
To: Christoph Hellwig <hch@infradead.org>, linux-abi-devel@lists.sourcefor=
ge.net, linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
CC: deller@gmx.de

From: Helge Deller <deller@gmx.de>

For some userspace applications it's useful to know if they currently
run on QEMU's linux-user emulation. Such programs are for example the
LTP testsuite, which could avoid testing specific testcases, or systemd
which should avoid use of specific syscalls.

This RFC is about adding a QEMU_LINUX_USER flag to the personality()
syscall which would be injected by qemu-user binary.
Applications may then call personality(-1), and check the
QEMU_LINUX_USER flag to determine if they are running on qemu-user.
Adding this flag seems for me to be the least invasive change. No
changes to uname strings which would need to be parsed or other
modifications to the emulation.

As this patch is just an RFC, maybe people come up with other ideas?

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
  include/uapi/linux/personality.h | 1 +
  1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/persona=
lity.h
index 243f5f80a7b8..ba6ddaef8954 100644
=2D-- a/include/uapi/linux/personality.h
+++ b/include/uapi/linux/personality.h
@@ -9,6 +9,7 @@
   * These occupy the top three bytes.
   */
  enum {
+	QEMU_LINUX_USER =3D	0x0010000,	/* Qemu linux-user emulation */
  	UNAME26	=3D               0x0020000,
  	ADDR_NO_RANDOMIZE =3D 	0x0040000,	/* disable randomization of VA space =
*/
  	FDPIC_FUNCPTRS =3D	0x0080000,	/* userspace function ptrs point to descr=
iptors
=2D-=20
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750045;
	b=Z9aVJESFc+3PkAlogwTUSIC1bRE5R4WVsjKjbCJvJGhLkGW0JoWyKelvEgDG/tdSSpoR
	 T+3QA84rnEjyYvMU7sIk7Ei9a6h4PwQor/HwWkY8IcELJ7ZGBPto7x8Qc8Zjfj1ekuY3U
	 YrDbvaLxMQ9pucvPnFW3l9lXI3reh+miZDEXYG50uw3kE/LF2rPCb0blLIqOiqymbuoZe
	 i5kVd7FaKgC/UQ7bG1LjKp7FiDUYe0RetBQ8l95mrAJc3iUWaCr+TmtNEzr/IAeU4xpdn
	 jZ7RSuhnT3XadtDQ6p7n03nEjMf7UzkHNv0oSYq9aDpDKHGN9+QsZmLoGmEWrBBH9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=zFpFLKfZVf3h8AzwNMik3TcRCLZzCju/teL1CyI01yY=;
	b=tE7S5qQLx5BlLf8tjrZVmMuChYwOq6X5RZ6R5IXVUoUfPC27kLsPuduibvB12XfBIKpW
	 iYkRbOS4oTtjbiGMd8jstuTlcD7+cCyRmuEK8QZqBLzwHt3v5HUVQuA6H2q4U0F9CmWnc
	 8viHLeyhbyVQNIrWfvT0qkODLVfl1rnP0a1q96fg1zkyM3WR5Co3uTn4tktKiJJTn6QcJ
	 w0/SbMBqGMuYCpR56ri4AerxUzk0FQTA2Lcav59UOnATC9X4ylr5a5hqNfjBz8XY0/gs3
	 N+Gdy4o3ESF+L3dvGFwJrBjnu+29VmOk8WAxek/Lfmr0rcBnDu4YVSkkwWvUQhEKy5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMMH3T3n;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC52606A321
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 03:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC52606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMMH3T3n
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4e18369c8so45517547b3.2
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 19:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795750043; x=1796354843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zFpFLKfZVf3h8AzwNMik3TcRCLZzCju/teL1CyI01yY=;
        b=XMMH3T3n0tTGxQrmlzlR7ju69M8Bv9VInnG+3pzYjjq/ARA2hWdA96KnNog1UyVqVT
         vjg+KieBVlXFmuldA09elUrVnW/Wz4s0DiYAo0F/GjxYIbJDOUAfl7A2w7gonovmq5vy
         mjIHByiW5XvHW4Qy3svSw8iSpMYcC5f560Ir9Qp+7u02kDyCOuNepi2XGPHfGg5+3i/6
         Wbpv6F+4lmY7ART67rEH1bhlq7Tl3i3MqGjuQ8aY4joSi56CkapZm+JBY8rp21/HWqHw
         KOU9DytJ7ndo1JYUGrMgUUWUd0hVZpsO1H907irdDBqvp61MEgcurvDx/XfDrCudskz/
         Kb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750043; x=1796354843;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zFpFLKfZVf3h8AzwNMik3TcRCLZzCju/teL1CyI01yY=;
        b=ZFX1j0jvd6g+Xeeu764g3LiFepns6T5rZTdpnsogsRmlJ0OU92QH/m7o3+1NeG5LeN
         UUrr0dRVRdkKMXbNXigwB7rCbb4BsOUmGMGrZEkgWXGV2M7OTBrGG3rJDm1EsYsNFvLT
         8YdamijdyORlk51A0HL0vYcV334kvxk17uJZqxlkVoQhtnqkeUj4lDxXiS3VLkRsnrdl
         Z+nSIxpRbukwsj9zXWCf5125OVOI5j9LJ5168WyEquFt7HTrMIVWhqY4ewG0wnxrhtT3
         DaSwK/JnqtnvctADsVNqmBe+IdZ7Ewbd40eLdZTn2u+3HHAmGZtX1aEElJFW14orbJaZ
         KIUA==
X-Gm-Message-State: APuU4Z/kCYI1t83B4TeCTc/cHeyhdQVGhtc8sGfcX1K3rfWwI6vK7RVi
	w1bEPFFXnu/UJcQ4CDpE67IjoPSrPKqLGqZ/htvDnzpYQtOr74vPUAXE
X-Gm-Gg: AZFdTZeh9/gt39Sk7Oc3YRLRwAWuQ8aPqErVIAWUhze5BkqPK8yXu2i17EwbuuKyVMC
	OIzgdTIf/5Ra8opcP770pxcB3ZmrUdH8PzqOJPU4lD8pOjC1L8Y5NeGjQl0RdDF4QpL8Ut63Zoj
	mjWwKMliw4DJTrCppSpdFnIdwmsOW/pH1v6OBvuu58U1zX39t70woOwvgnSZh7sz8elO8dAktUw
	47+JVHnTKwsdlY08VyzTTDUmxT7zKDYGNCuhh4o+qBAonTZ7+WFrUiUY5uLxt5obYr7/RpUlZfi
	PRqflwH4WSg7dMtHGza0M+W2MtNJGwO22Wz8qyNXTcFSMD/UIntzQc2uTa4Rbns7HMGOS4O95j/
	8tuZtA+F/XXP5Pl00eP8uyqr7XS9geGMiks25eNCEH3CvEhGUT8iBKrGDSSBOulVkr7f5+GqGct
	3j7qoCobLXwBU+lvLdqu7KKAijxL9U7jqnYdXJ3FZAImIQARFGxV1h2pdKiQiagbK2tL7L2/zEp
	mVGb2vq4IkqGLKTgVqC+RoTgwrRYDFjufl4cZgpq+r20bvkGU4yl0A3Qs1RUUV80l9cEB0PQM+v
	kSGkq5oXomQeGasP+tLafXg0uOSlaLQi5CXUgMACCfGlErmkJT+hBqPGH9pqtmE9RGrkbIjW6F/
	+oVQpzsmcN9zr81IuIKVd/hRW67F0Sqi0b0sT4X0yPQS1USlW40XQ9EccPTn6eHY=
X-Received: by 2002:a05:690c:6801:b0:8b4:e2be:7a6c with SMTP id 00721157ae682-8b52047e157mr84897427b3.32.1795750043398;
        Thu, 26 Nov 2026 19:27:23 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028c802sm92239357b3.11.2026.11.26.19.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:27:21 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/6] parisc: fix the TOC and HPMC handlers on 64-bit SMP
Date: Thu, 26 Nov 2026 22:27:18 -0500
Message-Id: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3YLEosziZN2Mgtxk3bTMitRiXRNLS2ODtDQLSxNjcyWgvoKiVLA
 EUFt0LIRfXJqUlZpcAjJIqbYWABaZvc91AAAA
X-Change-ID: 20261126-parisc-hpmc-fixes-49930ff89437
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, stable@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=lLlB41EVVyqD7UgfO/F63NxUcHqXCh1XpIQYwxPwtwQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5fkx7eFQqUVaCP2O+2vdFls/t/tU1rEm2+Cs2Zf/qO
 41CS2ICOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYaawNGhikFPyuVvf
 5c4d7zzSVN7srRl0mq01SKzmfZr9f+u3nxN09GhpmWYgtE973V3DydRTvDetrWiNz4TWUf+F6e2
 j5RYZXuAhYA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

On a C8000 (two PA-8900 sockets, PDC 2.13) an HPMC never produced a
report: the machine either reset or took a second HPMC before Linux
printed anything. These patches fix what stood in the way, in the order
the handler runs into them.

Patch 1 fixes the TOC handler's CPU number load (an unaligned ldd of a
32-bit field), and patch 2 gives os_hpmc a per-CPU stack. os_hpmc has
used the per-cpu template of toc_stack since commit e486288d116a, and
that template is freed init memory on SMP kernels. Both are Cc'd to
stable.

Patch 3 lets only the first CPU through os_hpmc; any other spins. The
C8000 delivers an HPMC to both cores of a socket, and two CPUs running
PDC_PIM and PDC_IO at once ended in a bus timeout inside PDC.

Patches 4 and 5 deal with the wide PDC calling convention: the fifth
argument of PDC_PIM and PDC_IO now also goes in %r22, and the IODC
console init, which passes arguments 4 and up only on the stack and
which the C8000 rejects, is skipped on 64-bit kernels. The report goes
out through the kernel's own console driver anyway.

Patch 6 makes parisc_terminate() enter the nbcon emergency state, so the
report reaches an 8250 console even though interrupts are off.

With all six, an HPMC on the C8000 prints the register dump and panics.
The firmware side (monarch selection, what PDC expects of the other
CPUs) was checked against a static analysis of the PDC 2.13 image: it
does no rendezvous after branching to the OS, so spinning the other CPUs
in os_hpmc is all it needs.

---
Matt Turner (6):
      parisc: Load the CPU number with ldw in the TOC handler
      parisc: Fix the HPMC handler stack on SMP kernels
      parisc: Let only one CPU run the HPMC handler
      parisc: Pass the fifth PDC argument in a register in the HPMC handler
      parisc: Skip the IODC console init in the HPMC handler on 64-bit
      parisc: Print the parisc_terminate() report on nbcon consoles

 arch/parisc/kernel/hpmc.S    | 56 +++++++++++++++++++++++++++++++++++++-------
 arch/parisc/kernel/toc_asm.S |  2 +-
 arch/parisc/kernel/traps.c   |  6 +++++
 3 files changed, 54 insertions(+), 10 deletions(-)
---
base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
change-id: 20261126-parisc-hpmc-fixes-49930ff89437

Best regards,
--  
Matt Turner <mattst88@gmail.com>


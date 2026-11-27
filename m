Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747887;
	b=kiV3FOUw01KKtFdLLyIzDK2++mwYJHBdGQK3ZZntsaPB7kdqvcT3xgq0YM5VHVNDgVLk
	 pn7TH681CkRih6auUnLIdcI7niSa2qql2V7zMIftTi/FkCmsWzqwnqZyp6LO2qoiR1rzT
	 nhIsK6hCheP36tXhE7dJ/V+piirjhvybTveMkQsLbhyrPlQu3giU6cqCJjHv/Ix1MqsqA
	 cmU/6+AoIlba7nrSfoPRULYyQPrAiEFcNLrhUKvVI2t97TgHYGh51gEyJAM7n6+ZpDDa8
	 SDEqjDroW7COs79RIuumVCymQkpU4H1kBooTPuwGkapTK+TSSCaTA8HYPrLLyGOPgdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=zgqf4EWoq8X15oKNg1g/tXzX2oxlCAo+DQ0IZ4J7t2k=;
	b=Ote4F1oN2eBS9I0mE0mlDfTvO9uc0rNHKe6eF10ZhrF4+45iHeCLPofzWlpuQ24QPBx3
	 o6UCmqudW+zabz7AvKSr4beICOqv2lmnmj6H3KEwuC0wx49zvHNRnFNXPI608dzFLWBCW
	 MbZArOczaNYXyYx0/4xaAXp575MVFW2vzARDCl8z11tAGgZX1hZ462XUCjjrtbIjYOlZx
	 jR5LNvfiPrOH+bczNWnWFMTPcaWPg0k9/ej3MAOoebqRRUUZfNqUIklBu75mtrnXvCIdf
	 v/ahe8vmQU8TbmESrSp3zYBLYO5JRnKHn4lH3KgsWzZ/ehC6tDYEz6OhOK2wzBkTOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r04eidDp;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26328606A31C
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 02:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26328606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r04eidDp
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4e2fcc300so66400507b3.2
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 18:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795747886; x=1796352686; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zgqf4EWoq8X15oKNg1g/tXzX2oxlCAo+DQ0IZ4J7t2k=;
        b=r04eidDpISwgOPMoWguLx03I0SepqoUQD8aQHgn+UBEHauksgbAGytMCSbcHWBOTNc
         cC5e9llITVamT8pDDT5l6RaxcOK348DFUzESaykbNghuTDg0PTDT0ypVrJDqVQHg0e8L
         uFFrBgFRTbPBSAngs3FSCZgbzhoowRCENY9MQNQqy0h2FB8FhPrem83wIISTGRPQdCuf
         jUVL9/U/nlbg9yyb9Cgu4x02DLIppu2yH6aGq8U1RMJDdsseLeSu4JeBLiMHTMAej9mF
         7UeDWClAefKzV1UcMLT2H65ECe3DyhNItqU6BhLkz7HIeHZiymxYEo0lJya8b9yVxezz
         oZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795747886; x=1796352686;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zgqf4EWoq8X15oKNg1g/tXzX2oxlCAo+DQ0IZ4J7t2k=;
        b=Ai9x75907pBsQmNVGKlcXBZ7UrlCmef7HAmtYC/ZtOK5H8wSzJf2ywEFy9mkCbjZAa
         1ZioW4CMIniuz+GZwsl2W9nof/umSoSbVloNxO2Ct+Im1vIqMRhc3b6ignd5/MElN+L/
         2YwGj4MisGPxwqM0zAqMHmQqljKXcDdfd4nBrQFr3wK3FCZd9veNm8tgKXp1bMVnqEAa
         28wQpHdzoFQVSPBlb7zO4GeC1ReXfVdmlJpBO5SVAKLA+nqktyycQe42k0p/hn7DODNr
         6K7kKQ1yqLkb54+4Nu4V4zW43AkzZpC50bi3Eo1rHWDr94YQ/1rV9YJNe8bWzvHWAV7C
         x1XA==
X-Gm-Message-State: APuU4Z+XjXkTn58LGIacfMt6ltO5zkb/3222C0VKFQWkRbZxwu65+Syi
	4aZ3GUHnF0XdvtAjUam7uVSgbq4t5SWb1jGj0YJQHMK22keKyxbzlQyFJ4DA12QZ
X-Gm-Gg: AZFdTZe3FiEodggpO1Q8Oc66PxuvZCdd96IIyVvjiSxkqXelIFhnnIvw1BoJgD7CRpy
	VUne4J3PCMWIoP3B0JFwXb/E6WQ9FYv/0/l/C3QsmyYwrKyctCRlVFJj5Yu3VaWTV2C7cQMciHN
	CslNuNVlHjxJz3gZVG7v045unokJMY/lciE9ljjxhVXJZHkrclLbmPaGjOXa6stq0tV64TLWrgY
	nKCVdGgjfUMBuIqOdg6oUg1JGj1ogHnKH+FWkfLLdXfDDrzHDdHJIEQHCY5z7jMWXrG73h0+5a+
	DH3TNB2Acd+t/9Y2EySVmlz7EWIJVNa7TvyNRAhb8Eef+6wd4nLiELXP/Iyn20UEE4YzaJ20Ckh
	kceRzy3ehqc2u7RZvs7n6SNpvh7EIg/mYfRu8GoaxnTB2R7WyLE4fBlcdglpnlm4odhzdmaOiHw
	GlVliNCiyytRbFXO84lh1gvJ2RmtUsXXWcLWml6QdVg+8GFEHebS3QLiUeFRVruHzNh9uX7TiZN
	ihKEOODDyG+egxlEiB+CLxDdw/6UQ2nFuFwJfpI1HqM/3ecEYDaj82tJw5eIff2mHqfdYqPiO9/
	2t4sWRIc42GNdDttT+Oeu7ngxt6HdLJX8KVj+ZqIxIc0UIeNZ+f1WV+48SZNAzMyhAYuL7OxeRv
	1v6PrCe+O3EQjzJ4Ki139ZXQhpXgjBBoWK9w15C0//w==
X-Received: by 2002:a05:690c:4d02:b0:8b4:dd47:151f with SMTP id 00721157ae682-8b52048dde8mr77909087b3.43.1795747886031;
        Thu, 26 Nov 2026 18:51:26 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033c2d4sm89866167b3.36.2026.11.26.18.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:51:25 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 26 Nov 2026 21:51:25 -0500
Subject: [PATCH] parisc: align the boot wrapper's page-aligned BSS
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
Message-Id: <20261126-parisc-boot-bss-align-v1-1-c4457377ee33@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTtgQgjUq4iLJP1tRyQpmVoKp
 Xc32uW3eG8nRRUo3bqdKlZRKbnBXDpKU8gjWIZmslfrjbGe51BFE8dSFo6qHN4yZkY/ONfbCHh
 Qa+eKp2z/7/1xWj/xhbT8ZnQcXzcYrlt5AAAA
X-Change-ID: 20261126-parisc-boot-bss-align-e9d4492bee6e
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=c13xjqUprF/g2Svad+fIoJ5NZWMtMAAlpwYceL/1WGk=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5PuhIGyycuqhQ8al86IJkPSsO79kV5pM+rV0rpH1ls
 ZFCiqpmx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJrAhIg0MQMDCwJebmFdqpGOkZ6ptqGcI
 ZOgYxUPk9Bg0MouLS1OLdNMKihzy8ksSSzLz84r18gtS8wrSC/TSMtNKMjLyi4pTgUbo5aWWmLo
 6uhkZGphYOlqYOVk4mpo4OzsZOrk5Ojq7OhlZmpsYOFs6mrhamjNwcQrAXCMexvBXdM7Mt382XV
 n9ZNX0zWdm8gpEx2ZHPfvNy7jb31RV7+V7SUaGzin+dR2zp3yJDp9y/9tf1bfhXhY3Odhm/L96Y
 8L/k/3vuAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

real2.S puts real_stack, the stack the boot wrapper uses for firmware
calls, in __PAGE_ALIGNED_BSS. In assembly that is only a .section
directive, and aligning the section is the linker script's job, which
the main kernel's BSS_SECTION() does. The boot wrapper's linker script
has no rule for .bss..page_aligned, so the catch-all *(.bss.*) sweeps
it up wherever the preceding input section happened to end.

In a gcc build of the boot wrapper for a C8000, real_stack lands at
0x1506168, which is aligned to 8 bytes rather than to a page. Where
it lands depends on the sizes of everything placed before it. An
experimental clang build put it at an address that was not even
doubleword aligned, and real64_call()'s first store to it took an
unaligned data reference trap before the kernel had been decompressed.

Align the section and name it explicitly, ahead of the catch-all.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/boot/compressed/vmlinux.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/compressed/vmlinux.lds.S
index 87d24cc824b6..15a7d8534abf 100644
--- a/arch/parisc/boot/compressed/vmlinux.lds.S
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -76,6 +76,9 @@ SECTIONS
 	. = ALIGN(8);
 	.bss : {
 		_bss = . ;
+		/* __PAGE_ALIGNED_BSS is only a .section directive in assembly. */
+		. = ALIGN(PAGE_SIZE);
+		*(.bss..page_aligned)
 		*(.bss)
 		*(.bss.*)
 		*(COMMON)

---
base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
change-id: 20261126-parisc-boot-bss-align-e9d4492bee6e

Best regards,
--  
Matt Turner <mattst88@gmail.com>


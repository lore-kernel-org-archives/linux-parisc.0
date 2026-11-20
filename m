Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178204;
	b=jljkqyJzmaFo85C3Hhn5O707L7GZCOOJJJqpsNR9sLGX4kVocSzbg5o6OuBQ0zDBm6R3
	 NYajzaRNkwhLu+GDr3twwhruBM5L3sStqq7Dm6om5cftnZwqME8uoQiY9tNNSJZiegXJJ
	 R7Dc6z1zXw0rVsW/3q3YWoGnNQ1NQUZ7+6ievXg1ytCurNPfR35BCZar2eR5WSr/3IcWi
	 06qFnsahBaEOoHDzbAcLiKLSNo/az+B5Ztobia1hH9Q/53MaSUuIw/NsoUbw/3bYie4ng
	 77ek2wv7mfzW3KClrp5+T/GF94W1TFQ3Xu901ypnzfSx32BeBOW9XJ/pXDYksNatbWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
	b=q4/NxPHTAMRnzmCFcc9Rr1PkDgVt4dHj3hr6i1mU789ZCLndO5giHEq0HDivUGMvaR2y
	 OOqy2x1q1j8Q3yDAmz2LDWhiCF9JJD+scMPp+0eDngbj7j2uOvs13WpZb5DssguniRC0W
	 a4fVFyYcmCGDTDxhASgAUCzP+503qgCdMMLePjNH6VKuVzKpIQsS9qcGP59/ABdOWg76l
	 GSE73J04DmG7Kg2Bm5YJ5FfaAXbi/SffVJatPBP9MMNSxdgK8LoYQzwCfD8U2LhH+sYhf
	 +9gqf8GBlJKjrgpnDaouv/JENK37+u1mVfaMX982NBJD7fce80iNu0/yirieS8rFM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HXJed8Xe;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A876606A32C
	for <linux-parisc@vger.kernel.org>; Fri, 20 Nov 2026 12:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A876606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HXJed8Xe
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1606033137.1
        for <linux-parisc@vger.kernel.org>; Fri, 20 Nov 2026 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795178202; x=1795783002; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
        b=HXJed8XePExKCaS/vsWCG+uafaTv62pJ6qXxW1wwlMZ3vS7gQbPwNq2sz55VVp/LV1
         XYd2msAHHJJneZRvET6yTJCphUbc6s0hbKMQ7VkdKX4MKlZGn8FY711cxvJGkAYR89t+
         bElC+gf83tdHlqm/K0d4evHuovT7um6IDl9nenV4l/WY7qPMNX2PFsUnwbre98hV0EcI
         aEtRGm9SfkjwBAnozD4WvD77w1sSzl8D9qFwD4V416ptnYy+Sgi14GBtK+clNF1Mri6g
         H+oDntwuHWPd0TzdPGu2iOGgWdvKkhez9gyEJdgFQgqfgsF3Fd99PX2LnPAdQaChuMcI
         fyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178202; x=1795783002;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
        b=1J7Rx3FuiubQ5u9XJZEWsNpOJsUC0R0G31oSCGEDKQeeYHICyoqBlSSo4yAvDn0/Po
         /HT3jooToYMB1JegprgNtwOn058N71S/YIZVWAF27DjGkdzdOACnP02qq/Z4z9ZTRBHl
         E2zbOF+AKCeOz0mVBOTdMhdn4wlC0W9ovu/aHLNEGK7OAD01emLg2g9fkyLFd6n1+WnD
         H9RG2XhqGPJLiFzpe/QyQMdkz8EDhOrNPEtJVoRD/OE+9+mHeOBlR2Bk2kdkyAzth58m
         qy52776Fj7ewBV8fF1/oLLwlxGdDLLU4ciIhbx6B7c/jCd6UWXP7hIWWYegwEC+bMB+p
         Zwxw==
X-Forwarded-Encrypted: i=1; AL+hErEtHP5o1OuOsUhEl+V/SjmsLTsrz9wcn4WwR9fOopVDONZSaVJkndCIVOlBPbZJDNNMcRJ4pgqOUCel0Go=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fXGvxPvf8wwClaS/uSL7DfmWuxjDjSjKWeKrW/sxQiIQDy+P2
	0PqAMW3471E4TgvjKg2+GYFBhU//DU4hjjF/rTFSuNz6DHpLMvw/x4vtdgYu0zIf2II=
X-Gm-Gg: AZFdTZfiGm1lDxTrXMSRHNwk8JjU9y1BQiLQegQ0X99CDtKq/5HxXq4/s+Pbs52Z96Z
	Zy3aBunTGQR8Q4u1q5e66O3K1oD61J3OQpy0Dy0j0KYIZD1udkgtmc5RU384/x0NFAEUQRUWqXJ
	/yiIJoN4m+H2Zv3QswexbXviOjbs2DAv78mmUHvhx3+14z2xt3r14rECTc9kPzDaaNQ6QxGpdvv
	8YZbgsO4Yet1ipXPglN2RWRwwjGRW8/gEYGL+E+FijKAyGMXpyalybq34wTvfO6dXjqMHQmgf/7
	+N1k2fDmuZKBkSJU4V2+o9kVdVQRprTzYwP8IzlIzWV0Gv3hTGAVBZbGvuGm1fhQM9L+cODNhYy
	zDlpAt/bc4YHiPo3F0cbutGiJhZGsFF7Dk1cv6vGi0ugO6Vch0BN0Sc5+VzQqrjTi5MtUAa7Bou
	3Fb9wRVx+2hhupi19UPmQdNDki3eGD4lzlpJLL6kGAXcVvNhY1gpcq7roqzS1PesFYmP6dzTsbq
	4pidzWmAxcZk3EWFBwx9VJjjJcelnyw2qZVoDiIBG2oEefwOzKFaid5P04NlSBj74MT7wdY8qY0
	NOFJ1tfZZUobrarI74+tQTaZpG59KV42R8wJoBWSXknZgumFfcDA24y4rOw1HNjRZCoLiKoZByt
	punojrsuPHVZ2/iEJa0HUTCmnNyb3sE7DZTXEG5ahq2CMmaA=
X-Received: by 2002:a05:6102:6441:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d739660c9fmr746735137.14.1795178202521;
        Fri, 20 Nov 2026 04:36:42 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm2765262137.7.2026.11.20.04.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:36:42 -0800 (PST)
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
Subject: Re: [PATCH 0/2] arch, kexec: declare kexec and crash capabilities
 in Kconfig.kexec
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, 
 Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 x86@kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev
In-Reply-To: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
Date: Fri, 20 Nov 2026 07:36:31 -0500
Message-Id: <179517819160.302903.17107992182494080507.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=6sWQl9lmqjTJk3yxh91YK+fuuFKvUf1mQEwavRJAVng=;
 b=owEBbAKT/ZANAwAKAbt3KEzbc3reAcsmYgBrAD7YSNYHVf2cFGXSq25iXRKWCRXN4f0ixFmnf
 ++ItKpA2qWJAjIEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCawA+2AAKCRC7dyhM23N6
 3tiPD/d31VAJSvGrL/uVfmPyx9aQ56Xv29nKPQ6VnqwxP+xMB94zunEWD8SU+Mc33Jsi99L7q8T
 EfGGkXbTCSoGd7NQv3bSnhUhMQVXfpkd18XOnWbNd0iZdBWi4KwA6+/bOhxsYpO/vNSV52HyHUl
 YH2tsnNB0E6EUN5P7dsJ2PqcWD6QjGrbW/xN/5ItrxWqVXu7AFWAGG87321F8utMVUAjMd5pbNX
 gMmicb9aVIU7JY8k0q7PhcEcRAKBjeq1d52NlSDCQyaltHTGY5+29RgVN9juLHJk/Aqy3s15ERG
 gm7x8LUDOEKOpRB5wWYYeKgpWsUscytR/AC4OBQTujXKhQIWBnWrzxr6tjgdacQJt/i9O9RHd1G
 2mft4ocO42XqcRceZtQr6UzRDuVwoDTDwn7Tgr1GRPVmpKWKbzpatvf9WPoIEE1p4+zITr10dGz
 r/38wDLPSJghOgD31RGTysREDXP/fCAYar6DdmmMDK63vuMssMRCUOe16Xd0DOIZIG4FAZ7iix4
 P8e8ny0z7tfxqx4vm+6CsIaWgFvVAxYu7Aw1xAruadzsWe+u5UqQLLBY6z+0k76JoRaBMkkcS25
 JEuj8uFaMFXD2ei4JRlUNt57apqgQNCbvhYb6KUTHwP7pocn/UNfKH5JCi9KQCFr7OzuMoLGVJq
 hED2RJ/U2jV7C
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 19 Nov 2026 08:16:56 +0200, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
> 
> The intention is to take it via kexec tree.

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794726812;
	b=C/TLwPs2bA0sHXYk5wivfabGU7U5Til19RK3K40w48qlRcWo2NhGAlpGylsCS5R3eD1G
	 8RSI9Gin8LtnkAyxQiYimPd9K91nTAKCEHf3dFmZq2mAgSXzuDWVdxKBh4Es3v8Oy3npR
	 9GJ50YtxUtXfsBVYGoTrzZnUbTz//QvWKm6XWH1AEXfLSOReQWYEjDL4S4ITkp0OMmH04
	 4NyYNDFBSssZWp89DV6JZCegMB9Z0xHb1Im+DmWZyc7itbQUG+zaf5HNn8rEpXsbA/YHf
	 xqsIj15TdOSL1sXRNroYSaTUI/IbFdOWy+x/xxBG+IQ79d4qYf3sXIyyuoY5/txJuEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794726812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
	b=x3GzCQrw+Hwr5SwBIwq0YGmpu2S1XSAIXqf+lv64cQi1LaSj9wAmCe+52F2tirH7RIcg
	 +HixOe49JSJtHG8fLA3hzYPeW41wgKLHif5mTBY4asTQLKxKNy7ulMhUCfWyVY55UgHzn
	 4LXP+HPgZ5xpeDFkM7MjfdYLzE518CjDch6QiEVwrZFOeD+sSmsC01XKbRGKCV0ynrAba
	 ruT/xaueK9q8UB0rcMC3FrfI9Kc5NmuJ37i8ChukHqDYXieVv/S4x096BBPLRREK4lHFL
	 Tm3s1pHUDRP4eiFPDzXS5L84QjYCqXUpy8XKwXxs6n0/kUay0kP6ot+4F8vnWSd+r4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0EKiv+f;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE5606A32D
	for <linux-parisc@vger.kernel.org>; Sun, 15 Nov 2026 07:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDE5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0EKiv+f
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37986eb6fa2so2476786eec.0
        for <linux-parisc@vger.kernel.org>; Sat, 14 Nov 2026 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794726811; x=1795331611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
        b=f0EKiv+f25sXRcQmBoiK+WsCsclD9PQHa+U5z3sGf3KR1sS3ZNEEroqRh6RNiac07P
         vGJPEugwLNmQaWqJhCPHikaN8XT33PRVwWCxE9PqkkLJA6butk39sYE2ryU8qCsIMdGI
         yo50td1Os6it0j1WrNa5HxnLEw4W7aO/qgSsYPJply/RpIro6UCSg0Mbr4ks/thyRkDc
         jq1OBKLqGUt/bM6QVBsbrIsF1mbjoO/AbvtSri1zHl8+S2Sf3KoNhgqJldsJW2yIuTc5
         6FJrXgJQKS6UwdWBKS3YQ4l597qJpRKbmN+vGilzta6Rl47F1I/gy3R+i3U13Lj6DU+d
         z+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794726811; x=1795331611;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
        b=j8Qv19zvj/rFHpxu+wA1kNP7dIBKMLbxPnVqEBIuh+euIWAWHdiyIaPfc5v9fSOrh3
         6JyqEixJIosFlqaZrxY7yZO9X+3mXKnGKpKvmmGoZg4X9lLFveob+8FcF1fEA/NR4P7D
         YL+ASYBF5FhVd901wN/pIkKhEjwx5nkil3MpMiEY5lSmOQBl0AgTQCi5Lszqq73UkRYI
         oe4nHqpwICj/hUtjwEZ/+li8eBVIQXN4kA+4OfdcYYAbJEv8FzXyYE7fWywmKo1QPlPS
         yNyBujx7VBJpJlLxV8pmdE2EBX5akhCaCble3/y9ygQzKEHXe1jkkjNdvab+3Dvl3YyD
         +v7w==
X-Forwarded-Encrypted: i=1; AL+hErGVIckQibIo5D9gJgHIqZKRzufu3alDQ8RZYSNeL6mmUkoWwo3r84i9bVgtt1CZYJ0IbIernWYMdj0W3sc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oZeDexJCvnhKab/goXEZTwt81RPonZwDBhjJhQnehnjLQgUj/
	6bfWkJ30y2kSB44+1EeBQD1LZuhHWp7q9rDzSWn/hARqJ14pDakpoI4F
X-Gm-Gg: AYBFou2iC3puDHGMayshbsGf3wvyveZsylzp8IXaABoCOSdA4e23FxXWyBMgJM7l4Ru
	V1PU302eNDmwb8BAyIWyP/fAJ55oKTO2aTAqgLn1kpE2TTHUJnogv5h/rlQtjrT/FPBiw0B7Hfb
	v8OGFX+K6r+EWfKTJSmlS9qLgbUdszUHAV6gx4GtruaBHtaizRYsU4dNWXm89zL0bzVTNS2cAzn
	ThhzK1Trd7SM6DPG3WS41dYlaMn5Wl01D2jfqu1EeLGqSU7t5msrgl1V4VXewdxo/M4fRJ2VaeR
	tREQ//kDq4sU8VJBj05HFwPz9VOCmIGezKdxQfo6g9Lup64SATKfoxepcgp4NJf86e+iifj9Oc2
	ByE8otO8NYvgGGPjDOKgVkBNK1TJPtq3gE8pf0qrUBZciAlDIpPdDb8ghve4bZ+hEngPJjnaysQ
	kVG8zGAvHkVLZDK7F7y7r5je58/hCpehtc4oQs1BNMF4vsEvHZSgxCJsGkhZGiW8UZ1EQaMQrcV
	p+JXDfv1AcGUPxJ/3xA6wktgMwtz+aDV3GMPd7psKsydoEd+wRPGWASd/bnMFiPbr72YjYFNzqa
	ABuKlub0sGqfC5Cf3rYshyyw8D8=
X-Received: by 2002:a05:7300:6148:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-37967dd7e1dmr11471490eec.34.1794726811302;
        Sat, 14 Nov 2026 23:13:31 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm27441185eec.27.2026.11.14.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:13:30 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S.
 Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald
 Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko
 Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>,
 Liviu Dudau <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit
 <nadav.amit@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Peter
 Zijlstra <peterz@infradead.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell
 King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Song Liu
 <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v8 11/16] powerpc: extend execmem_params for kprobes allocations
In-Reply-To: <avlTdlK9ErlqVRYl@kernel.org>
Date: Sun, 15 Nov 2026 12:33:31 +0530
Message-ID: <4idi8tks.ritesh.list@gmail.com>
References: <20240505160628.2323363-1-rppt@kernel.org> <20240505160628.2323363-12-rppt@kernel.org> <3f7af771-87a7-4ae7-9919-bc4c23bd31c9@kernel.org> <avlTdlK9ErlqVRYl@kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mike Rapoport <rppt@kernel.org> writes:

> Hi Christophe,
>
> On Fri, Nov 13, 2026 at 03:36:01PM +0100, Christophe Leroy (CS GROUP) wro=
te:
>> Hi Mike,
>>=20
>> Looks like I missed this change ...
>>=20

I didn't initially get what Christophe meant here. Then I came across this
reply of from him[1]. So looks like somehow between v3 to v8, something got
changed?=20

    On powerpc book3s/32, vmalloc space is not executable. Only modules=20
    space is executable. X/NX cannot be set on a per page basis, it can onl=
y=20
    be set on a 256 Mbytes segment basis.

    See commit c49643319715 ("powerpc/32s: Only leave NX unset on segments=
=20
    used for modules") and 6ca055322da8 ("powerpc/32s: Use dedicated segmen=
t=20
    for modules with STRICT_KERNEL_RWX") and 7bee31ad8e2f ("powerpc/32s: Fi=
x=20
    is_module_segment() when MODULES_VADDR is defined").

    So if your intention is still to have an executable kprobes, then you=20
    can't use vmalloc address space.

[1]: https://lore.kernel.org/all/1cb41761-29d0-5d33-b7c1-0ca3acaa810d@csgro=
up.eu/

>> Le 05/05/2024 =C3=A0 18:06, Mike Rapoport a =C3=A9crit=C2=A0:
>> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>> >=20
>> > powerpc overrides kprobes::alloc_insn_page() to remove writable
>> > permissions when STRICT_MODULE_RWX is on.
>> >=20
>> > Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
>> > generic kprobes::alloc_insn_page() with the desired permissions.
>> >=20
>> > As powerpc uses breakpoint instructions to inject kprobes, it does not
>> > need to constrain kprobe allocations to the modules area and can use t=
he
>> > entire vmalloc address space.
>>=20
>> Using breakpoint means the segment must still be executable.
>> On book3s/32 VMALLOC segment is not executable, while module segment is.
>>=20
>> See commit 6ca055322da8 ("powerpc/32s: Use dedicated segment for modules
>> with STRICT_KERNEL_RWX")
>>=20
>> See report and fix at https://lore.kernel.org/all/ed03d290d440d579a81ae0=
b7de5243721291d903.1794543909.git.ritesh.list@gmail.com/
>
> I'll take a look, thanks!
>=20=20

Thanks Mike for taking a look. Sorry, I should have ccd'd you there, I
guess I missed it. However, the changes are these one here [2][3]

[2]: https://lore.kernel.org/linuxppc-dev/82c4973addebd82923c460cb44221f5b7=
6146afe.1794572365.git.ritesh.list@gmail.com/
[3]: https://lore.kernel.org/linuxppc-dev/f75f2cf97f44375fd2c8820e0caeab703=
cdb371c.1794572365.git.ritesh.list@gmail.com/

-ritesh


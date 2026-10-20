Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489252;
	b=hIvL4ZSSWspYBs87pd5GQ7QMBEL+2D2a/LcrWi3udH9yDkFQ7FyPCUM3h6wt1+G9V+K3
	 jxuqqLg9+cM0sCTqaBsFvl1HDMoXbM5h+tIoSku3v1rsit5zBTcQK5NR4tiIfPwrX59yt
	 k02MBQ8K9mM5oDA5pUcQ58eGJljILQwNuaKZbjwxT/QCJBJgr1R1QizQ9A8q0u4E5YD5Z
	 b+83LZqE/3ShmUOFRooIRokrjFIFCbN1dEs00M6rUUQAYp4OU2OISD8TR3LM2i1RO9JwO
	 /GutBCfL/TVvCAEJIvYg7To1iDQQn9oaN76UPPk/rmLE3/bTMTEOevSuog6MUd/vp7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A75WOahLsxv+hidbJl57jAQmkr4ntTiQuJfofCyvgAA=;
	b=rHMzXKBi8O3DyEHvWqXqP7PeCmgTXPZFYVZV+WGZh9CuYispmRCzjqtjL86jPQAqMuHI
	 uskdc082EX09vmDhrKYbomD+9U6XdzHkSiruS5tDqt8P38P8cAzd6kTvZH2Ft/i9i6fhZ
	 Ovpx0VYZHzZM1PHvnH3PyUNk5cTa0igxO0HeA4EZ2jvTdbBn3aNh8LNqkWvbCkEJRKZyI
	 DzjcaqjykF70JTIWeJ5iDYZaV1jBTr+igPKjHq97j2WRhRGc6UeMfeOg8o8IbVQKSe5J2
	 VRpGScXzFJJqzHCMKfMqWyo7HhmgSg8nh+oTqCS/9Jf+JEMhxGMI4UeftL3/IOVXd3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XV4Cvim9;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573360A3812
	for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 09:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C573360A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XV4Cvim9
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so22597305e9.2
        for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792489250; x=1793094050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A75WOahLsxv+hidbJl57jAQmkr4ntTiQuJfofCyvgAA=;
        b=XV4Cvim9PGmRPYDYWPvQxtCfIVwqwnzysqMcwp5ZopGQIZiwPM2c/Blf4nJty23CBX
         MUoruMd6T9T63oEUmvZDXPd3ykx9ceI+H/n0o6nSaYrKuLSBL+A4r1koIYW8OJJCy08d
         ogtgHykli4AdY+EDDENGKkka9QeVdV+NA8+62bY2rUbUk7Mc4T++oXX5CZN1xWDiJP8D
         ceMCkm7yuea88WI9Ugb7ISrBk64f7qcNE6jvwRziPHMQwGdJ+Zq++ik8gGD3PUVZNgkp
         g6QyDPzCN8CfWcseqJAaXh7BiG+/dwz9S2vUmThYHmNrUxEZivkLhOZWN72QgpkyQDCn
         daDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489250; x=1793094050;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A75WOahLsxv+hidbJl57jAQmkr4ntTiQuJfofCyvgAA=;
        b=ZedpaVyqP7fgxDIOjv5ND7RlkrvYPxTp1Xie/dk1Nt5yAI3VtfPlmiG4t+ElQfSyFG
         qGNcsB0OnBd//J0msmsJn7sdHDMshZmyAhe7DPVCmY4Qf9d74koYZwFY/shM8zsV6ysf
         9IpgDYwauOS5FhLsS7Tr1MYd+MCbYmuU5c9sIwWpQJnuJrXzuNkGYECBp+TZp1JdznUI
         PMh1d9RG9zTjANTV8b3i8c1hgo7X/XVD681O7D8ryWH0AmXwZM3kjkCukWijhh0LM1ey
         TJL1IBBtp6nYw1jeeh3KQL7z4vdNZLmbKJbYiyYpsPk2wS4Ea5zhQwdthlNMR/krWNaF
         KkuA==
X-Forwarded-Encrypted: i=1; AKwUvBy0O+ryfNhPVZ8oAq8FpkVrTO+SqKq+ddZYqBjnoaVsnwKgtYorzIt1kDS7HHKcWCkYsLgStuSzw5IuOt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0mLmpEHtrf3hPwTj3adgsagArl12NZp2a1n1ZoSj0XDwWJD7f
	/ff5Dm4qj4t47FY8dm/kSwLzwKwa0JGkb+5G+d8vE9YGRMuldULMBw85
X-Gm-Gg: AYBFou044fCUa5g8C3gJb/CBwDp51JAX53UqXKZwgqL9w/lUl+ZCDhdrQsliWF9p1yf
	Fz4iB1kvoJ6J30TizvslxoWYBE2JeVlhp4sLdJIo4nOqQQWKf9QQYckjWcHUhfRJEwDWUb3/Cx0
	/L5b771gCqkhTjn1xRb6ut1zns+8ef0xrKW6VtEQuI30RFHZI4kb0Y8/1JpfhdUMMMs+BtJN0IF
	UGP/vzYRZBCUcKHFGKZuZCWR9ZVnYwy2nWI0hLcobfhYgkd3K7xhGGzXpE57PyyHkUskdKze0lz
	zm2px3SO9vsjSRf9WRAih0yCyhGrXoqlN41jV68EU5enED/I3Mo75tzobxH9OK/gNPHrEvC+WgP
	mfBoMZtpBDGVQcWWfO9qGO6mNLHpjQ3+xd7oQf7ACaZUnqReMjMzx4H6Az0FYdzsrOvN5Hvsp/v
	Ea1JJbuPNCRcYlTRh0cP9UwLoGfSiJDtaSwKVAKFrpUDbAC+3F8SZmTQILE5vpa555CRgEkv+CT
	yx0wUMOVuyTnd1Wv9S9tXlGF0IrE9uLTB4=
X-Received: by 2002:a05:600c:4e11:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a1d75f24b4mr211056285e9.9.1792489250061;
        Tue, 20 Oct 2026 02:40:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm64517275e9.13.2026.10.20.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:40:49 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:40:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, "schuster.simon@siemens-energy.com"
 <schuster.simon@siemens-energy.com>, Ley Foon Tan <lftan@altera.com>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH] nios2: ksyms: Declare __mulsi3 export
Message-ID: <20261020104048.7b038bdd@pumpkin>
In-Reply-To: <c32b7ed2-fa3f-4a58-9300-21efcc88f056@kernel.org>
References: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
	<47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
	<c32b7ed2-fa3f-4a58-9300-21efcc88f056@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 09:34:42 -0500
Dinh Nguyen <dinguyen@kernel.org> wrote:

> On 10/19/26 06:16, Arnd Bergmann wrote:
> > On Mon, Oct 19, 2026, at 11:49, Thomas Wei=C3=9Fschuh wrote: =20
> >> GCC may emit libcalls to __mulsi3(). As modpost is not aware that this
> >> function is provided through the linked in libgcc, it fails:
> >>
> >> ERROR: modpost: kernel/locking/test-ww_mutex.ko: symbol '__mulsi3' und=
efined!
> >> ERROR: modpost: kernel/time/test_udelay.ko: symbol '__mulsi3' undefine=
d!
> >> ERROR: modpost: kernel/resource_kunit.ko: symbol '__mulsi3' undefined!
> >> ERROR: modpost: fs/fuse/virtiofs.ko: symbol '__mulsi3' undefined!
> >> etc.
> >>
> >> Make sure modpost can see the symbol from libgcc.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes:
> >> https://lore.kernel.org/oe-kbuild-all/202610171933.J4bFOfL8-lkp@intel.=
com/
> >> Fixes: 2fc8483fdcde ("nios2: Build infrastructure")
> >> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>=
 =20
> >=20
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >=20
> > The patch looks correct to me, but it would also be nice to not use
> > libgcc at all. What I see is that only arc, nios2, openrisc and
> > parisc still link against the toolchain-provided libgcc, everything
> > else uses the kernel's own runtime.
> >=20
> > It's probably not even that hard to do right, here is what I found
> > is imported from libgcc.
> >  =20
> Patch applied!
>=20
> Thanks for the suggestion Arnd, I'll work to on the NIOS2.

Does the kernel support nios2 that don't have the optional multiply
instructions? (including the ones that generate the high 32 bits).

If the compiler knows they exist (it isn't the default) then it should
just use them.
The fpga almost certainly have plenty of 18x18 DSP multiplier blocks
than can be used - so the resources are there.
(The slow part of the multiply is actually the ripple adder that
generates the high 46 bits.)

David=20

>=20
> Dinh
>=20


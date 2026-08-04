Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6238D688;
	Tue,  4 Aug 2026 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851398; cv=none; b=PIG3XanoplPWDMBv8JuhrJlogpElQdnVt3Vyf/BFvF/LtmNllAe3YFaluWtkm2dhH1P5G0/E3F3AikFUr0Ibr8z3TCuZwkkQ2MUH/Wd8vIMPhF8BBPxe1mDJLNa16DOE+xM9Z+8yROvO4BnIPcPB7e9vfuIGrOb7kVVm74sOUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851398; c=relaxed/simple;
	bh=x0zZrFrlPPywhzoeYysncbUZOb/iTPww6k6LOdofVpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVzv4DYev1t8cjkovN6HmBs9+hGsYqpu7g6JGIgFiK1h553uHp0hXVnFSHxMrROscYUhSdbccOkapObcZoKDUUyPcBTIBI1x1r8DIOaXt8rPEMegXD2t8/EPsjDLqx18pm3U4XgFykl7IABuTziJAn+0uQls02ohQmM4RfF4vag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=CoF4+Hhy; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="CoF4+Hhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785851391; x=1786456191; i=deller@gmx.de;
	bh=qI/6dkheWX/+kLZr0gyJrhCp4aW+79TlblFN4eDeLn0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CoF4+HhyCCqzd0VsN9o9978r+fBn16t1fL3vA0krkrXpq+99hNnbIgwVRiwsC0hd
	 SY/N3hKl5J4pcGN5SU0S9ex8OqjlItsT/suULtpF4GL90BmEtNRP4tGy9dfRtK6YS
	 Fr3ZSJLGfkyT+QkU2/rOGZRJjD1CzdjCqbEufvzUiZCbEGtRjpFObHNIZsYQGcpM7
	 4Sz/DUmub6LpWQRIOHBqjt7cgCm7xj/ANXRA0R/uIVMeGZJpLGdis48knvlfj3Yn4
	 V3AyWJzzl/YjjEhZhjE4w2cMJihjgUDlqmwczkMD8Ih0U5jZVbFE6DgijTz3Tmvx6
	 tJF2V75Yg7AEMQkk8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49lD-1wzX0221ez-00rNv7; Tue, 04
 Aug 2026 15:49:51 +0200
Message-ID: <2f73a2ff-3078-4973-b38d-d199dbfb307f@gmx.de>
Date: Tue, 4 Aug 2026 15:49:50 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: sba_iommu: Remove dead DEBUG_DMB_TRAP code
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730094501.3002718-1-usama.anjum@arm.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260730094501.3002718-1-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:esjI7yvdun5cd1viXJe/vbM5MwnWEaWkJ5zUA845qX+47v015qv
 WyikAU7Zf9tFwn1W0jQ81CaxrOk9z0w8ZI3oPuKXq9QCBqYnPml3JDPCc6SJ8bkBHNOZFUD
 MzfZ7XwU+U8SzNvqcpKtyH8zHWy+3/LJwNP940XZdCn7KN+aBPBLA64Gt6ftvXpqahNdZbz
 FdtmHareopH47wGAQ90Pg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Wk4CBJCuxbY=;kQS123voYYvFIt08bRwgHRXwkai
 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

On 7/30/26 11:45, Muhammad Usama Anjum wrote:
> DEBUG_DMB_TRAP is unconditionally undefined, so the guarded
> declarations and calls can never be built. The declared iterate_pages()
> and set_data_memory_break() functions also have no definitions in the
> tree; removing the #undef would therefore leave unresolved references.
>=20
> Remove the unused option and its guarded code.
>=20
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>   drivers/parisc/sba_iommu.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
applied.
Thanks!
Helge

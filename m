Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18F5401A07;
	Sat, 25 Jul 2026 20:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785010083; cv=none; b=Q0P3DJ1/n5//Ehuqjr6YhVwbo6fjvzwBqC0pUYQd+a0xy2x0HtsggyBoQV5JUxbIQn7x724QzaDqABnpRS3KHhEklQ5mVU7eI3Vl7RCldI3eJar6MFeP0yI4ArsNe8+8wN8ykvJE2KgI/wnfprjzbO19SlV6OGoq9pR4x1progg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785010083; c=relaxed/simple;
	bh=Eq0wZqTa1O7hVLWbef4IxAKIDW8G2j6olw9bzNn5kGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FF/as1KUbY0RV+ri/wRsfqzOSh8Qb5DRbNe5OAurdnINTV4dBCe1Ix3NiDs5h8lXYGr9N0/CIIDqsJAwB9eGxJ4atQNsCWIRSJsbj7IA9z8mDAirbJ2vT/12lTyN8iMffJd6iYuM3pHYfdP6Zgf50bwqnZ07MFJFidFf8rq7f/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=f1vxwfKg; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="f1vxwfKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785010074; x=1785614874; i=deller@gmx.de;
	bh=z+H7nndP4bKUyZusZFqUFq09NElNuzNEFjJqpsxq594=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f1vxwfKgb4eyjlyGjZTPCegogyi0so5gdblRJjE7kM587noAhcnuFKQ35rHr3hDC
	 AbgREoUIn/m7vFWRFvzxsq2vzy0Z3JbF5iA4R0LXRX/NU9zB1fM0k9rbKv3/+qUna
	 w/9rzoZpjPdgvPBj/rdwkwilVxU3rJRymxJh5t/hVPlxoOsyKEp+/wdFzW9uXEdTu
	 3zf8IGA39bfA1dd8OtNs3k5QIYua4F1usiAIyWWw69/TWhYQs/MD8M43G1xJb4J6W
	 0lGPUR7bZj2NV9D+ulco0vrOPpiPAjYVICR1G2atinNHXmZwA+iSgy7BSpDAldkKK
	 hGfELmXUxMZl1GF8YA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1wSM3v43dK-00Ilis; Sat, 25
 Jul 2026 22:07:54 +0200
Message-ID: <8e9adcc1-5dbe-4e06-9383-48334c13e557@gmx.de>
Date: Sat, 25 Jul 2026 22:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: superio: Spelling s/Peterson/Petersen/
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <feede3d4d3203379678dad30a78305fb17dcf939.1784012424.git.geert+renesas@glider.be>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <feede3d4d3203379678dad30a78305fb17dcf939.1784012424.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y2WgfTMRX7gVwkEUsW+jQUffga33XnPjpKZBbmKix0O4Npp1yF5
 TLPmoq/AYVugycFYkI+tr1yIh1Uxn5JkLS/LRjKElBkXmlaiyiNfOY3FY23jH7yYyUCn2lZ
 EDUzxfC93/wmPn1FGnsSLuIa/LlsZyIzs6C3lv50j9no66IZ+1Lr8r4xR2m8Egk4Bh8L2UT
 iFOzooKq6rBLJ+xoT6LvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QyYj2lwdni0=;NNjFtzq4kI2cFieTvWJE7xrgwnw
 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
 r7fsLP+/I=

On 7/14/26 09:02, Geert Uytterhoeven wrote:
> Correct a typo in Martin's surname.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/parisc/superio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
applied.

Thanks!
Helge

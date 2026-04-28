Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D228370D55;
	Tue, 28 Apr 2026 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389686; cv=none; b=dxVPEd+YsfJH857Pu2IDgemftLrh8YFacVuYO0+ElhF8uOs7DDg23oaSvw8y+225Azd8//YRTDD4BwoTsuDi39K9vrONoNwD7SjLnR7+k8k6AQnweA2hcqBEa1hIsJIOsbSqjLLltUjDyQpqy/ktRmKwrEP0ktrWqAwDXO0AlrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389686; c=relaxed/simple;
	bh=nP3914jq8370wB7Lr7JRwInx+TiMES/oR8XMXNehHt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOphpKFGFR61cn5tfTCoELlGXDMRpOk5/jAw/EoclCb2L32dMwTX2d4MJDpiJ7FF9D/hiMemRWSIVaYUOu5gC6oCYDpfOpTdD3PmQ215vhEnJrOZn3qaOXX4TjF07TqjCSjsN9fU3y5GLl4+gD7B0IpCAyCWXrcMu/nEAz5ms3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=Oz+8MOeU; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="Oz+8MOeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777389682; x=1777994482; i=deller@gmx.de;
	bh=qnxVUvRtGwHhP2qGSfX+RrUlPlaJgfne6omepYVAyP0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Oz+8MOeUo+R3+3+qxbiJ6+o0sD4vSH+d/Z4O1CowHMhZwsKlR2FOnUAm3x977tM2
	 cDwywCgrwsu4Vi8CiDZu0Obx3JImb6+tI6bKlivT2v4yuBa/rYTdwaxUmob4M5rNp
	 hJRwAVrFIZv6bihS5BNwjfcRoJ+N7bA661F3hnV2owDYOYgTOmBgMo2mytl+2fH7x
	 iY7iA7buysOAZ/6qdAPuCCqTTdZTdMjAvx5bTfXl3VTgVld0ywKByGKz2Mwo9F4Kl
	 7EVI5Z+rcvaq9alP197/PuKZIf+fDQT55qqsL4uF2E2sV9J0YIisoozfXaFGnS15l
	 4tJhoHo39cuqBPNexQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1w7K6y0v1O-007oDV; Tue, 28
 Apr 2026 17:21:22 +0200
Message-ID: <7f3b08ef-6ea6-48bd-ac3f-e8e904478fbb@gmx.de>
Date: Tue, 28 Apr 2026 17:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: drivers: switch to dynamic root device
To: Johan Hovold <johan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260424103211.2616426-1-johan@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260424103211.2616426-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M5zE5SNRRoxIxWwQbB7D38JTBDysa5ozGV7Ux2YMOCVPVDIzyga
 hGIYELl/VZbiJsICvSbLCWQK6L+Rptp4K8LS/aCDX2pBFtnVc8Q0iigGuD8u1iT+i49/2t/
 pv/OJlDIIySggci46Sf3pUJ+aRcRPTf9SuT05X/m/OeP3e9bghWKZAxMwigNaIi1VCTmCYG
 9cXq3Duy7DKoNeGHWOFLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1mQcH1V2+Wk=;BEqWpb52sKHLIt3NDzLSP7eRrio
 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

On 4/24/26 12:32, Johan Hovold wrote:
> Driver core expects devices to be dynamically allocated and will, for
> example, complain loudly if a device that lacks a release function
> is ever freed.
>=20
> Use root_device_register() to allocate and register the root device
> instead of open coding using a static device.
>=20
> While at it, drop the redundant additional reference taken at init.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   arch/parisc/kernel/drivers.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)

applied.
Thanks!
Helge

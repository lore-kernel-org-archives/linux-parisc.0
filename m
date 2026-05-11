Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5593A9D99
	for <linux-parisc@vger.kernel.org>; Mon, 11 May 2026 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491304; cv=none; b=ibEyfJAYI7qPtAYRDhSkT3icKyjtASUXYvcxuSNSklff6bsE0oakSqESgcji+wPha/e9kAGglYC1P1eSVBEQx26JcXXIFi57DymYO/R7749rqAd48vU1eVQia2O91v/tpTSnHrRI3HnBQuUatfcpbFpaKr3uxjxfqOgWj+ujc54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491304; c=relaxed/simple;
	bh=yTA3EfMFNqWtw4mwbSh1QoSBedE1rcjpYMGPIfcrLnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqRXAeZFNOk1lGMyuFJYtw6mAQW/YBltxOvUUcd1OuFFdRrZbyY+hMqlulK+kV6HJE0SEYAQJ0838eIPvd+xMDhbUZI3RMOvurm6JFGTTHHTII7w56bNTezScV46p6J+2hizHynW1BiSovs2XB5nKblorP1wRpipSYBBadyoDt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=vYxxJc85; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="vYxxJc85"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso24505755e9.3
        for <linux-parisc@vger.kernel.org>; Mon, 11 May 2026 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778491301; x=1779096101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTA3EfMFNqWtw4mwbSh1QoSBedE1rcjpYMGPIfcrLnU=;
        b=vYxxJc85V/35JiUXFNYmo0LerbGRF5e+QTMsSTky/PLHoHIXcQfhHeEmbjWBQLjGGj
         srHQ7Hor7sJDV69koBiim96BM6DEtzFk1x5lmFs8xXLmiTM4A8tZN+sCE6j/fpqZRfbG
         BbqT8abivpaCYn1MOxRPGCJL3tKCnvHEX9I37FvzdHLKlR9csX5LywataW+c1TMTuA37
         0nToyUBRw/8kCdFEAMVvNrZXBoy68PJAgBxSciwUkAMeXTVYngR6zURWuVjgiRl+vLyp
         1AzXruTSGaRmUI3xjY7I86b5FES6SMPdVhgTGpuqMDLMBswvmBeu1b65y5xgDhNb1Z16
         rOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491301; x=1779096101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTA3EfMFNqWtw4mwbSh1QoSBedE1rcjpYMGPIfcrLnU=;
        b=P0ZFujoOkADE8HLmfYsQRb9zpUBqCEqRols3mgvdoE4sQmxLbBcuvrsndFqGAa86xc
         MmU00kDteDcq2eJlN3OmYy4ySj2plo9p4OdDJicZQX14d4+fC6ZBN5NS+oU5HoQpgZRK
         wzxIyjU8nYMOlclArh6gnEYyExmsyI57QhDdSD0HqCpwgjvxGk5K8eVRKqA+0hAT5hAN
         jkRNypIW7UI+k1tvYYFsZkQ+XQCtBwSkVKNGCjE30JeKVj/7n6Fou7w56/ENz78bWlQT
         nDblW8dTyUn2uFaxOsabQ7+w+t9S2PCC8hB5YrVC4tVSYd9TwJCJsJvEize4xV5Ch0cc
         heaA==
X-Forwarded-Encrypted: i=1; AFNElJ/wheAU+RjGudwoJ67IAsh3KesVseXGqktNNC6irr8bpUA43up77pdZNTWQ6WPzuucTFuh4+dXIAB2gNfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZD8M2zTFYkpouedU9XfXTM6bddKduMjYa2CzjD/g9/ys8xIP
	FlmprvlP6SXwVb4r0zqenglMBv/xBBk9qALgdJT8XvjUobXBjMDrgy9ZvUvFPxzRyNc=
X-Gm-Gg: Acq92OHC7jjvI016CrjTltPqpIXeRj2/n3/GorSGip9V+yC+75RO9FVuzRewCi6L7AR
	3Y+KzQVlvwBzWRf5iuImULxq8lcrkCIuj6oZiYs7WKh6a4HTjTBASB2UMwPai/5NozzhT/AF4sQ
	JtfWzoS9bnjRAoNrD98/jBFZswdClfrsDJUp0K8pL8G9spah43xxX1vnbkgz262CA7AGYE+2Qbd
	hUGF/AfCk/EUtLZohLkLjuCUk7T6vCpq7aGJLq32q35B3lDsYLmPCxS7d1zimFdExwlcEt/dIhy
	z3dMux4nRW56B9liqPPp9SqF3vlXQI3eFqwjem3RkiA/W0jFOwn/OoolowcuSoNqTcAd0CGVvcz
	+QAKFjRl3W7CNiXyDtuACUT+petSkJrL/qCqxg/TuFiypQsbZLK66atqDDX8yb9s/tfOwuZ2Bl3
	SgxwWp5uS5n0VGCkujN0EDn8jHDdIbJwJDG3aPc813YOTKz9TL3D/8y9d8pXkZKaYR1kGptyHEO
	O0V2ah4zKdySDc=
X-Received: by 2002:a05:600c:b8d:b0:489:1fa5:997f with SMTP id 5b1f17b1804b1-48e70691673mr134646165e9.9.1778491301044;
        Mon, 11 May 2026 02:21:41 -0700 (PDT)
Received: from localhost (p200300f65f114e0841c796eda31a14b3.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:41c7:96ed:a31a:14b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e7041c4e8sm167443115e9.14.2026.05.11.02.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:21:40 -0700 (PDT)
Date: Mon, 11 May 2026 11:21:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Grzeschik <mgr@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Johannes Berg <johannes@sipsolutions.net>
Cc: Steffen Klassert <klassert@kernel.org>, 
	David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>, 
	Mark Einon <mark.einon@gmail.com>, Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Manish Chopra <manishc@marvell.com>, Potnuri Bharat Teja <bharat@chelsio.com>, 
	Denis Kirjanov <kirjanov@gmail.com>, Jijie Shao <shaojijie@huawei.com>, 
	Jian Shen <shenjian15@huawei.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Fan Gong <gongfan1@huawei.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Yibo Dong <dong100@mucse.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, Jiri Pirko <jiri@resnulli.us>, 
	Francois Romieu <romieu@fr.zoreil.com>, Daniele Venzano <venza@brownhat.org>, 
	Samuel Chessman <chessman@tux.org>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Kevin Curtis <kevin.curtis@farsite.co.uk>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Kees Cook <kees@kernel.org>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, Thomas Fourier <fourier.thomas@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>, 
	Zilin Guan <zilin@seu.edu.cn>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Marco Crivellari <marco.crivellari@suse.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	David Arinzon <darinzon@amazon.com>, Yeounsu Moon <yyyynoom@gmail.com>, 
	Denis Benato <benato.denis96@gmail.com>, Yonglong Liu <liuyonglong@huawei.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Yicong Hui <yiconghui@gmail.com>, MD Danish Anwar <danishanwar@ti.com>, 
	Nathan Chancellor <nathan@kernel.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Larysa Zaremba <larysa.zaremba@intel.com>, Ian Lin <ian.lin@infineon.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Double Lo <double.lo@cypress.com>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, linux-parisc@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, oss-drivers@corigine.com, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH net-next v3 2/2] net: Consistently define pci_device_ids
 using named initializers
Message-ID: <agGfbyxlKC8WcEdm@monoceros>
References: <20260511090023.1634387-4-u.kleine-koenig@baylibre.com>
 <20260511090023.1634387-6-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26wz6vcj2wzkdd5i"
Content-Disposition: inline
In-Reply-To: <20260511090023.1634387-6-u.kleine-koenig@baylibre.com>


--26wz6vcj2wzkdd5i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v3 2/2] net: Consistently define pci_device_ids
 using named initializers
MIME-Version: 1.0

On Mon, May 11, 2026 at 11:00:24AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Forwarded: id:76da4f44d48bdde84580963862bf9616bee5c9e9.1778149923.git.u.k=
leine-koenig@baylibre.com (v2)

This is my internal marker for tracking mainline submissions. If someone
applies this revision please drop this line.

Best regards
Uwe

--26wz6vcj2wzkdd5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoBn6EACgkQj4D7WH0S
/k4q9wgAnNsetoJQuSPdcsRqTfhJ3nvDxBsfxvsce6Raf4aiAs6sa5jJlBrTa5h3
nEaIsI15hqOx2W/FeLUG3/e0pnGua3DO4qsTmtY+G74jweYDfLDdXlEHlt9zNS6x
lDrxCXGPT97KmN2CifwJILefl8Lv7jTwROdpFGiVt85DXbiZtFIL/frdeU6leU+1
FdE6JY7j/Qx1jjdXNf0bWzAYX8PJ8ocHv+b0BcV8ctfX7hsV/vxsLmUU0goDLYiO
u683/fMBDCwmEtoIHKOODM7mPIJAndSocuWgR2Fn2xqlVyooDPuS9d0p0wTjl2qT
eA7SLNWIZbT2fhIZM4FV8lAwHsMj+w==
=qcwQ
-----END PGP SIGNATURE-----

--26wz6vcj2wzkdd5i--

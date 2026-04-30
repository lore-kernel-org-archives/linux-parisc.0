Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EFE2D9ECD
	for <linux-parisc@vger.kernel.org>; Thu, 30 Apr 2026 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562576; cv=none; b=nqWItZ21//M8BAygahCGoM3jZ6e44FFCRAmW7fwmlZxwsV0vIbn25+jlZixfyRRUc8igTl1mByFtOg+5HA2XCTG6Fq0DEQmbeDrIal/FItpwapOzvivZZlzOagWkUMb0nwJ/ghynnv4g18BQxj2vAiKBK4i7dY2NjZFsbjB1Ljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562576; c=relaxed/simple;
	bh=jfvurasXyO172rf8RueovQ21HocKi4qC6cmZUk6WC5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdo0o63oMEW6zVJCH0AQ85F0xIVjdi5jSCKYl7FVrt9nVlaROdo/L7c9jhAowSK2zDEs/N0DWvwMY3dzRJYdp5SqmAv0C9sARmYweHusAboX4bFcHQgX5VZd+jPxKKjOssnpLEHHcJK0lx7VTcmgbL8L2zczjrNbOqmWKFHwlgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Eop/0EeR; arc=none smtp.client-ip=74.125.82.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Eop/0EeR"
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so490715eec.1
        for <linux-parisc@vger.kernel.org>; Thu, 30 Apr 2026 08:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777562574; x=1778167374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6W7N3TF0u0m9VhuQZcYonFJHVZpaP1eZOWODDM2/uM=;
        b=Bb4DlrhaLEuYpIrbHbaNQO2LY/nSl6R5DnKOGAOOmxy3eTSZjX0mLIsUXvavxxkmgI
         aj/ucw68npavk5x/qYDrZeoiSdkP4XMQcz7Ton8+d0PyLTT5V06WDqEpfCKHGfU5jkze
         mhKT1bj/EjDYVWGL6P5L4ZzL+umOKNYgFIILC1xYBJlYeAyfd+BnuxzZtTNvK+gdqHu9
         bRWlEW76LEBetfooR+h8hS5s9M5bkKOFQbVpY3lHI6Xf03j7D15g6UEXWwCm+1HE1cuH
         kwzw/mJYRtY8+i4zKT0uYdAS0H/O0R4QOOsrb6onLMBDbWGOnXqsLAtZnxp/wv5r5hr7
         F5Vg==
X-Forwarded-Encrypted: i=1; AFNElJ8hFAZIlY0DLKEYkTW9T3nQ09+GtRAautzjk2dV1FsX5GOiH6iNkJ0CoWLdP1tEmoPPuO/hjF3WtWCBVT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6Pc5qUetz8sNNVJmr1MqwOUgFVlIvEHRHCEogEcwJk0Z+aMe
	vuTREzj4E7z3yWV6xncjz02Imna1V+YWRhrfNwzYqolx5QzavGA3TcT8bLfe12OqhseIeZ+pXKO
	CMl8FzVWhMh48n+f1zQ9b2Wl1/AOlyZ3OTVa9/414rUI8m/Zk3N2qm/GqCda+XcnnZ1Nx406dEB
	Jns53VuttM6NGzKUTquFycq5XoR/v2V/rz2/yJM46qPXWkdFHVpEMGtxfVlHGxR/tEggg/gLzWI
	kJC7nCNzDXTnWYwBuWPbE520A==
X-Gm-Gg: AeBDieu3N9Vqu3qcvpFaQRw5HP5RoORMxb84+Yw9nmHf/2dT4jKRbNIq7mrpysNKvte
	hek2PErmJgDgnzbatHTcvhEEyzAjVTx+qQSq08T37bePgNZJM/lfKiT0A+grOhPHXTcVhWubrhG
	ZP99q5V/P6ShiBoylHbC7Bx7f4ZoQOQ38fP0Xp1sOSJDItdwkKj3qAc6xLuSSPU4eTISbHiBjUq
	71BzZ7tbLr4S51pB76MlNN/lJ12bdeBWmDebIcQI7GgoRrU2Ix9Y7F7Ws5keWp9szzwmqtDuvVV
	KwhUK2XAVij79wTe2zMC/0xsMSmoR4omPlTD10fxeLXIsEpZklwEA3cdK1bNUZkDY3aZeWNzIiy
	qoU4u3U0IWdRfu7Cw/uH0y70gozannG1pnN5LMNK+4jX+o1ULtGQn7aAu4nyncC/szVpNxPVqNt
	TJMnW5rwYniAgcmmh4lgrqgoXHhvsnqmtuFPAZA6Kb4fbSchUJnTvdYuDmIWqE6Y1eNPEKZjE=
X-Received: by 2002:a05:7300:7b95:b0:2be:a2d8:e9e3 with SMTP id 5a478bee46e88-2ed3e67dd57mr1779945eec.29.1777562573958;
        Thu, 30 Apr 2026 08:22:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2ee3bd698ebsm11321eec.15.2026.04.30.08.22.53
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:22:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d9da2559aeso2934810eec.0
        for <linux-parisc@vger.kernel.org>; Thu, 30 Apr 2026 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777562572; x=1778167372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6W7N3TF0u0m9VhuQZcYonFJHVZpaP1eZOWODDM2/uM=;
        b=Eop/0EeRdblpzLYgR1RNX59E8G+pJ0tlwFk+vaFNnPZodIsWUPBuJYtQ8bg8SmCFqS
         xpMmqY8pqFyIa5aGj5F63V1Dan6AuRc1L2+Rby0KeRDnbdSOe7mVstuz0HcxNdnggb+S
         CRPfiAOofwrh0nl+krY8lJkk45Get3McKsukc=
X-Forwarded-Encrypted: i=1; AFNElJ/PB1UK4Fb1YpoI8wb1QgnYWVAf2Lgwp+rJfZ8la1S5UD2MzKmd+5hrCNq4sVSpfWgAtb5YewSLEN4w7hI=@vger.kernel.org
X-Received: by 2002:a05:7300:fd03:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2ed3e386a41mr1602827eec.28.1777562094279;
        Thu, 30 Apr 2026 08:14:54 -0700 (PDT)
X-Received: by 2002:a05:7300:fd03:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2ed3e386a41mr1602745eec.28.1777562093564;
        Thu, 30 Apr 2026 08:14:53 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71ccesm286774eec.10.2026.04.30.08.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:14:52 -0700 (PDT)
Message-ID: <f817f781-43d5-40d0-9352-20769d9a6601@broadcom.com>
Date: Thu, 30 Apr 2026 17:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: Consistently define pci_device_ids using
 named initializers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
 <mailhol@kernel.org>, Krzysztof Halasa <khc@pm.waw.pl>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 Steffen Klassert <klassert@kernel.org>, David Dillow <dave@thedillows.org>,
 Ion Badulescu <ionut@badula.org>, Mark Einon <mark.einon@gmail.com>,
 Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Ido Schimmel <idosch@nvidia.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, Potnuri Bharat Teja
 <bharat@chelsio.com>, Denis Kirjanov <kirjanov@gmail.com>,
 Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Fan Gong <gongfan1@huawei.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, Yibo Dong <dong100@mucse.com>,
 Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 nic_swsd@realtek.com, Jiri Pirko <jiri@resnulli.us>,
 Francois Romieu <romieu@fr.zoreil.com>, Daniele Venzano
 <venza@brownhat.org>, Samuel Chessman <chessman@tux.org>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Kevin Curtis <kevin.curtis@farsite.co.uk>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Kees Cook <kees@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Thomas Fourier
 <fourier.thomas@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Kory Maincent <kory.maincent@bootlin.com>, Zilin Guan <zilin@seu.edu.cn>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Jacob Keller <jacob.e.keller@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Yeounsu Moon <yyyynoom@gmail.com>, Denis Benato <benato.denis96@gmail.com>,
 Peiyang Wang <wangpeiyang1@huawei.com>, Yonglong Liu
 <liuyonglong@huawei.com>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Yicong Hui <yiconghui@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 MD Danish Anwar <danishanwar@ti.com>, Nathan Chancellor <nathan@kernel.org>,
 Sai Krishna <saikrishnag@marvell.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>, Joe Damato <joe@dama.to>,
 Double Lo <double.lo@cypress.com>, Chi-hsien Lin
 <chi-hsien.lin@cypress.com>, Colin Ian King <colin.i.king@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-parisc@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
 oss-drivers@corigine.com, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
References: <20260428171845.2288395-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260428171845.2288395-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 28/04/2026 19:18, Uwe Kleine-König (The Capable Hub) wrote:
> ... and PCI device helpers.
> 
> The various struct pci_device_id arrays were initialized mostly by one
> the PCI_DEVICE macros and then list expressions. The latter isn't easily
> readable if you're not into PCI. Using named initializers is more
> explicit and thus easier to parse.
> 
> Also use PCI_DEVICE* helper macros to assign .vendor, .device,
> .subvendor and .subdevice where appropriate and skip explicit
> assignments of 0 (which the compiler takes care of).
> 
> The secret plan is to make struct pci_device_id::driver_data an
> anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/)
> and that requires named initializers. But it's also a nice cleanup on
> its own.
> 
> This change doesn't introduce changes to the compiled pci_device_id
> arrays. Tested on x86 and arm64.

for brcmfmac change...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
[...]

>   .../broadcom/brcm80211/brcmfmac/pcie.c        |  17 +-
>   drivers/net/wireless/intel/ipw2x00/ipw2200.c  |  52 +-
>   69 files changed, 1308 insertions(+), 1101 deletions(-)

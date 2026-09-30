Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6970C459AC4
	for <linux-parisc@vger.kernel.org>; Wed, 30 Sep 2026 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756151; cv=none; b=A/h/Zy9V5xbKkpQVuU7onxcN6AeIBYVR7O2jimjxv5PBkSZAn/PORLrtE+TPiTjxRQ2VTpSkyM9Wnz6mU64rMi8S1n0ShxjP+PK85c97B0VxZq/5hQtx+7NiwRYC09ZEkNpTsKAuObWfChdSHDMyGeo+Cef4WBqQXM9Q5cmoIzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756151; c=relaxed/simple;
	bh=hGf5SHT45QhXMybO439QDD/6j27QAPiOqO8zt+9Fe7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfWsYZ+62qUZE86crdGWqvilJdkJgf4dKTBoA4QQnerk9boQDeImJbrdrP2HqCClbIY+KQnrb0sOzSb9pkkrIAcv9d/Ey3lpbGvALB9cwPdeR7DYP6lSXOA7jvIPKgetAcVCiydwKcd0qEbAS3BNbIWwxFtOb86QGtATjaCdeoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=XBWKm/RS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="XBWKm/RS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so3047722f8f.3
        for <linux-parisc@vger.kernel.org>; Wed, 30 Sep 2026 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1790756147; x=1791360947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wA9u/pcTwn6WeT/1p6tUVMcz40b3lP8bbas9LYvDmjg=;
        b=XBWKm/RSObYh0Pf2S8swemfMfRues6nP/WXgkMyhbUXuSqasnXe0M/Keso5jCEagCd
         KTvIkS/8thFB0ay6iEkKQ54gfArH4eH3q8FTqHgxB58wrcP4r8a0P9kRLV+MN9REYbtn
         HQ7WF8CV0hHUFOxhfg94Z1I8Iugi1EKBZC7tUpyBfU0RYjovDEMM1380VcotGhB4faW8
         szdyxUyKx4SEuDQIWmsxlh8eS17/vsUFnL77eJn7pl19syNpsl8RItoJQKFBrgFuSw31
         mljelADf6qlgvp6qvmH8W1MTOQUhC4RzRduT/ixnNmq4y3tgfLz7sauxjQToz69hMxeH
         73PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756147; x=1791360947;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wA9u/pcTwn6WeT/1p6tUVMcz40b3lP8bbas9LYvDmjg=;
        b=KL7mm15R3XFyHHCS9NPB5MaFPUr6HSFFp2UDUi0WZ3eEs3mNvl9ka3crW3lX6OdTW4
         rBO1xYFhLZqbp9d0+hRZECfjkK3mem5XBQQ1yMt55QUr/739gA3YJFQjbzeNQAT0ZOSj
         /MVMcGwphRCdTRWZ9qLLwhiUJuoYwseVIY3WkWnDsqoc/vMH4/KzlkpudnNUOB9J7lcm
         GEUs0k3Z9UVWLWb/OguMYEmUvEulz0CKGM6m6ZwuWrhHAaYQnKzjIu7K++1lA+9hkFYg
         eF+FaicxPmmWDHXcMsxvww1FrFB8+/dBOWXiqrF3ljEpbOFgdva0/M9yTFQLDRk6e3ye
         Y5qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKObyOqYl1b6qm8bnkfqM9BAb/Tvx04dunUg/Zf6bnpCFTf95ZkvNYP+j2pNgbenya0GOcnx+U4pWsQl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4x0KWUgwJU8lSGEas1SmSZvhFTrNS/iXYFMFawV2zF/qykNHY
	VjMg9NY4tS78rWAC5h9fHqaVrP9uBS2gGRjdqcCdYarY8bktoHdoMLW7RhFEcPo9UGI=
X-Gm-Gg: AYBFou09bt3zFh9OnTVtSSPzun17Skg+R7umkGOeZHSMjK3nvUgFWQc5HVREv5o93ht
	dgPNN480MAnoZbRCwIAyvComv1HaRH/SPwnvsuq3K0Ah3263sWuB4rB3OS4cRFVHffAYLKW220o
	mG7eroJpQagEoQ37K7fzohNQspijVB1gCuYKd6e5Hw4ljSn4ZCmyYyMqxJSSQqHkn2txel0dpUz
	dZVr2NTDgTb3ksvjTn3HWVMqyS/Z88rQwwBnpNMXnN3m5zM3xvs3eqQguDQTOj61axvKJv9MQqU
	fNER8xoXFaKzRu3khpa8R1u7onbsRxUlsCcrxwPTf7CEJ1bbbLLKyYk+FKndJnnwsl3cFNoNSF7
	yQpDdDMJAA/kXc01qSIVxAGlmx5bMWObwaT0pRE28Dc/UC1+mxZo9jQLNzQeaL2bh31uTSVGux0
	Yyni16eX44YpPy4f1NTtYXcyw08GlZCS/ZZTVm7AQOMuHu5UVXtIAgsc+f4US6nzfBY+SqDud93
	r6SDtuJ/mwa/iGq3KahhLAGq1bLUvlkTJNN9os=
X-Received: by 2002:a5d:5f92:0:b0:488:89a6:b37b with SMTP id ffacd0b85a97d-48b02525e7fmr1290363f8f.43.1790756147193;
        Wed, 30 Sep 2026 01:15:47 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029e0e16sm1679272f8f.17.2026.09.30.01.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:15:46 -0700 (PDT)
Message-ID: <4e71fcfa-f733-4c4e-ab98-da8cd0531a02@blackwall.org>
Date: Wed, 30 Sep 2026 11:15:45 +0300
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: move the type 2 sockets out of tree
Content-Language: en-US, bg
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, kernel@xen0n.name,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, deller@gmx.de,
 idosch@nvidia.com, aconole@redhat.com, ardb@kernel.org, tim.bird@sony.com,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org
References: <20260928190800.2521749-1-kuba@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260928190800.2521749-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2026 22:07, Jakub Kicinski wrote:
> LLC2 sockets are admin-only already. We have been getting a trickle
> of LLM-driven fixes for these, even tho we don't know of any active
> user. The code is so bad the LLM fixes just turn into a never ending
> stream of revisions and follow ups as fixing one condition reveals
> 5 more bugs. Let's move this code out of tree.
> 
> The series itself is LLM generated, the LLM was also nice enough
> to generates some tests and validate that the OOT module actually
> works.
> 
> Jakub Kicinski (3):
>    llc: move the type 2 sockets out of tree
>    llc: strip the leftovers of the llc2 removal
>    net: drop unused LLC-related includes
> 
>   net/llc/Kconfig                             |    7 -
>   net/llc/Makefile                            |   10 +-
>   include/linux/llc.h                         |    5 -
>   include/net/llc.h                           |  108 +-
>   include/net/llc_c_ac.h                      |  180 -
>   include/net/llc_c_ev.h                      |  217 -
>   include/net/llc_c_st.h                      |   46 -
>   include/net/llc_conn.h                      |  114 -
>   include/net/llc_if.h                        |   63 -
>   include/net/llc_pdu.h                       |  379 +-
>   include/net/llc_s_ac.h                      |   35 -
>   include/net/llc_s_ev.h                      |   61 -
>   include/net/llc_s_st.h                      |   32 -
>   include/net/llc_sap.h                       |   26 -
>   net/802/garp.c                              |    4 +-
>   net/802/psnap.c                             |    2 +-
>   net/bridge/br.c                             |    2 -
>   net/bridge/br_stp_bpdu.c                    |    3 +-
>   net/llc/af_llc.c                            | 1304 -----
>   net/llc/llc_c_ac.c                          | 1448 ------
>   net/llc/llc_c_ev.c                          |  742 ---
>   net/llc/llc_c_st.c                          | 4940 -------------------
>   net/llc/llc_conn.c                          | 1025 ----
>   net/llc/llc_core.c                          |   28 +-
>   net/llc/llc_if.c                            |  151 -
>   net/llc/llc_input.c                         |  128 +-
>   net/llc/llc_output.c                        |    3 +-
>   net/llc/llc_pdu.c                           |  366 --
>   net/llc/llc_proc.c                          |  245 -
>   net/llc/llc_s_ac.c                          |  220 -
>   net/llc/llc_s_ev.c                          |  109 -
>   net/llc/llc_s_st.c                          |  177 -
>   net/llc/llc_sap.c                           |  437 --
>   net/llc/llc_station.c                       |  120 -
>   net/llc/sysctl_net_llc.c                    |   71 -
>   net/openvswitch/flow.c                      |    1 -
>   net/openvswitch/flow_netlink.c              |    2 -
>   net/openvswitch/flow_table.c                |    2 -
>   net/openvswitch/vport-netdev.c              |    1 -
>   arch/loongarch/configs/loongson32_defconfig |    1 -
>   arch/loongarch/configs/loongson64_defconfig |    1 -
>   arch/mips/configs/gpr_defconfig             |    1 -
>   arch/mips/configs/mtx1_defconfig            |    1 -
>   arch/mips/configs/rb532_defconfig           |    1 -
>   arch/parisc/configs/generic-32bit_defconfig |    1 -
>   45 files changed, 33 insertions(+), 12787 deletions(-)
>   delete mode 100644 include/net/llc_c_ac.h
>   delete mode 100644 include/net/llc_c_ev.h
>   delete mode 100644 include/net/llc_c_st.h
>   delete mode 100644 include/net/llc_conn.h
>   delete mode 100644 include/net/llc_if.h
>   delete mode 100644 include/net/llc_s_ac.h
>   delete mode 100644 include/net/llc_s_ev.h
>   delete mode 100644 include/net/llc_s_st.h
>   delete mode 100644 include/net/llc_sap.h
>   delete mode 100644 net/llc/af_llc.c
>   delete mode 100644 net/llc/llc_c_ac.c
>   delete mode 100644 net/llc/llc_c_ev.c
>   delete mode 100644 net/llc/llc_c_st.c
>   delete mode 100644 net/llc/llc_conn.c
>   delete mode 100644 net/llc/llc_if.c
>   delete mode 100644 net/llc/llc_pdu.c
>   delete mode 100644 net/llc/llc_proc.c
>   delete mode 100644 net/llc/llc_s_ac.c
>   delete mode 100644 net/llc/llc_s_ev.c
>   delete mode 100644 net/llc/llc_s_st.c
>   delete mode 100644 net/llc/llc_sap.c
>   delete mode 100644 net/llc/llc_station.c
>   delete mode 100644 net/llc/sysctl_net_llc.c
> 

Reviewed what I could, generally sounds good as well.

For the series:
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


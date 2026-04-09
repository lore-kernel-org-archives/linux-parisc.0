Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4063A7F69
	for <linux-parisc@vger.kernel.org>; Thu,  9 Apr 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739424; cv=none; b=BNrwIVmVrcWGVJ3ZJCH/BYOW4GGSyysQaIguy4pd/tnX/LbnanHnBHrAisrAmV3tDlNYpsYaHaBifjsywWwF3TkGDK6rD2kdZTaIOa8od+nFiFO9yDwAaF7eiooQ73i07Q0RWBNuAVDm+oHZidhf0HBUAUSCRLg2CuzzRb1pWxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739424; c=relaxed/simple;
	bh=8N+L1gz4eOCtCLR2SD6m9/UInh24I1S3iZOo1q0YSvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=c1AThmhWeHGtP/zMEKBNZcYr5ZyMVw91PhHClvT08oYHTijjvNcxjdaXNupZ3J9BOI7ZZgIgs+YpI8Qe65KU4vo97HCDxkWZjTroWFoaigTnaBpezSzue9kqfrg2TpXB40DEkTlrOpJD0+8jypMKot9vMxS1dc8o3YU0k99PPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Or/VJgUS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Or/VJgUS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so11616795e9.3
        for <linux-parisc@vger.kernel.org>; Thu, 09 Apr 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775739420; x=1776344220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zi5resqMRI4nHDxaylhlSh5hJPIr3A88NHSW9enHb70=;
        b=Or/VJgUSW/LPFab1O4g/scRr2sf5yp6vXEpcO2aivqL/wpMw/HHz68y9JzFeUsBXWB
         SQsgmZiV3jwtGYvjdtav+cRAvDAbxlOubmtQGC68hdEjh57obeii5XQf1HUBIGTEPuJf
         i/8mRY8yi3XiYvDaJdIgMJY2qYeYzA9yMkPegaurzb2ph8ALe7UcZIRfXgRCZ55rJ8MA
         pnBLeVt3HKbWv17C3+b8JMrT4aQAxrqiRZuoZOhG+zxGPcFfgx2UXdZJ0+PNgDWWUchZ
         vsPceb4UTFYeoPEDMB6TfLVdKWrsf2+UInLdD0jgMrYfDcod16tK6NEgZfSTDdAQOA2v
         hzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775739420; x=1776344220;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zi5resqMRI4nHDxaylhlSh5hJPIr3A88NHSW9enHb70=;
        b=E+lG+LGn/9qwBzqDOWpB1hS8YRtzwCkLLum6Q/lj6/kMBmcKPuzWQ1xWMqD3tw0V1p
         tqKvcv69iGbAYlol169J8i1WHVcYhhl+/QvMrX/4KtbG27viUEyNa+faIyZGXywR0+OK
         CwKDaBpj87IWGbtrvv9SEiRGafDkiOzRfgdEcMaBXKA4sjUDI4CgSOpKgJtuWZ8BceKV
         JGdOR6GPO5xynhGZo/SsHb/jvU4Zb0vst/cVIP1LWW322g0/GUS9ungSH3GFXovSL/4b
         IgSmM2BLnAFCE5Byl7L1QojyNeEkHvObAfUDg2ha5KQIrGPy+wiV94YTBWE5Gi9es4do
         AW3w==
X-Forwarded-Encrypted: i=1; AJvYcCXH48hup7bmwKsItdhPl+Gf+8ySLRgouYUVHtbjVlLZcNDBMqr2dCg0Va7xsodWaOmpM5sI15r/sEnb2yo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5StOnONy7PnCIv9K83jYrfxTQxu0xRx7A3rRDOnEKtYpQJOVr
	+wITkH3pPcMFYafeT8YMMQGDC5pXdKdqSeLrpOEZjLOZKxp3NzQl2veQIxV4/N6fOuU=
X-Gm-Gg: AeBDieuqV800WNTWx/i/xkditvmIZtEynkup8w7wWaMGhhJMptquKMg3VE9kMH4SSVz
	fw1MXxr9c3Y9NfVNt/ye5KoPakxyht3G0Dtpw+TSLxGxD90Mpakj9wv03be9rfkWLUk8hiJb4eV
	h+9pfcjEZUHnETMF+vMXgC1mm706cpNWN8ctE07p6GMidZmuRmJYQrf/r8Iv4jn2QV0Lr6dbcwF
	/zBTnYHK+YZwpcVmzbqqNaBP/FwJDpsBxh+aG+wwB1KmvQKqtDdVoRPGgBWP0PLqNsZrbG/Dx8e
	1lkxkX6ooAQVEVGH8G08A3vFaYhn7XqIw7t95D48ysNEuL2wr6D5Ci26fvxjIoFWaGW1xJJDkPo
	cQoWLeGsos+DPv6BHmh5cXkRZRt0tw59WAlVXduhj6jca/ZJy0xUl8pvvawO90mR2Faw0DPiEeq
	+mqqyEM4ZidPLf3MvG8Jm9L10+1rvBQua1Hj4vHDC0jlHX
X-Received: by 2002:a05:600c:3f08:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-488996d2323mr417321415e9.3.1775739420375;
        Thu, 09 Apr 2026 05:57:00 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a7223sm63022433f8f.5.2026.04.09.05.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:57:00 -0700 (PDT)
Message-ID: <8ea1cb60-7112-479d-8e05-62506dd0d54e@suse.com>
Date: Thu, 9 Apr 2026 14:56:59 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module.lds.S: Fix modules on 32-bit parisc
 architecture
To: Helge Deller <deller@kernel.org>
References: <adVukQYvRuuC5F-K@p100>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 Josh Poimboeuf <jpoimboe@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <adVukQYvRuuC5F-K@p100>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/7/26 10:52 PM, Helge Deller wrote:
> On the 32-bit parisc architecture, we always used the
> -ffunction-sections compiler option to tell the compiler to put the
> functions into seperate text sections. This is necessary, otherwise
> "big" kernel modules like ext4 or ipv6 fail to load because some
> branches won't be able to reach their stubs.
> 
> Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related
> macros") broke this for parisc because all text sections will get
> unconditionally merged now.
> 
> Introduce the ARCH_WANTS_MODULES_TEXT_SECTIONS config option which
> avoids the text section merge for modules, and fix this issue by
> enabling this option by default for 32-bit parisc.
> 
> v2: Introduce and use ARCH_WANTS_MODULES_TEXT_SECTIONS option
> 
> Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: stable@vger.kernel.org # v6.19+
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 102ddbd4298e..78abb8be1e63 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1128,6 +1128,13 @@ config ARCH_WANTS_MODULES_DATA_IN_VMALLOC
>  	  For architectures like powerpc/32 which have constraints on module
>  	  allocation and need to allocate module data outside of module area.
>  
> +config ARCH_WANTS_MODULES_TEXT_SECTIONS
> +	bool
> +	help
> +	  For architectures like 32-bit parisc which require that functions in
> +	  modules have to keep code in own text sections (-ffuntion-sections)
> +	  and to avoid merging all text into one big text section,
> +

Typos: '-ffuntion-sections' -> '-ffunction-sections' and ',' -> '.'

Otherwise, this looks ok to me. Feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C21B3BB130
	for <linux-parisc@vger.kernel.org>; Sat,  1 Aug 2026 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785607713; cv=none; b=Hra1XsbEEPN4Hh5WwNAjnHmf9rtGl0Uxnj+q9Hgig0U4LOtO5uLOVGrc60f/1GezN17EW91CNc7eMCsnxmCFJeaYJpykFaMCOwr92n479/piGV5ERWAjx4sGyVyRDkFYOmI6R+Xx3A7lCniOKZgbqIa5Fx+6PZr+LIFgfG1MT4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785607713; c=relaxed/simple;
	bh=lxpuI5CbP0u3jPOT8yD/nolY82GAl37CUBjAJibkY60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHTNyAEZz3ZIIHD0gf+xZNbAOqT8Q50hW7ekE0DHgKfy63s4Q1mJQJTgmBkhmQo7IlkO2M9WNTtXDVo1FgQvsnoK1hLiYoTaH5Y60mDZORh31zKWcsAqbfJiBKBl9XntYyzSNk1V6QghdSUQ5hUej/BikfRG9rdU6WWsjTXLPyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTyTKnlU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTyTKnlU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fd4531020so1154624f8f.3
        for <linux-parisc@vger.kernel.org>; Sat, 01 Aug 2026 11:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785607710; x=1786212510; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoKuAe1ZJwVudeoX6qEMfcN9CIqJIfcMaWyYss3w9Wc=;
        b=KTyTKnlUZfevtH/Lvon1vaf0u+rhX3FTuV1Ix3gfCLBIERpzuMh/NYG63D4HWC4NSi
         UksuoOIC8RibxmJ8N6USYrrMJ10NlkSMbNWVJ5qEbls+UzEb6ZvT8FcNpm/v+nSb2+kd
         kGefNlJ9q6gWzM2n0DrxHa7pqTYBBiPoe406T6GdEH/EpRSM6tQx7iXYm3mn4DXQq7vS
         hRYyyfKnM/IJjIgFlE+hSAvQq91AsCox9kdOmfgOxD716Jt0s2LGmGjPUPdKd2UPlHnD
         EDPG9Y259qnh8+IiAglVrSSSghS9G3TpHoy2W2BdKZ/PtjqBYhTvSKqL6+O73J7AgMF9
         LvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785607710; x=1786212510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GoKuAe1ZJwVudeoX6qEMfcN9CIqJIfcMaWyYss3w9Wc=;
        b=OHaSM+KQs0iuPIsuGdraipAjHSQ69WZJSDM7x/pGAWn/fq/m9cV3JpVQftV0wK1XZV
         rWHXe06P3MKRG24hJBFe6dwhMGCpV9H6F6oaQ8Wny9n+I5X87ugqtHBMM/NsctdbTRyW
         xnQRG9NLYErFqP5QA9dRgkJ5bqzG9tg+zcRze2TUnB9q2ikWikkhSBHWXhoAy7gdU6U2
         PgEPRwC5IPmmGI5xKcOkrQdLu5MkMiMP1EsQnMDopH8GqFmE0oPxo4zBGpcgoWtdZ/4P
         ZE+p5+RMEvBDAZHbXnFIJEFyi+sUOAiXL6Y80LJSM4dUX0lQKhW75oZ2jQUfUqgftKnR
         n0QQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIcZktRWgQg6NNIiEuBxj2RcnqAn8TvXArs9ohuEKwGbqKXD9bBatnLQQuTSJNEriW3Sx3yRTnvCyTkBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwCEm5HKC8UFJTnbMPGtMT4ru1yFH9QAIYSuvjBoNRD7PIanV
	xbQEipd4mPamegD13DH6oZkUqvP4neasRQQUem7j2Ms8PeDGWaPocgG3+7XWubgg
X-Gm-Gg: AR+sD12AFOKKlpZL1LGyJgwHdpyxe6ipV4VWq5qDMAOtD+LmR+FDku6rqItDQaTmQa2
	naCe5aQog35v7swfFPQKJSOYFAeFOKw1k8xFJ0n9SnuNtpxWdJn31Bda6CU/bfSQPWl1O69k2VU
	YVojD1xHH40Vohwv9ISAj9SHebYCckpcvyHmLIbHCZmFjpEaZowGEt/5++3i0xv1LYGzAgBtaFL
	O6BiEFK/qOMvlb4Vi8Xsyhd3p+Awya0LYw6ICvtB9+W3EDtD+OHWaNnYtYVnCtXP68Bj9FWqLs6
	nNm92p6RBt9l5AsD2zbHoSDFNfOJNguxYwpvqYRUddRMIFlw7oKcOdunVn47gfzfuEYqrKdRKK5
	EXKgjtDciSikvcQoM3BMDR97t+MPTEqWDM/wW+9ssMXRhALQL0MRESV/MFK3ipwC6MYm3htoHYo
	I0JLzhom/Kyn/c2AehRirUv5WN4tCD7IhoBfAwj0zXErxLY4WSL/Ac62LBNuteSlAkdpbakmKIC
	eapg5urLc+lLS7thndf8tEARmLO47W+zT41SBYQJjcFnHw+BShKpb7BxDHdwe2Faas=
X-Received: by 2002:a05:600c:4444:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-4980c6458aamr63753465e9.1.1785607710294;
        Sat, 01 Aug 2026 11:08:30 -0700 (PDT)
Received: from ThinkPad-P15 (67.85-86-63.dynamic.clientes.euskaltel.es. [85.86.63.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808691014sm73950685e9.11.2026.08.01.11.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 11:08:30 -0700 (PDT)
Date: Sat, 1 Aug 2026 20:08:29 +0200
From: Pablo =?iso-8859-1?Q?Vallesp=EDn?= Aranguren <pablopva014@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	"open list:TULIP NETWORK DRIVERS" <netdev@vger.kernel.org>,
	"open list:TULIP NETWORK DRIVERS" <linux-parisc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: tulip: xircom_cb: drop runt frames before skb copy
Message-ID: <am42Hc4EE2olUMcG@ThinkPad-P15>
References: <amzqfjeo0Yo1p0Rd@ThinkPad-P15>
 <20260731202629.10ff97e6@pumpkin>
 <am0L4gNtPJaMPx_9@ThinkPad-P15>
 <20260731165555.50741429@kernel.org>
 <2026080158-next-diligent-b4ce@gregkh>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026080158-next-diligent-b4ce@gregkh>

On Sat, Aug 01, 2026 at 09:04:27AM +0200, Greg KH wrote:
> On Fri, Jul 31, 2026 at 04:55:55PM -0700, Jakub Kicinski wrote:
> > On Fri, 31 Jul 2026 22:56:02 +0200 Pablo Vallespín Aranguren wrote:
> > 
> > Please send a patch to delete this driver if you want to help.
> > It's ancient.
> 
> No objection from me, that fixes all of the issues!
> 
> Pablo, want to submit a patch for that?

Sounds good, I will submit a patch to delete it.

Best,

Pablo

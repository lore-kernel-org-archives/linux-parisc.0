Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606F929D294
	for <linux-parisc@vger.kernel.org>; Sat, 11 Apr 2026 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909404; cv=none; b=FtNpoHc/Qy8ampE1AiWLCVP6BQvW35DK5wxsHxg0hreXSx9gn9OzfMzHB+aS/2rXbBou+lbzaOE2hqbeGMgIeRmBkJAVtz6/MIXF8UTEYbm1+n1Y/27FQ8giwMhJsb+ppKBmas3MX47FuPPcSgmr68q0hpuBrhKOTMqa60LOn/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909404; c=relaxed/simple;
	bh=4PPOUoWI/sGzynuL7aex65UKmPYBL2lt+b9RjgXNbBw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipU5M2F/JT0hQGipOen0VrWpm6GtNS2Lc2YvH0eug2oqC2jde+hnrJLwbKvdgUczCsdPiViktjXLBTBpbOahqfT1zSRWYcKPjR1YpWEFwLyV00FoxT2dgYLJJ5tIiEzCMAsExg70vxwvKYK3goeKi5nNVx7gsM5ucsBHfmSBD7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia8NIXWx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia8NIXWx"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so1691039f8f.3
        for <linux-parisc@vger.kernel.org>; Sat, 11 Apr 2026 05:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775909402; x=1776514202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOqUKvzHbOtmysCumhKJ+ed6LDXdDC4PW3MeNbU0xPE=;
        b=Ia8NIXWxzMhrLWN/g9dpcx3P8pRvNbMMBBwAK3GvrMCH2ZkS292qup0Fd9BhHXpB9k
         7Vh9Lf0O/jKmLynljLcKbFJWjA+GxRwXNEBm0lYQasBcR+NwBUjAlEZtGUBnAggyECKb
         QdiWpgBbnsGJ5HIuH6w95F6enKmSpNDe8ZNkcABzPwzo1iQnwpPJCSHoO9mUPH/bo/5R
         COud8X4jWNWOVwoNQKT2obe6jOc6/NJE00x1i0GK+phyAZyzLWOaGGiaHUpp78qbcBSi
         CRY4J2CATaSlhlMiAqPF+2aWrdXj6IKl4X1KZb2Y3Z0Lq31Iu1I4sUBYH9cq4KKLo68k
         BIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909402; x=1776514202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nOqUKvzHbOtmysCumhKJ+ed6LDXdDC4PW3MeNbU0xPE=;
        b=cHH2Ju9pBI6KKMojHOtDrFzd/k++FDTscMHriucHlkaY59ix4tQEq8ex6+MeJ5iRg5
         E63+bkyTa/i0YAJiQnmKt2eVfTwWEdCGbnxKjyj74CcDab+CPA2KiUwoJr2uhL0QLD9O
         lWWDzFN7Cy8qomguEgxeRLcdi+uQDVAAlbeiow/7JFZmT/Pt12ClHLznkPJdTEN3BxJV
         PvmxSXtDY/WQmxKnQH38e//LGGxo0QnCYXaHO8iBfjFOJNoRZuGR1OqtTnjgXM1kKM+j
         5KF/4OQqhE8NgzXp6jKsTudnu5zqDjAZWU/xieEOBO0yUmBrAeFH9PGhOofhFMo2LBnC
         nFZA==
X-Forwarded-Encrypted: i=1; AJvYcCVhc6O2idWQg4yw7oJJ/aDfZhplX+prsUKPvUdUK33CcX0gsE5zv22fgI1I3UPVLjUFoiktJV3yX1TvTck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjP3NPV9ns6IgAI6gH/3ToOMfMI4q5WCVZB4MICTYuceiXNr9O
	PMByqYz5aiWnECcnsumtDIiTy/s9rpF8j9R/Y4uyh4xJ9K6n9bO6CNQV
X-Gm-Gg: AeBDiesUAX/QHmY3hcwDppIu12BS+TGnuLyuWpHu6ayirZV9Ayad96AtLqNxS2HTzfU
	ioPD7ozvZ7nYZsiWeRaOuuzEVEkYrCiCLuu7xOxRpXINFY74E3Try0BSK24b5dgcdBKclFDMyaF
	oLRsss1i64ocw3JjgIExkglB6pRfFccgtTWtRsBt4Jc75oN46UT5oI1MbxLuD+sqnuhOqVbkb9r
	cUc7IIiYLI7nfTuXSRmAJwSOTDQfNgsbTIjUpGPuaXW3T7miOig5fwRwvLJoRXJXyj9u2mz/H47
	ZO61mAZhhpGNOWmwtsBchKqDpQNj771qA9ZuNFpFLbtFaxaBWwTjgh4cau6NNe9PwElEiwpg0Qv
	nseMcYKioU5ormd1yXFM6AlAkBJIwZvTPajOB+r15arYlp+csh9qUS8UG1Eq47AFtHJsFtFcUAm
	75XQ2KThmUr49G7rJMANQntQdtx37SY5KwLgNaYy1LQ7B+CkimOM698V2MuWBxmS7ChK8My9RJW
	H4=
X-Received: by 2002:adf:fc12:0:b0:43d:6f0f:32fe with SMTP id ffacd0b85a97d-43d6f0f3403mr253339f8f.31.1775909401550;
        Sat, 11 Apr 2026 05:10:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c98fsm16293367f8f.35.2026.04.11.05.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:01 -0700 (PDT)
Date: Sat, 11 Apr 2026 13:09:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: deller@kernel.org, davem@davemloft.net, dsahern@kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, edumazet@google.com
Subject: Re: [PATCH] net: Optimize flush calculation in inet_gro_receive()
Message-ID: <20260411130958.70202bab@pumpkin>
In-Reply-To: <20260411052037.2013228-1-kuniyu@google.com>
References: <adkMqgP6QeBPgqP9@p100>
	<20260411052037.2013228-1-kuniyu@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Apr 2026 05:19:35 +0000
Kuniyuki Iwashima <kuniyu@google.com> wrote:

> From: Helge Deller <deller@kernel.org>
> Date: Fri, 10 Apr 2026 16:43:54 +0200
> > For the calculation of the flush variable, use the get_unaligned_xxx() helpers
> > to access only relevant bits of the IP header.
> > 
> > Note: Since I don't know the network details, I'm not sure if "& ~IP_DF"
> > (& ~0x4000) is correct, or if "& IP_OFFSET" (& 0x1FFF) should be used instead  
> 
> ~IP_DF is correct (MF bit needs to be checked), see
> 
> commit db8caf3dbc77599dc90f4ea0a803cd1d97116f30
> Author: Eric Dumazet <edumazet@google.com>
> Date:   Fri May 31 11:18:10 2013
> 
>     gro: should aggregate frames without DF
> 
> 
> > (which I believe would be more correct). Instead of possibly breaking things I
> > left it as is, but maybe some expert can check?
> > 
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > 
> > diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
> > index c7731e300a44..58cad2687c2c 100644
> > --- a/net/ipv4/af_inet.c
> > +++ b/net/ipv4/af_inet.c
> > @@ -1479,7 +1479,7 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
> >  	struct sk_buff *p;
> >  	unsigned int hlen;
> >  	unsigned int off;
> > -	int flush = 1;
> > +	u16 flush = 1;
> >  	int proto;
> >  
> >  	off = skb_gro_offset(skb);
> > @@ -1504,7 +1504,8 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
> >  		goto out;
> >  
> >  	NAPI_GRO_CB(skb)->proto = proto;
> > -	flush = (u16)((ntohl(*(__be32 *)iph) ^ skb_gro_len(skb)) | (ntohl(*(__be32 *)&iph->id) & ~IP_DF));
> > +	flush = (get_unaligned_be16(&iph->tot_len) ^ skb_gro_len(skb)) |
> > +	        (get_unaligned_be16(&iph->frag_off) & ~IP_DF);  
> 
> I think here we intentionally use 32-bit loads:
> 
> commit 1075f3f65d0e0f49351b7d4310e9f94483972a51
> Author: Herbert Xu <herbert@gondor.apana.org.au>
> Date:   Tue May 26 18:50:29 2009
> 
>     ipv4: Use 32-bit loads for ID and length in GRO
> 
> 
> Before your patch, 32-bit load + bswap are used while
> 16-bit load + rol 8 after the change.
> 
> I feel the 4-byte aligned load + bswap is faster than
> misaligned access + 8 times shift (Is this internally
> optimised like xchg for a single word size ?)
> 
> Do you have some numbers ?

Check on some architecture that doesn't support misaligned loads.
Actually, aren't the accesses aligned??
Also on ones without 32bit byteswap (some do have byteswapping
memory reads).

Also you may not want to change 'flush' to u16.
On non-x86 it may force the compiler add extra masking instructions.

	David
 
> 
> 
> Before:
> 	flush = (u16)((ntohl(*(__be32 *)iph) ^ skb_gro_len(skb))
> mov    edx,DWORD PTR [rcx]
> bswap  edx
> 	return skb->len - NAPI_GRO_CB(skb)->data_offset;
> mov    r8d,DWORD PTR [rsi+0x38]
> mov    r9d,DWORD PTR [rsi+0x70]
> sub    r9d,r8d
> xor    r9d,edx
> 	| (ntohl(*(__be32 *)&iph->id) & ~IP_DF));
> mov    ebp,0xffbfffff
> and    ebp,DWORD PTR [rcx+0x4]
> bswap  ebp
> or     ebp,r9d
> 
> 
> After:
> 	flush = (get_unaligned_be16(&iph->tot_len) ^ skb_gro_len(skb))
> movzx  edx,WORD PTR [rcx+0x2]
> rol    dx,0x8
> 	return skb->len - NAPI_GRO_CB(skb)->data_offset;
> mov    r8d,DWORD PTR [rsi+0x38]
> mov    r9d,DWORD PTR [rsi+0x70]
> sub    r9d,r8d
> xor    r9d,edx
> 	| (get_unaligned_be16(&iph->frag_off) & ~IP_DF);
> movzx  ebp,WORD PTR [rcx+0x6]
> and    ebp,0xffffffbf
> rol    bp,0x8
> or     ebp,r9d
> 


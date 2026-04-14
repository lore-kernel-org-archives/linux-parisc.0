Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B212C08DC
	for <linux-parisc@vger.kernel.org>; Tue, 14 Apr 2026 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159399; cv=none; b=QgS5POUy4q+/CTtgSuQpb6KmfTU1XRcP0eiGBN/iee4rSqBZsOM8NqjzuaFn4BVoWGN11gbgqODwgyP/P2lqx+md5ZzCf/hMbFnZ0v4UwbiLMzXirizqrP2cxfwQmA/NPhSEMrQKC7MvyqW5SaCs38Y1gfycyZRP7DAs+jhbbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159399; c=relaxed/simple;
	bh=nzL0YYHEnSV/CtY6irVVvj4bmdP4UlYcFw9M5mHcvfU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCqvBJ8cFNpCWheTvbxGtFdGYpz07CydaRWPVzqa9nmEZ3LgaLiCpu+2e1YqFO640uWvWvBu1kbCwhKYq3EXy8aJqrKidNbEnEb52/X5G8Gvz1P15Zw5PzJ9Pg8npOkErvZyNiggUAn8eplvTFVi4nqQrlFzVaewNPVtWg9b2zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWhOovV/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWhOovV/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso62630385e9.3
        for <linux-parisc@vger.kernel.org>; Tue, 14 Apr 2026 02:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776159396; x=1776764196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aISHfLM92ahZPcl51zWVvDvh3fGxj28STwPGxLZW/1Q=;
        b=EWhOovV/TQkKgEEWxSOvqz9CFiuM7rfdN5wA0z654rBqxw8VIzUhAkri9Ef//u49L7
         OakEJb6fGmO8OQi+apnsRHNorA69jYoLx9dloW2RKJGt5/0mSn+fiqHXtsE+BHO26y2h
         cU+hY1nVSa8BWUgDZxCGxZ/THlSdQwLBTIIMxWwFSsHH9CXYD5HGEJvWbohKCsnMCqoB
         KRI9sK6ZysfgsgQRlgiy+6Gt24BtE79oDRHV8mOne8HH7kAezIdFl+YFFLhbJYNkFtYM
         5l0bcrLUeZbtva8vKITJ+L0xKvxAGuKN89L1z6CogxUyE9xvlt9FlP8FqX8Eh5J0NLNg
         Vs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159396; x=1776764196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aISHfLM92ahZPcl51zWVvDvh3fGxj28STwPGxLZW/1Q=;
        b=OxfgXaEK80bPT+CoXgjtAC+yODRvlI+FeQKefElpBYQxDTkKLEkaQKSjFLRkNedkfV
         FuBWNlT4Ax7aMjMk4RELMUGjDwXqNwXe0h2dx4Gx9AEXggwVfXV/ghpWHhNCKl18peXa
         U8OXNZOLOkjNFSvXYf962jLhtgbsSNvKRvFFra7qo2U64U6qn2aQtWo9zDEU0itFbRwn
         vXYO4xSrzgYzihvm0u7OZDvY0n3IqmtI4ujuRuNLezt99UEDGjLfwBwxRdcml/7jU2zj
         Fn/KsEgHYanTCJoau2JJry9q010UjsZYCsr6K6rT3hDiZm06eAbexQOnuAhwfuFdEE3S
         Hkew==
X-Forwarded-Encrypted: i=1; AFNElJ/9L5ji6iBcDc8JtJPZ9w+97yw2WlR4HxTShX0X8BmGFCgpV9I97AKlByS3jTGXhpzqy97MbmHnuXUfSII=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfdxsWkXBolwMymsQqNtCa5h5mFf4wgiifVai3RMMLXPI6/K5h
	EABKYlp+gFm08r2mLPYMN0LjcsOqkDh8Qh2/afPIPWzDMygVasIwnDMI
X-Gm-Gg: AeBDiesokzsJYosa5o9hGQXA74ow9IljQ5Sv6HulnujIB2YzyunTZ/FG5T2LYy6C0LR
	1eA/FmRK662BbPRp7h6iSQZPv4J/gOZG9jzZg9U3TG00pK2+jkmZw3fLwQidgtpVtBFNOvU3XW0
	39n6I+CTG28r5Xstn/R+ooVCR37zsQoWcThWIh8WtjGUSgAafiZamGQsWB5OpCtSYDMCO3of+AG
	EebQDsXbxcTRXDGEGCSZ+/J/7so6f1lxHq39CmSup3jxRqQJzCm9NP2+AeOhEU0zl67S6NNTFgt
	TMRhHtAgkVJsbyNCGYzKtnnS8551/RWNmtV7lr10CSdqf5zbp3mZ4X+u5kItsSs7DqI9PFPVpFW
	SV09jnc/2ZDoNLrUDPI53SDqlauUwPoAzxihmtZiwwXwUnaOPPYYdwawkFVG77HOKE8Ip1eBkkJ
	eFrbFa2Z9C03cdcTXREl91XYcgx8hmPkG8mqeqrKn82D0vB6MSFuozh+GWgrWYeg2xn6nKFcHcb
	Dc=
X-Received: by 2002:a5d:5d0b:0:b0:439:b55d:b0e5 with SMTP id ffacd0b85a97d-43d642a7a61mr25526086f8f.28.1776159395782;
        Tue, 14 Apr 2026 02:36:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec27fsm38828992f8f.11.2026.04.14.02.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:36:35 -0700 (PDT)
Date: Tue, 14 Apr 2026 10:36:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, deller@kernel.org,
 davem@davemloft.net, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, edumazet@google.com
Subject: Re: [PATCH] net: Optimize flush calculation in inet_gro_receive()
Message-ID: <20260414103633.4d5fe92a@pumpkin>
In-Reply-To: <49c05cd8-5ad0-4015-8f55-fed3416784bf@gmx.de>
References: <adkMqgP6QeBPgqP9@p100>
	<20260411052037.2013228-1-kuniyu@google.com>
	<20260411130958.70202bab@pumpkin>
	<49c05cd8-5ad0-4015-8f55-fed3416784bf@gmx.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Apr 2026 09:46:55 +0200
Helge Deller <deller@gmx.de> wrote:

> Hi Kikuyu and David,
...
> >>> diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
> >>> index c7731e300a44..58cad2687c2c 100644
> >>> --- a/net/ipv4/af_inet.c
> >>> +++ b/net/ipv4/af_inet.c
> >>> @@ -1479,7 +1479,7 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
> >>>   	struct sk_buff *p;
> >>>   	unsigned int hlen;
> >>>   	unsigned int off;
> >>> -	int flush = 1;
> >>> +	u16 flush = 1;
> >>>   	int proto;
> >>>   
> >>>   	off = skb_gro_offset(skb);
> >>> @@ -1504,7 +1504,8 @@ struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
> >>>   		goto out;
> >>>   
> >>>   	NAPI_GRO_CB(skb)->proto = proto;
> >>> -	flush = (u16)((ntohl(*(__be32 *)iph) ^ skb_gro_len(skb)) | (ntohl(*(__be32 *)&iph->id) & ~IP_DF));
> >>> +	flush = (get_unaligned_be16(&iph->tot_len) ^ skb_gro_len(skb)) |
> >>> +	        (get_unaligned_be16(&iph->frag_off) & ~IP_DF);  
> >>
> >> I think here we intentionally use 32-bit loads:
> >>
> >> commit 
> >> Author: Herbert Xu <herbert@gondor.apana.org.au>
> >> Date:   Tue May 26 18:50:29 2009
> >>
> >>      ipv4: Use 32-bit loads for ID and length in GRO  
> 
> I see, this patch is exactly the opposite of mine.
> 
> >> Before your patch, 32-bit load + bswap are used while
> >> 16-bit load + rol 8 after the change.
> >>
> >> I feel the 4-byte aligned load + bswap is faster than
> >> misaligned access + 8 times shift (Is this internally
> >> optimised like xchg for a single word size ?)
> >>
> >> Do you have some numbers ?  
> 
> No, I don't have.
> In the end it's very platform specific anyway.
>   
> > Check on some architecture that doesn't support misaligned loads.
> > Actually, aren't the accesses aligned??  
> 
> The reason why I touched this code at all, is because I got unaligned
> accesses in that function on parisc.
> But those unaligned accesses were triggered by parisc-specific
> inline assembly, and not by this code here.

The network stack is supposed to ensure that all receive packets are
aligned to that IP header is on a 4-byte boundary.
This typically requires the ethernet receive buffer be 4n+2 aligned.
Unfortunately there is some ethernet hardware that requires 4n aligned
buffers (often on SoC devices with cpu that fault misaligned accesses).
(Just writing two bytes of garbage before the frame solves the issue.) 

> So, I believe those accesses here are aligned, and the get_unaligned_XX()
> helpers make the code more readable, but are NOT necessary.
> 
> That said, I suggest to drop my patch.
> It makes the code more readable, but probably will not improve speed.

I think the purpose of the change was to use the hardware's 32bit
byte-swapping memory loads rather than software swapping of the 
16-bit items.
That shaves off a few instructions - and they can be measurable
in some of the network paths with specific workloads.

Remember, save 0.1% 100 times and the code runs 10% faster.
Every little bit can make a difference.

	David

> 
> Thanks for your help!
> Helge
> 
> > Also on ones without 32bit byteswap (some do have byteswapping
> > memory reads).
> > 
> > Also you may not want to change 'flush' to u16.
> > On non-x86 it may force the compiler add extra masking instructions.
> > 
> > 	David
> >     
> >>
> >>
> >> Before:
> >> 	flush = (u16)((ntohl(*(__be32 *)iph) ^ skb_gro_len(skb))
> >> mov    edx,DWORD PTR [rcx]
> >> bswap  edx
> >> 	return skb->len - NAPI_GRO_CB(skb)->data_offset;
> >> mov    r8d,DWORD PTR [rsi+0x38]
> >> mov    r9d,DWORD PTR [rsi+0x70]
> >> sub    r9d,r8d
> >> xor    r9d,edx
> >> 	| (ntohl(*(__be32 *)&iph->id) & ~IP_DF));
> >> mov    ebp,0xffbfffff
> >> and    ebp,DWORD PTR [rcx+0x4]
> >> bswap  ebp
> >> or     ebp,r9d
> >>
> >>
> >> After:
> >> 	flush = (get_unaligned_be16(&iph->tot_len) ^ skb_gro_len(skb))
> >> movzx  edx,WORD PTR [rcx+0x2]
> >> rol    dx,0x8
> >> 	return skb->len - NAPI_GRO_CB(skb)->data_offset;
> >> mov    r8d,DWORD PTR [rsi+0x38]
> >> mov    r9d,DWORD PTR [rsi+0x70]
> >> sub    r9d,r8d
> >> xor    r9d,edx
> >> 	| (get_unaligned_be16(&iph->frag_off) & ~IP_DF);
> >> movzx  ebp,WORD PTR [rcx+0x6]
> >> and    ebp,0xffffffbf
> >> rol    bp,0x8
> >> or     ebp,r9d
> >>  
> >   
> 


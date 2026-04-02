Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D543DEFF6
	for <linux-parisc@vger.kernel.org>; Thu,  2 Apr 2026 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135284; cv=none; b=S+qR11UegcWgkR4Mo9J+Ax++kjU+UVYTG3mVvwWfpKuSAXz+3PmFRMLK3eAVGWLlUalgjqP3VNieSmS7cWxp9nitoho6XR/Xiq8cEWZ2L16wPa7W2xqILkLy05TWMnqBg2FheOF/F7H3G62JSFMq9bAiEdkQ0t/xe30YJPdqgvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135284; c=relaxed/simple;
	bh=J6KuSzBKCDeaYiVgmtuuUSqnvej1+MF06b183JPn5yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bdc5Y+Gj++AB4rhjYU+u6IcqzkWMB/gKx9cQsFWxX60J9j6BQjIqXkitfN2sNO+HgQAYkxodM+CklXU5IfSojwm71UIXuu8+/fBNRdOc5X1NpC27lkuD2v4iaGp5trP5ysXF13O8jqpGcb4c3uhKmKZT9pWSqSKuzdmF4GCRkqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJY3Xeej; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJY3Xeej"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so497401a91.3
        for <linux-parisc@vger.kernel.org>; Thu, 02 Apr 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135281; x=1775740081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWxJTOWQkri5jmv5ZKMT+tNuIWsfKgbRVKTEMtbqloY=;
        b=PJY3XeejgWRIMXpyhMO+u6jxmLwxcfufASnNiIpFCkeNcvwAsithilHAfhY5wy/vng
         3OIgjRGhBHlDo5N7PhFCoMz9TVsP5yETjR5N7Rh3OlGy17wuPY0IkACiql1W0ukMTSqo
         4KvtkNtw4f3WQUJyfGvDBYgAX7NkxzjN7CDvbMU/GWg+T8UtV8yaT2+0UTb5iIAZrys9
         clV/yGPMxreSzrM50jf83Q0/nyNXCMX0BSbHk8PawyfpLZbdrSkfZyovK97mRRnBNt3W
         pKYWlCXTMLNkGPJ/Sf4MSUpboNvn+sfYQcnjUa1aeRK6+dLoCAcQehPMWL8oFNC3pin4
         1z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135281; x=1775740081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWxJTOWQkri5jmv5ZKMT+tNuIWsfKgbRVKTEMtbqloY=;
        b=fvzm07AuZ38w+loO2XbT4RptM13v7QwbW9N7s94QsQEGQ10sXSORKJnm5ZY+uSj6Ti
         3IxYexXZvHb8OFw6PQhIs2KcnCxoh2kbnle5FSKr8646TGCnrfc0sGqQW8C9oCtZrFYC
         +YBgKkMkBMf8qiOGT0v9OH+P9SmyjrBFXu2Zx6EIGWo6w4s9lGnExnqX6pL8yZUS/Q/u
         8JhRivUn+y9zeoTQjY6b0PLH5Hcs4Gl6YP/dDrJQjiPbQIX1cDANUL8ruVxU1nXbhS8A
         +QFte/lDXsWL+iFvPCyIPKvmVilViS50pNWefHlfOXVojyarZrWE3ocWJyouImLDJheB
         +JUg==
X-Forwarded-Encrypted: i=1; AJvYcCVKBAiWtlUtqR5ds/VGP9xui7qSuLqRkNFBuP+BkjIiMJByxJ9KBOnZtIKWduijsychKtQgYUfyXXbwQX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9XriXHWC3FXkD0LwlxMSRZSbqmCLkLPV4BUY4yeYjekvbZVx6
	+cH6MDfoIDY6ePu/PoQvW//zTbz6UJKB/pjRlZ1f6J4vMbGvIKDlQWq+
X-Gm-Gg: AeBDieud5nYS89n3AeglWYcAjiL6TyxzE1Hs1sv2T9fhIDV2W5TmTEe1Ty/pY4kO3Q+
	EdroCV8qPL7UNuzC1u+FRQGLTkXTTVwIMziOKDPmWtO9e99gW3M6s7NdLDtyN+aWVLHNKVkOHUM
	bn3rE7XUKmGP6ye9cJca4aNicNync3HUgHQ2GBOKYKP201KVEa6/n/VrNGee+Vn3f2Epp1N2oig
	2eDZL5QlmFvWWux+Gz+mekXPI864ey76gjvaqFr0dAh9XkonQPiwnOsaNZaf05tyIy2kqWP4eq4
	fIcKJ42J5gbVRAVSFTkDSdGcMFtu3qA5qgvO8ikxBqRB6pcMjzFABoio3+zBDICs+kVSwEcJZ37
	KMolX0hnnfp+Bjmqy3o8PChCugeZsX7BIUtCoREtBHiaW+DVGpONqTDCg22UZL2r0BAsm74jFnT
	ejTw6WtUnI7BZgLiHSRgULE3oE1Hk=
X-Received: by 2002:a17:90b:4d81:b0:35d:a412:3c79 with SMTP id 98e67ed59e1d1-35dc7079cb6mr6805318a91.30.1775135280985;
        Thu, 02 Apr 2026 06:08:00 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe41b11fsm7822915a91.0.2026.04.02.06.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:08:00 -0700 (PDT)
Date: Thu, 2 Apr 2026 13:07:45 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Brian Cain <bcain@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] cmpxchg: allow const-qualified old value in cmpxchg()
Message-ID: <ac5qIUS5azbWAc9q@fedora>
References: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
 <20260402095747.6efbd456@pumpkin>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402095747.6efbd456@pumpkin>

On Thu, Apr 02, 2026 at 09:57:47AM +0100, David Laight wrote:
> > diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> > index ae1b96479d0c..b4b8dac759c4 100644
> > --- a/arch/alpha/include/asm/cmpxchg.h
> > +++ b/arch/alpha/include/asm/cmpxchg.h
> > @@ -234,7 +234,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
> >  
> >  #define arch_cmpxchg_local(ptr, o, n)					\
> >  ({									\
> > -	__typeof__(*(ptr)) _o_ = (o);					\
> > +	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
> >  	__typeof__(*(ptr)) _n_ = (n);					\
> >  	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
> >  					  (unsigned long)_n_,		\
> 
> That looks like it loses the check that 'o' has the same type as '*ptr'.
> Maybe this works?
> 	auto _o_ = 1 ? (o) : *(ptr);
> 
Oh, I didn't notice this. Thanks for the comment!

Best Regards
Hangbin

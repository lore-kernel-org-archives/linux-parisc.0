Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFC437DEA2
	for <linux-parisc@vger.kernel.org>; Fri, 31 Jul 2026 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785531367; cv=none; b=U5am6I8jxICVMaHKj5U9HZ8l7W88NApT8XcccGAbEwkbLYN09E2tbhcwax6MCelM+rl7MAsQs4M84XEy5MAgUSLF3I75NPZ4KFkPS/gACP6co7jxb/4GP/iuuXjClV7tMiLtsA6pEtcizJxHcsOfdtLHNmyhejkBCVFsS328wVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785531367; c=relaxed/simple;
	bh=Fn5KP2Wfb+B894ZtaSSVi7ynGoQ1ek/mqOey7GWwQXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3tYrNrKfx1sIIrUzykv0psJEi1OYZXHl3CLDyoaaDpKmw9br4IDsxULez95HkAyGACymkpLKIVozgYMKRsV01jzcKx2+0PDvP+RUGaGIwqiiq1DdOP4fpUh68oHMVEdJkyX05UCmuKMkNW100lykuX1kN9v6y1iBPQqw1hgWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWgRpq4U; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWgRpq4U"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f7027ca11so989662f8f.3
        for <linux-parisc@vger.kernel.org>; Fri, 31 Jul 2026 13:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785531364; x=1786136164; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7hbc7FAwrk5wKEc/VtbcMzvoD1OmynhYQ/r1fT/1r0=;
        b=aWgRpq4Uuu9n8OKzKdQ4g3wnVYzR0o+4GZzUmqyNpMEx/jCuHa1bS5ja+IM7DcX+P+
         trKXVtElUwZ5S6qnGw4FZtEt0WUwFs9b+wOQMktXmgNK/6HMM3Hx/u0s5wZarAw62wcz
         A6CClervOTzq3uqdItfDjLAha7PDRd8bX6fEy39h0gU4KiLjcJgElVYOByihdwduwPyz
         ZiJsMXjMlQEV5I+FcMWwY/RkFeJYZT/7nGNFv8W/apWrAE+J+OtVEPO0cYmZnqr1Fs8a
         Yer5GWOcmGLOsmvfz1HNQrs4XHAZJOBF3RqQcVbuVSvBpi1O1KBg9tk4aG0KyFUL0wBq
         4dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785531364; x=1786136164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y7hbc7FAwrk5wKEc/VtbcMzvoD1OmynhYQ/r1fT/1r0=;
        b=GlICHnphQZSGw1nRim/57yED5g3qM+136JnJB7AowBEN4SHAd1faw+MnM/Bs5llPId
         iYGm5/33u/i8v4OfqcIfD04J4k/We+cgjmGtCJu/P5p2TK1hEypINxHpoRhCyyEbaSCq
         gv7rXerX25BNFpAMpkAXjtDHA98/TUKLADLG802GsP7EIeMBVAHc0cU7BRPm5bT5KlIZ
         sKTY+yhNYEdeUUmXu75NxvkDQC7tKxBHWqNxwZrMagaWq5iuvBJxrqKk+8ftOE5dvpdh
         bQ6lhEu9K8uJp7h8ECfBHnN3dVqWirkVn8Jgr01WewVyglM0h6we17SU5DtZT9tHps5u
         5bAw==
X-Forwarded-Encrypted: i=1; AHgh+RoEP2Db9T2v90LRNit6WWBvlZg/+Dhnu/MstbX3z1o+CnGrqMQJSjQ7lbl3B5j77WYHDqqaitOCJCCdZ9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcyKYf9S2s/7cJibn5cR+1PE3aDnjbJ9rM0840WKHMyGbEUJPw
	1IoXF/tNf7kLz0U/0KhX3M08KAq8AXMl3iJBIXIl51SqJd3CMmO1qO0C
X-Gm-Gg: AR+sD11sAHSOHT+PW2xp37udZxBgLW6ipWMP/XvcFePYxypiZQKsRDHeR6vqE3Tfu9V
	YhA0WfcgB40VCxAOWutpr4ZDK44i2QAAuPNsK2Z/qz9uVuTku/IjSG/c0zNjRGlUvCK01i8jHbn
	cEeqZBl2/vXHT2bJx8FFdNAiRy7E+2t7GNqwpXHIT3k9lYYVMBLM1NHRzxHwNEa6x/Wl4iDMgvR
	08Dt/mIvI4oetOoujd3BOv5Fu5670I7WLcwGbDordJ5LmBqAS3iTZySDA0nDJJdi9CYQKUCKR21
	w4IbpXSz0s21RC/Qh8yDSORUuB6+BO+Dg/l9tISHn4aJdGK2Rj5z3kPqiGFYoc0nW7VhwsWQqz2
	RPIjQRduqTxR4aPcXrMsilpXmr4uZXPuP+R8X1dmbe8GPBWkleZT2XHixZuFWRMzTj5rYKESALb
	O1L6jfBa8HdogmeXEVrY6DLS5Q1JBq+0y/nyCw2h58oPfzYqqYd7jsL/MeZ222QSeXN1tMAVSXH
	65yP/3WPl1CJ/osn6kj+huKDI8BgYKBMRBsh8k4omfMVSNNxoy0rEXQiInPc8oNSy0e
X-Received: by 2002:a05:6000:4615:b0:47f:8887:3b07 with SMTP id ffacd0b85a97d-47fd72d320amr2212664f8f.13.1785531363748;
        Fri, 31 Jul 2026 13:56:03 -0700 (PDT)
Received: from ThinkPad-P15 (67.85-86-63.dynamic.clientes.euskaltel.es. [85.86.63.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1956sm10157797f8f.6.2026.07.31.13.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 13:56:03 -0700 (PDT)
Date: Fri, 31 Jul 2026 22:56:02 +0200
From: Pablo =?iso-8859-1?Q?Vallesp=EDn?= Aranguren <pablopva014@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:TULIP NETWORK DRIVERS" <netdev@vger.kernel.org>,
	"open list:TULIP NETWORK DRIVERS" <linux-parisc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] net: tulip: xircom_cb: drop runt frames before skb copy
Message-ID: <am0L4gNtPJaMPx_9@ThinkPad-P15>
References: <amzqfjeo0Yo1p0Rd@ThinkPad-P15>
 <20260731202629.10ff97e6@pumpkin>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731202629.10ff97e6@pumpkin>

On Fri, Jul 31, 2026 at 08:26:29PM +0100, David Laight wrote:
> On Fri, 31 Jul 2026 20:33:34 +0200
> Pablo Vallespín Aranguren <pablopva014@gmail.com> wrote:
> 
> Have you checked that that hardware can actually set a short value?
> I'd expect that packets shorter than 64 bytes (including the crc) are
> dropped as 'runts' and probably don't even use a ring entry.

I haven't verified how the real Xircom firmware handles runt frames (I
don't own this hardware). I tested with Qemu's emulated NIC, the device
itself does validate and reject negative-size values before sending them
to the driver.

> Of course, if you think the device might lie all bets are off.
> (Without an iommu is can write anywhere in host memory...)

I took into account that the hardware could glitch or a misbehaving/fake
card could be used. I modified the emulated NIC to mimic this behaviour,
and given that the driver does not perform a check on its own (to
validate that pkt_len is not negative) it does lead to a kernel panic.

Best,

Pablo

> > Signed-off-by: Pablo Vallespín Aranguren <pablopva014@gmail.com>
> > Assisted-by: gkh_clanker_t1000
> > ---
> >  drivers/net/ethernet/dec/tulip/xircom_cb.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/dec/tulip/xircom_cb.c b/drivers/net/ethernet/dec/tulip/xircom_cb.c
> > index e5d2ede13845..62c64da1c8fa 100644
> > --- a/drivers/net/ethernet/dec/tulip/xircom_cb.c
> > +++ b/drivers/net/ethernet/dec/tulip/xircom_cb.c
> > @@ -1110,6 +1110,11 @@ investigate_read_descriptor(struct net_device *dev, struct xircom_private *card,
> >  					/* minus 4, we don't want the CRC */
> >  		struct sk_buff *skb;
> >  
> > +		if (pkt_len < 0) {
> > +			dev->stats.rx_length_errors++;
> > +			goto out;
> > +		}
> > +
> >  		if (pkt_len > 1518) {
> >  			netdev_err(dev, "Packet length %i is bogus\n", pkt_len);
> >  			pkt_len = 1518;
> 

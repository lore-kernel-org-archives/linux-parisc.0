Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261E3624C3
	for <linux-parisc@vger.kernel.org>; Sat,  5 Sep 2026 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636328; cv=pass; b=JYdslO0VKFx6dJHcu9elZ4gNSpWfNRoK33ubFEXs5kl9gKOSWvfZ/985uLDT83g+sWyL+j04pLndXUQkWWaVXKeI3+/sTmBZBA/m0qAIYtTrGBMzkDmaYK8zquXuwZQyN1DE8UPXc0labnqtzG5XOdclsmsOGlJx9E2Qu5Cs2vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636328; c=relaxed/simple;
	bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZnu7vNQ4YFF3zI5b+jHYlnrNXjY/2Cl+8YJtMQqSGdMmevMYYYJhXieBi4i9k+3QEYB9juwYUjOm4DEe/q7MZQT2DicWUgVkmF66iT4SQstDZ18VOhmIzQElGASNiRo7bDI1715zyUF5n5FrSUNBovP3475M59wSP4taXMrDmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFvh5E+R; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFvh5E+R"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso3133735a12.0
        for <linux-parisc@vger.kernel.org>; Sat, 05 Sep 2026 12:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636325; cv=none;
        d=google.com; s=arc-20260327;
        b=UfFHz1cAIXzkcpFSf4JOAxgdsx8LsXJPXRKJrz4M/hNe49cqJ2i9FkTsKbcQfAvsxA
         LMMWwpfiiclGQDlyh0gblUWxHRkn5RweT44V7QUoF4axLBV8GV+/jDeU9WRCxaHe5OJz
         C3vGe/Dgi/j65tyqT3ldL5U8exJsjru6M2/0wyA7XptnLZEJpGnfRU3Br51ZJPfOUyxE
         3Vav+9sq60GW9XGfHiB9a+5HY9sIBJuZSPj48KiD6PYtBNM46blpPerUHRevO6VCS4fJ
         hcT0EAEsn27J/T4OTDfMYgo3avEIQI4ZHMKQZ/qZiHLVTZMDJjYkUT+K/6Agx+mbMYvM
         DnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        fh=3IcYxvNoOFqQlZppnO5G4/Brqvvi6OzaB0Ryt/gq4F4=;
        b=rgsJILcJcmp0H+rK001glhHehtCOz+Bo3arD8l+L/KdTX0I5jg+w/QdJHhH6Pb0qaG
         XXT+GxXC9JReHRyxMJS41DTd50G04r3Ij8YZzOJyxcZGxRN75LLeEdeYaFKjICVRhQcz
         NGXeMaeLlUITgawvGo6IyhoL8riROjaYD6Fc/DezLfjesA7xThSo2pfdNTQO8nt5BRYR
         ZocEx8HhjC79/eQFi2tHq7LB8Zn+cxDri9hKOYEKzaf4mi40CDa5/pFKuZXScHkwFRk+
         UiMk2AwoE10jmAJnri1BdVTXCRm+hv2RkqDgS7JS8H3Aasq223248ulyHVm/lKEbEobF
         y3fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636325; x=1789241125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        b=mFvh5E+RfS4aNj0vy+YT58yiX5gXrqVTmIyvgCwl7s4+N8bAysfWJFRiBZchZHSZP1
         xDITBb9j3SypuZd5P0/6K4I5UmMSmoMBIQN2nBHdmVxV5V3xiJKCrfjS3oEchRJgz1XF
         w5WxNlnmLWbZGXXH5v4xtjVDWrsQwi8g0uNekvGul/R5js8SYY5tTcZ8NQC5wqgAl09u
         m/RDe731TzJzY24shmP/QfiGau42eQ1cYicgWaEg25xwFkJaD+Y1lOibwCgKY10QRrKk
         DqiY6wsiqdW0c4ykZY4pnjjC8Ad0sEsZKFiVFQb3B6NJglzTDtxQTdobzJbdWTbqxOfR
         6g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636325; x=1789241125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tss1OLFh74zP/YO6lC1hnEpTj6L5m5wTk/nWpTbZIw=;
        b=mUyQN7pKOUNMyKMPKPdBxtUrBEh/tGAS6ecAkLqNcYDkf4W6DHCr8sO5muksWvWw8Q
         O5tRvnbF+83R+5N8QFLqn9TOp5MpaRz45v6PvAOJ2bNTiVIN7uzQ+iVSsfVvXNGkTDur
         qi3H9V0QTajXS076UpSCkRV2Kb0Efv48WDEwaeDKT7+NpfV3s91kwCBw2S8BMwvh3eik
         XtybCqz7E7tiYunEPxY9TMMY+Ica7sTMddVrC9hyjkrrVGMIZIFR/koQQpdULQXUle0r
         Y5nF336PkkAKVyY5cFX12X9kgRgeZoJrH1fYiwbv9PQtJV6/h+jTMopHwfoFiexQCMXL
         W3dw==
X-Forwarded-Encrypted: i=1; AKwUvBy2nq3MglXSb7Y44m8ah83hxbSFouUnBNOK0J9eSDieGFAwda7xEKiAm803aT5Vm0LOoZGBxHiay5BrLKY=@vger.kernel.org
X-Gm-Message-State: AFuF++mdQvYlyYPFGDY5y0fLSMWgWWfdNXB+1CbD4hO2RP8o0Pd6ffHE
	dTOXDL34T+Q0nIXDsHTaHqsNTo6dP22F/Hq7yuypYrRplwEviTe8KaAjXoKNe9Ufdwusv4jlyw+
	WmWQLRuj6r/2NmL/Kvmgb6XH58bmJBXI=
X-Gm-Gg: AYBFou2/naVxb0TNVPvwMjYBzzQLm4cXrHKgq/fyfuG4pm0UaZEQW/LlKuY5ycQV3Xg
	KvNZ1ZlyutRf7yNWkK1L4n8tAVGMfMF7CowuHDE2nx9taKxpizgxw/LU21PZcgvCXclBAB/nVQe
	upsQgv1Cp96W4ZMwiG4RlKlw1xWMtxRLHSu9P91NIWM0dpUfAlr/JDmEvdOBOaznG9NHDKIgOUV
	qYvwOwzGDkh0ZG61ajRua2MbUTFHJ5fojzAsmGDHGwldYpxB9BDeRb4oXyyvDgPIPAnBMOfJAsf
	SQ29KctJqiTCLbcGw+GgDV09B0GQXSwWE3G9yizB6iuJWkbxmh3MFyDfQJOjSL8/w7ldVHpYilO
	j/CX8kukxUFRsrJ0KyO9S6MP8GQ9BKec=
X-Received: by 2002:a05:6402:42c6:b0:6a7:fb24:264e with SMTP id
 4fb4d7f45d1cf-6a7fb2427d6mr1836272a12.34.1788636324671; Sat, 05 Sep 2026
 12:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904123843.375633-1-linmag7@gmail.com> <20260905140755.GA2875205@electric-eye.fr.zoreil.com>
In-Reply-To: <20260905140755.GA2875205@electric-eye.fr.zoreil.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 5 Sep 2026 21:25:12 +0200
X-Gm-Features: AcwNN1VaRI4G-HQNxdXx9quUjsgkaAUNPekVT3Kj7muTqDDS35k5taSE0YYNcaY
Message-ID: <CA+=Fv5TyOLB-wWap6PCpMw646QnovtDV6xwqyg9ygpaBemXaPA@mail.gmail.com>
Subject: Re: [PATCH] net: tulip: use mod_timer() in t21142_lnk_change()
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francois,

On Sat, Sep 5, 2026 at 4:08=E2=80=AFPM Francois Romieu <romieu@fr.zoreil.co=
m> wrote:

>
> The current code may avoid concurrent run (#1) of t21142_start_nway and
> t21142_media_task. It may also deadlock (#2) as you have noticed.
>
> As far as I understand the code, current users - if any - may experience
> #1 (avoid concurrent run) or #2 (deadlock) alone as well as #1 and #2
>
> Users of modified code won't experience #2 but they may fail more often
> at #1.
>
> It may deserve a minor comment explaining either the choice or why it is
> not an issue.
>

Thanks for catching that, you're right that swapping to mod_timer()
alone loses the pending-timer protection timer_delete_sync() gave for
free. I'll put out a v2 reorders to mod_timer() before
t21142_start_nway(), which
should restore it for the pending case; I don't think anything short
of cancel_work_sync() on media_work covers the already-queued case,
which the old code didn't either.

Magnus

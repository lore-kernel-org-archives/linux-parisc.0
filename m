Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0633CAE70
	for <linux-parisc@vger.kernel.org>; Tue, 14 Apr 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160686; cv=pass; b=qjV1N46L/wGpaEBLItvj0dFjkW6OdQEghUPneqJwdJVdJ+GI4yVkx0KK5V+7esCQorCke/m6z+Bs02KjiLwb/RPtNzZcrquTUaQSuRAgkhr3bjnjP9k6A0lmWASo7/4wr1TD4BCi59QV1aOS63VVd/FvxC8bsJTnNB6A5uMJ8fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160686; c=relaxed/simple;
	bh=9G4aNW0qSYXCAoZGlzimeLIoaqXuWiYpcS90B5BpCe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaooMCDDvuKCageZRm+EF5pcjbCKOEX0JyOAhwjpQEtT0sBbhxEkRZJ9XhCm6F+NT+SX7wyciC7fgwtNCYu0gn5QBZD+DBdouY6sJHiVuGvtW2g5+2HZqWjFtQ85RLl3ayrOjCQGae1xvdLnV+FeaebXLcQyVJ+p5xPDdSxDNTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rsKyQ3fb; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rsKyQ3fb"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50d6ab4476eso56093381cf.2
        for <linux-parisc@vger.kernel.org>; Tue, 14 Apr 2026 02:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776160684; cv=none;
        d=google.com; s=arc-20240605;
        b=YGArVOgS1tjqkKVVGTLTeS2sIIbudKdUGSpKmxwf5fJshoB9ZQmW13blSVWk5GJ+zL
         /Fulx70GnnI2D2QnwVqDbGjXf0xrgTmtBiXQmUWszhLQF9ETb2Qqd0I091gwytExxALK
         eRD2xEPtuIZ1TSZZdsYlz+60XyZUu6/7m1P7Q/a4zKkCSO+bPpJ+nXpsTM6V7Rg70mms
         Pg1a3525rLSIg56rYUtxyj/4NRXEhP021vOCpXwrBGWlPvq/w7UJCqEROPugoWPoi/Pq
         MsX3XebZ2HKk+jjBZeFqwcxjd90AEfP/nJhR8tWfaRIy8YdanghJWeIsuLl0oVkQMeTN
         DMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lt2L91R0t0j4a+adrKa4HTX+KJG0QWfVScgNiR2mXBA=;
        fh=HQghW0zUS9u5WkudAHpiaej1WaY2KAbXBfYVI+zyLo8=;
        b=j3SEvSkJrntRG/t/y9uBk8iHynYxEB2KUZyTj2Con34fjM3fHos4A/5gtArgyoGXir
         F5G7xnlkupGurg+cajKwQ/h9fAx0oGpgF2BUgdJPG0Gy6HnqWqZa+XysxnmhdpK8bGVm
         X9kABhNb9sPygg983c3AHV57YRok2vuwxePLIiuudfZLFtfVgngsxx4YtrqClwE37N8w
         QiLbrkhe7SIc+ZfXW4lqVM+9tUGbsaivFRSHuZAao1VJCGizbUFqHubxLOD6vWVEckIQ
         54tWmpvWmfeZQ2fIvIDwnvm6OppJ2BsGQ1dT0uVa60405ynzkC7XguTdewGpzVNWMrLl
         W6HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776160684; x=1776765484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt2L91R0t0j4a+adrKa4HTX+KJG0QWfVScgNiR2mXBA=;
        b=rsKyQ3fbbP8gNxAx7veUXSMDFp+lTdueolZ7ogKJj1W/BfO4COxVwBxhJwKOr3hVGf
         NaCseoibiFNuhc+10wvrCWxgMQEvEWJTJ9Q7XnSIjapuAH4xKJKSzKOA0v2htfk2zmBu
         So4pKEhI3ZdnnpXdUeTYEFCutOscA6e4COkRF1wzb5OQj0Zi+4gf6M1pGhGMXVykHug4
         Djuu68FcYqUapF0+iALxCEaQNajaYf7ALOrSmdxANlXEJd5LOUuQCQpyQDr1/0NQNKc3
         Rh5JswBLr2Du7deSD4AEFgE8cizQ4lwWpS+98MJxjRHrCO0o+KQo8f/3rViqPnIyNdOZ
         gCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160684; x=1776765484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lt2L91R0t0j4a+adrKa4HTX+KJG0QWfVScgNiR2mXBA=;
        b=nWEXGtkW/xbl8L1C6BXl6FMUi8DcJ4RiQ6pjsrd3syu7qi8fV2zJ6B8w9Gv4Py/zl6
         YRon7XoPAes/43oKwHX1WUyLFMQc11T77JxPm/5hOKx9RNHvcBpgWOGJC2wtAbFAOfs9
         0p0dIYDkn0pRXk8fLcw7v9BR2klNFfcLLp6+0+qnsWCtjMLaYQ+XSEnUDysDdc/gOu+d
         6zZteQrhoUX1PVQ2IMjZb00q/TWmWZnZ8fJTSk2NB6pY3BGgfgXUcyp4jN2yJaG089mE
         2mEr1y18OrAhwGYFp3+bAkN3KChNpqj4jjsNRuEX92c2NTAZZG1LG9Ipvvu0vh4Xo00s
         oChg==
X-Forwarded-Encrypted: i=1; AFNElJ+/QGKot9QsvIbIhNGRlkfl4pyB/qG3XI++b5Q+M9Zs05wTIuE4QeaszquoDLL6HPC1/3vE2sE/NzLCt/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwcb4sJ1OkcbvRFrfOTqiXn2qmKwPJU5o0u0r4JcNOlqs9KDGD
	9gylsYtmnmadD27EJc4Gp656A70mqamdzKIdFSrQVAKGIqPJVOSGv+OIncrLscWc4FHr9iLAzLO
	QIh3oklDidpCU2GSajDjLsU8NS0SNZK999OBLzEL8
X-Gm-Gg: AeBDiev4qVFFixo8S7f+Ok76UrTGSv90AYPUvCa26lZFbT2bupqS1c1v91xH0yk8TCq
	HyRSUiR3VBzt7YaNRp/dspyQt5woN+ggLBvmlBimcAAxvwz/KN8lRytEWAWVa4/q3xs4vnCtyhh
	pR3UvoPHd6BKxZ6S9R1LzJHRY0xg5FKEAExIk/nm/0+MRCPKLbimErDCk2XwjaU0E2je2y8QVho
	qJhjpRFprOLCNqysQCigMCqc9sWUVW5W2797OIBayDcF0yW+n3v+oEuHH4VwPUWHMo/mBYYKny8
	1vxfic9QcnJgLJixJLTQf9z7rHib4cQfk6rRgpM8FcmckECN1CKp+JdLOuk7bJsAnjEM7OsJ/JW
	2dKwU5eM=
X-Received: by 2002:ac8:590a:0:b0:50b:4537:2e21 with SMTP id
 d75a77b69052e-50dd5c10684mr241979191cf.45.1776160683955; Tue, 14 Apr 2026
 02:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adkMqgP6QeBPgqP9@p100> <20260411052037.2013228-1-kuniyu@google.com>
 <20260411130958.70202bab@pumpkin> <49c05cd8-5ad0-4015-8f55-fed3416784bf@gmx.de>
 <20260414103633.4d5fe92a@pumpkin>
In-Reply-To: <20260414103633.4d5fe92a@pumpkin>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 14 Apr 2026 02:57:52 -0700
X-Gm-Features: AQROBzD2w-k7YonaYKfDIbemD_J7tzVfxbt-N8Q_GrDjDbdtgzVEkik3UF74vmc
Message-ID: <CANn89iJv59ZEeaTCY28emRPr2LGAD42hukmLnYU-KfJJs052xQ@mail.gmail.com>
Subject: Re: [PATCH] net: Optimize flush calculation in inet_gro_receive()
To: David Laight <david.laight.linux@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Kuniyuki Iwashima <kuniyu@google.com>, deller@kernel.org, 
	davem@davemloft.net, dsahern@kernel.org, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 2:36=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:

> The network stack is supposed to ensure that all receive packets are
> aligned to that IP header is on a 4-byte boundary.
> This typically requires the ethernet receive buffer be 4n+2 aligned.
> Unfortunately there is some ethernet hardware that requires 4n aligned
> buffers (often on SoC devices with cpu that fault misaligned accesses).
> (Just writing two bytes of garbage before the frame solves the issue.)

This is mostly true, but depends on NET_IP_ALIGN,

On x86, this constant was changed to 0 back in 2010.

commit ea812ca1b06113597adcd8e70c0f84a413d97544
Author: Alexander Duyck <alexander.h.duyck@intel.com>
Date:   Tue Jun 29 18:38:00 2010 +0000

    x86: Align skb w/ start of cacheline on newer core 2/Xeon Arch

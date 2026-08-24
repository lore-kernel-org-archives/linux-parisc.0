Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5939E17E
	for <linux-parisc@vger.kernel.org>; Mon, 24 Aug 2026 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559603; cv=none; b=oPFnwloSc/PQuzrMNhqhUI1edb2D0ufuY/rx7dAUdpbp+C+3tK6pHEjax+p84m/Aj1Yv4FvxBCO1wCQr56ycGibrkxXnhXkqHn5JOKNTY3wVufzvRjBGH2fHUKmjpUfT1nvfIj6R4LbxIK956rlQw7vRZ5ssOG03Pf+gZIYo1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559603; c=relaxed/simple;
	bh=Nn4ey1VBdokoZSOsfWJ+dNdynYt1RvaS6EWRf23+lSk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDrG9ecdGx2pF6l646tyLqYRGc+AEByBrmdTrGWQxIlM6kNh9wpDmyE4ezH0UwF+3rowz7gxJ9jdzWdNcC9N+oLodP+V0fxXSka+T9YUzCFJVpDb6/qVgkVujBMhmMv7guYqoWAep5ZO2a1LaHBA1uCJeGCOdM5CjvZS8cmUJ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBahqw8y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBahqw8y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so17273875e9.0
        for <linux-parisc@vger.kernel.org>; Mon, 24 Aug 2026 01:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787559600; x=1788164400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eU3gKA1mmJ+y07WplicT0tWKodQjt6CG6tSPc3CwXck=;
        b=JBahqw8yQcBVulf28EBO5MRBLctUKLjFjxPml3zfrIpBUIm80cu6RgkiRLyf/624X/
         rH1cB2H7BqD191rJtLh2pv3Ho2WbFQvN2HOIjAVJNjavcRIFmkLtqwypcnRcCFmo3CDk
         oiIpIw/D3bWQtlqhICXjgBEqwY6qggT5Ir8EvmwIkpcTviEHFhP93pqtzhoYk7+VuRsY
         t0JdVj7UVR3vSQtJAQmN+Rnf3bRpQeXUDE4L9h+qYqok5OdGtR5tv3rZN+7uVXOwWsSv
         HDuZNGAcVtm9R06y+LzShku9kySl++WRCAM3Qu4KcJd4Um6ssHH61sOtR43apLlKjFB1
         uAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559600; x=1788164400;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eU3gKA1mmJ+y07WplicT0tWKodQjt6CG6tSPc3CwXck=;
        b=FDOWZX0LBuAYkU3M5bfbB/R/49Odr9v24z+WfFb5yRmgEyhxZe82m8Zr0+RL2w9uDu
         HJYnp6TPiONnnu10jiDG7aPqtqwLP6rOlExe6VMoipmcSlvCGPjAOrh9MiNBvEZ7ygX6
         UIO6ht6tFQA9ZDrnmoaoQzv/DPQ70bzIYRDjZ6YNH8zGK4ZOqA0GKpbFMoJy+sV7bZpA
         GDcn2pUoWqO2JDhc5dk5Kw6SzW7CXTHTI07VPUYKz6M9KAQX7MgT3KUky9nH653dJWXm
         70lsGtj0v6GqXJK9o/Pi0boinIoDyoYt/opcVMWMKAnckKe8IAPNuyLs+xBIE0o/6FAv
         TQqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9yNc3pIHUMTSX3etlmA4FIlokBmNdURfHwRYO5Md35DN81Rs9/KcYHIYuUeFRnjhyWrWNtZfCzLR3Qj4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXo/gdof+tM/16QQZBW/+E6tGfzcwWKvGFpNbKR9oJC+6Nmny1
	gzScmNuy2OBj+gAiouPrJRz35+4RvXk6ejrnalz6b1OgUwCxH6bYXE/I
X-Gm-Gg: AR+sD11rEY/E2B6tscJrsvAyHdnHB2eoJOVE7M3FMrkjW1RTwNdz9tUnOa8IKh6YIAj
	ZGvUiGrJi09Z9trWGioCjkNB0lj2d3JM8m+7aBuikcHQ8d16wQ+YUZmL8flad2KqRvYprS3poII
	52NBhtXisqMNQDlzVb/tq7zoDrJotrzFLVCOeS5gJt0QSwO3EX39ArWViEmuQQkHs17ydju7hs6
	+vJe+zXkezo1/rt3Kr5JE1tRbCUigtDRR8rbmfvn33YeV3LisYtVnLuTAT1Eys0GIeOJ7DDurh7
	Q1qq3rzJKvaYjcKuo0x4tp9jvBrBysMT3CW9RXRf4qGclzJhoIFs+34ecT3xuZLnIRKxTAFKch1
	EI3LTHBxixChtYTHBXM8/BVoYhp/BuqGA9tUyCCkDiBk24brICe7h15t3NMCd83halU7QKqgk+M
	3t4ul0J3hgQiAxR15IhXC3maWZQfoTWXisB97/9qu8r4mQyR4lwMWu2sASFe0OpCRhsjFDwv1+c
	nwe3ZXxxeEu/8+Qzw1q2jWS/g==
X-Received: by 2002:a05:600d:644a:10b0:499:bdf1:de07 with SMTP id 5b1f17b1804b1-499bdf1de10mr141118085e9.5.1787559599625;
        Mon, 24 Aug 2026 01:19:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c3566e1dsm74302805e9.7.2026.08.24.01.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:19:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:19:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: add 64-bit parisc support
Message-ID: <20260824091958.7810094f@pumpkin>
In-Reply-To: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
References: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Aug 2026 11:32:50 +0200
Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:

> Extend the existing parisc support to also handle 64-bit mode.
>=20
> Some peculiarities:
> * The nonstandard ftruncate64 system call requires a workaround.
> * The linker defaults to main() as entry point, which needs to be
>   switched to _start() explicitly.
> * The linker defaults to dynamic linking, which needs to be disabled
>   explicitly.
> * With the default -Os, gcc does not use 64-bit multiplication
>   instructions, requiring libgcc. Use -O2 instead.
> * There is no qemu-user available.
> * CONFIG_COMPAT needs to be disabled to avoid build errors due to a
>   missing 32-bit vDSO compiler.
...
> diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/=
selftests/nolibc/run-tests.sh
> index 3da806e2b302..a50a47d9df2c 100755
> --- a/tools/testing/selftests/nolibc/run-tests.sh
> +++ b/tools/testing/selftests/nolibc/run-tests.sh
> @@ -29,7 +29,7 @@ all_archs=3D(
>  	sparc32 sparc64
>  	m68k
>  	sh4
> -	parisc32
> +	parisc32 parisc64
>  	alpha
>  	hexagon
>  )
> @@ -122,6 +122,7 @@ crosstool_arch() {
>  	sparc*) echo sparc64;;
>  	x32*) echo x86_64;;
>  	parisc32) echo hppa;;
> +	parisc64) echo hppa64;;
>  	*) echo "$1";;
>  	esac
>  }
> @@ -206,11 +207,11 @@ test_arch() {
>  			exit 1
>  	esac
>  	printf '%-15s' "$arch:"
> -	if [ "$arch" =3D "m68k" -o "$arch" =3D "sh4" -o "$arch" =3D "openrisc" =
-o "$arch" =3D "parisc32" -o "$arch" =3D "alpha" ] && [ "$llvm" =3D "1" ]; =
then
> +	if [ "$arch" =3D "m68k" -o "$arch" =3D "sh4" -o "$arch" =3D "openrisc" =
-o "$arch" =3D "parisc*" -o "$arch" =3D "alpha" ] && [ "$llvm" =3D "1" ]; t=
hen

Would it be better to put the llvm condition first?

>  		echo "Unsupported configuration"

"Unsupported compiler" ?

>  		return
>  	fi
> -	if [ "$arch" =3D "x32" ] && [ "$test_mode" =3D "user" ]; then
> +	if [ "$arch" =3D "x32" -o "$arch" =3D "parisc64" ] && [ "$test_mode" =
=3D "user" ]; then

Ditto.

David

>  		echo "Unsupported configuration"
>  		return
>  	fi
>=20
> ---
> base-commit: 7f4233794df172ab1d286dc0fbd70da2cc837654
> change-id: 20260407-nolibc-parisc64-3ca0547c2af9
>=20
> Best regards,
> -- =20
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>=20
>=20


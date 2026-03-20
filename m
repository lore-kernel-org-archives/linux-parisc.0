Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2DB27B327
	for <linux-parisc@vger.kernel.org>; Sat, 21 Mar 2026 05:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774069876; cv=none; b=j+4ves5B4sX4wlWZWB4fvLIialQovVHjKCo7cr0RXvYZWGbqepoYeAboZLOQd/bn3zaEgvfZuBitQre+rAEGldTdwNosY7Tcr/jICG4jPiGXayM5gWtLR3tZQHTZv0AzngO5Ri9pCXA9oOTDBoJwwnJfkm3QK+rMe3GPgQ2m7Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774069876; c=relaxed/simple;
	bh=qVwlCu1WIXntn26q1kvsy4ns7XCLQh3LUnFd91zRr48=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=LqcNqDnkjPZRBJ53IHQwk40kfNzkfmwo6oiIIJF9HcyFr9ITGRC13VbwaxmCdVCBPOleC+HOtsUuVVa+YRFolf4aP9RUUhwsSJsJloRJjkcXuSvQ457XeTKWgzyjzEEW5Adq6ed870Y8QRSD/d1+VvLi4rtS5wA7O/3wm+0oNFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLe7OxhB; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLe7OxhB"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7412b07f22so1590111a12.0
        for <linux-parisc@vger.kernel.org>; Fri, 20 Mar 2026 22:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774069873; x=1774674673; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7QxDv7wA5vy2wx/iALi99txiEfbwQ3ENlpnWZYhHz0A=;
        b=OLe7OxhBzFwMPIltVknpGrXU9DN7TZFVr3dJDvog+FEKXYmG+fHE2bFbgoZCuFCuw2
         0eJIPaT+MwpkQBDn5zFbJSu9h2HQa0J7qzB1ZsadIyJ8Bau/FOCcW7WsotI/JazwbOwC
         Liacvp0OhfIMtoPN1/bsxA1AetNrt12rxXcHel3gly35cWWZocy2wqHD4vswnXxER4SK
         TKXch+jKp5VDm59qDJg8ua+0OqFS8JstiSXF1Pwy5A8Zcue6JB5wdTTc5OSZOMyh9cCw
         BYWG4YhdCWoTZ4G1qzRqr0iGs0BgB00W7fAJFkySqVoTIt3dNWFPgkagFcG568A1/AfF
         xj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774069873; x=1774674673;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7QxDv7wA5vy2wx/iALi99txiEfbwQ3ENlpnWZYhHz0A=;
        b=qotGIJk3B6WYxpWJVRa/60dKRbPI7+yUZbU2TcJLI08VwrPyf2kTKhDDksjgq09SdA
         VH0OAxQKu9yS7+cjm7GhHw5TkWNA5tlpv8tvzu4fhELRcqTaPykF1pcu4JCSHQfClbS4
         DhyxDQqHSKq7LdqIuk1rIPPTkI39V6ArYBcRj07qTE9dtEoMxKvFEWLg/x97JB7aO7KG
         o6o+zOtKHJVeUw4S6W49npIIHkVxz0xOo2AkRTAnM2ghykOjcpqPdtoHyTd2mNqvMeaL
         +7iz0VXblWjnzT1JUtbmqFG9NiCxxTlGT6IIYYl2qG8moDfzDT4Yzbg1cYl9KLM2OI6j
         YRuA==
X-Forwarded-Encrypted: i=1; AJvYcCWAv0EIDXcqWlNQKm7HBiNj++HxmBF8EAzYssK76SytByop8YYkU89HiD41lBOScqFUwGKHzQKD5OQYHPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEaYE/8ik5m/1EWYe0KKw7Pr92sobkRs4MiuSlrhTIeUHEBVg
	n+rPNVQ3WBWbG8Qdzv0ww2wyqtY2Krci5aCvNT7dk1vbDHol+Zw9B3c7
X-Gm-Gg: ATEYQzxMvuk66JpY3JFUxtlPiwzKt6sP1OFs8m51IhJ10CvwchRzKTlun225yY5qQme
	EWYR0SvWqodYDwi8yOeDupkgsj+6Enii7f4lWBx4XDuxfhifCXQ6pLcqVip4Mw7nu0A/HLB9hqi
	UObQ5YhyYPDkukRMd7H1TEY9xttB0SrUINctX+CFH/JHWQVcrPZeM3ot1Wdk3zzGNewWOwhEc7/
	fNTz3cQNlMQnSlD/sH1j/V/yv05FEVx4m2yW0NjWQtjA0JR8ZmoFnehA0QYjx52p7geJeQ6dOoE
	TCdYXQTeAWitV/JmPY8YAznEop/32FU/dALe6iLT36FbNqzVoudhNVg0uo1sLMGZf/C7hQ/Q806
	HpMmgoMVBBt2TgV6m3Wz1MbYDF+SL/WJzIwfImdY4zpMkoLC6Eekee6Mn1mkwsxeQqpxCRMCUkv
	9zVA60tJOZxEQnehHinpEueg==
X-Received: by 2002:a05:6a21:4cca:b0:39b:9c3a:f54f with SMTP id adf61e73a8af0-39bb25e7511mr8216718637.32.1774069873215;
        Fri, 20 Mar 2026 22:11:13 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm2729778a12.16.2026.03.20.22.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:11:12 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] mm: change to return bool for ptep_test_and_clear_young()
In-Reply-To: <3fa94c3c89fd93fe22c8cb59967f064787d686aa.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Fri, 20 Mar 2026 11:27:48 +0530
Message-ID: <ikarxctf.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <3fa94c3c89fd93fe22c8cb59967f064787d686aa.1773890510.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> Callers use ptep_test_and_clear_young() to clear the young flag and check
> whether it was set. Change the return type to bool to make the intention
> clearer.
>

Right I checked all callers of ptep_test_and_clear_young(). I agree, we
only need bool here. 

> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  8 ++++----
>  arch/arm64/mm/contpte.c                      |  4 ++--
>  arch/microblaze/include/asm/pgtable.h        |  2 +-
>  arch/parisc/include/asm/pgtable.h            |  6 +++---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++--
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  6 +++---
>  arch/powerpc/include/asm/nohash/pgtable.h    |  4 ++--

I looked at it because of powerpc changes, but ended up looking into all
call sites anyways. So overall it LGTM (and I agree that we can remove
the unnecessary externs from function declarations)

With that please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661172;
	b=suVxwFcx33O+hvenIL7Z/lX70FQTQPHYWYgK6Hhj/7v4XXKNEc2t4vWp1j0kRf9NCPcy
	 aq+ZskMf7Pi39EbX8veaJRB0T93rbpKoSdCSW+7qlS7iGOKqMtNX9SawRwtbTZUA4AaJB
	 +A4Yjmh1odjmyuv73hrt/1t6ncX1zoS3O8vv+j+WBqN0HnkZzk6dxRPRu5FiCJMBZnOOI
	 bOoHYSz0RV2VNSgO653ngqS2iUgf8cwqDwtmhF9AH/vNQiYMjqtQTtJflyhPI551dj2yQ
	 l2RDdP/ED9Q5V2RDL85Vd4bgtFJrsWeTUoarfZ9QCfPmiFJEefAU8lpd3haMQTUl95w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
	b=bgx5VCFgABC7MNMx3GaWUD4xZ76OnrHAdwdANCwrCiOyNUHTJkZCnbb44A8nUD0Ft5Yg
	 2ahQtgKTzEkso6BvjcBwyXb4L6svoZHyruqCm9NCwZDKIlTWMg3kPBGG9aZjzQpTqdy6/
	 XOWZNjd69rrSgkAS8TWs3cyFzGx1cDuOCambZMZfDyvcmk2BhNfJTx3dInIlu+iuqkc/U
	 OtZylPCykk5aSunzd/BnIr3atamnuchoNZaiPVlEG24k5PzDj2fF5TI2JpPmFD0uf8IDD
	 7MzTnNuoe0xptRSSJ6xjH+HG1QT1a7DhcCmKiXhZV9rS7RPHOEN2J1Z++IvS5CFhYAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="rx8b/Fy+";
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8CB606A324
	for <linux-parisc@vger.kernel.org>; Mon,  2 Nov 2026 23:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A8CB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rx8b/Fy+
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6798c43a3d6so2465183d50.1
        for <linux-parisc@vger.kernel.org>; Mon, 02 Nov 2026 15:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1793661170; x=1794265970; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
        b=rx8b/Fy+NjWKy9Kt9BkYBTAgAdfsrCjtSJw8M4hgKdPwSbdNWSPDWS+qzcv7PpS2X0
         5GpXVRoxUaZ06rvZROEMQEK8Mttmw9rGPzF93KOiP9W3KhIAYixd7e7GNOgC4Fr334R+
         ZMd7FukI1GTj1DTuhU9+GULRf5Xbb/LNWXhyf+MMw2FwhCJ82Zi4Ko0jgs9VZCKtAS5x
         oaNuyuW9O/UX3/pzgRC6JwSMVmrAnNCPfmYE8DdZzfw6boqxFs9vrYo7Ge/Mx04wtHt3
         oH7W5UO7A+o2/swON24J9mUTxAOGRp+JLyPEKuWH7Od/aF95WucAzIhYr4/n/eokeaGH
         ubDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661170; x=1794265970;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
        b=HPIn5AXk8cAg5YkF4DXmcRstfvhnhDQGoZP3fvq+YDEpZgXJrjqHVkb1irDiHnmgB4
         iBIBwNBZXMvG7etCZhfJvXoHiiNJuUcGFOTVv33rD8KqlIZZUv7T9PqFpbvaaN2H200o
         WUPp8Ook3Z7Pn2YXz9bC2qk/Di/Uff1mhoth2RDsUuSQr3/j92q5oMdTvMyZ4sP4FO9D
         rlWSH/SKRzHpoARubN5z+znUifKYzRaYdEIRJ162xRca4EtO8HWu7jnt6+6SOZx8ELNX
         fpXXrXDbdsThhk3b08f+fu7JYsMPqLwMxFjnU5c3/5ckPszJ7mjPaOK1GRegauC09/Tc
         NC4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3lNP3ezsA3K5pGcGhCzw14x9FMWfE0bvKdwAZIEcEwTt9G8poftViGnXSfSbvhUMleIonoFX1DwC6eGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xAWwr/43YCYvsgYEOQYkfeHOpU7SuVAuV+F5CpQuB1oPZDb3N
	gKeiMX6vcg9Fk2QEK3N3TWZ7j5L+pJ+G4cF44C+L1B+gdkj777BFlnHOY4bfc9cDAwtP
X-Gm-Gg: AYBFou1ifEhFMkMzmbuadV6hJLv3beVvW+wHynw7HuI0EJEv949x007RSHn9UHSrtJk
	DSwBj33+BfXVcgf/xvYF0H5t8IVZkB1CUpDCSCpSnmaK6S8yMsBmmb0VHaLZqqx5ZSBt4RSwPLr
	ATiCRrzdvJaOkhWLk0NZkuZHCWITyBuhC/aQDnHrcWafY4TPX8cyrZILe1/rG22TLXmwggCW06E
	35V/dREgwv1vFCbvEqecM2Ed87laFMXqkFBUaWF8HdccxwhxWypeBf61sV+J2eMHmO3KHhAPMpt
	XoH5PeuG8b018PcCG79aLUWZwj8z60EZVzvmKnQYy5VWHjaVCe5HYEAjCUud0hEm1v4+uGjksnP
	XzkuDpL19tGYdJqb1tZgHsIOdlpfwNtr1wwLgB8FuR5lfdhaYoWwhCgKpcwvuhRZSf/51aM82X2
	/b/G1sBuisjn71wikXws9PPTb32hJyI+0ZXph5J2Fq9EJ1WmFFG6jYSxd35dYPYykgAHNtdOmCt
	22BBfrK6KcJkkliHT+Uw7wNsZmg7D3CA3F5l2/ViPbgAV8OWXxTUqo1EDZAbp0yAVKiGb2SDoXH
	HPhdbxj45xUj2sFEYOqMPZFD0oy4GXW9aYVtaPwCagpWC99EOipcieiEKewRFMlCRrHQfHoKsXq
	Bo7ObeaFxXuh0N98iLNIlK/xZWdxm5o0=
X-Received: by 2002:a05:690e:1094:10b0:66f:c1bc:408f with SMTP id 956f58d0204a3-67ba50187demr4711928d50.82.1793661169876;
        Mon, 02 Nov 2026 15:12:49 -0800 (PST)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3303ebsm5946481d50.18.2026.11.02.15.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:12:49 -0800 (PST)
From: Andrew Halaney <andrew@amutable.com>
Subject: [PATCH net-next 0/3] net: add SO_PASSCRED_THREAD to get a
 thread-specific SCM_CREDENTIALS
Date: Mon, 02 Nov 2026 17:12:33 -0600
Message-Id: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQrCMAyA4VcZORtoC27DVxEPJc1sQKMkRSZj7
 76y43f4/w2cTdjhNmxg/BOXj3bEywBUsz4ZpXRDCmmMISas+ZWV/+j0RjIujq0a54JTnMI4h2W
 mK0HPv8aLrOf6DsoNldcGj30/AKCaSmZ0AAAA
X-Change-ID: 20261012-halaney-scm-creds-thread-7170680f8c5c
To: Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>, 
 Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>
X-Mailer: b4 0.14.3

Currently, SCM_CREDENTIALS carries the pid of the thread-group leader,
despite carrying the uid/gid of the actual sending thread.
SO_PASSPIDFD_THREAD lets a receiver identify the sending thread, but
only through a pidfd. If you just want to know what the tid of the
sending thread is you have to do something like:

    1. Setup SO_PASSPIDFD_THREAD on the socket
    2. ioctl(thread_pidfd, PIDFD_GET_INFO) per message
    3. close(thread_pidfd) per message

For example systemd-journald wants to log the tid as "trusted field"
(aka provided by the kernel) but doesn't have a great way to do so
right now, unlike the options for uid/gid/pid which are covered by
SO_PASSCRED currently.

So add SO_PASSCRED_THREAD as a sibling of SO_PASSCRED. It delivers
SCM_CREDENTIALS_THREAD whose ucred carries the tid of the sending
thread instead of the thread-group leader. This is completely
independent of SO_PASSCRED, so a receiver can ask for both. Use
a new cmsg rather than changing SCM_CREDENTIALS because users
expect ucred.pid in that context to be the thread-group leader.

As with SO_PASSPIDFD_THREAD, recvmsg() on SOCK_STREAM sockets stops
merging data at a thread boundary once SO_PASSCRED_THREAD is set.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
Andrew Halaney (3):
      selftests/net: pass socket options to the scm_pidfd test flows
      net: add SO_PASSCRED_THREAD to get a thread-specific SCM_CREDENTIALS
      selftests/net: Add tests for SO_PASSCRED_THREAD

 arch/alpha/include/uapi/asm/socket.h            |   2 +
 arch/mips/include/uapi/asm/socket.h             |   2 +
 arch/parisc/include/uapi/asm/socket.h           |   2 +
 arch/sparc/include/uapi/asm/socket.h            |   2 +
 include/linux/socket.h                          |   1 +
 include/net/sock.h                              |   4 +-
 include/uapi/asm-generic/socket.h               |   2 +
 net/core/scm.c                                  |  32 ++--
 net/core/sock.c                                 |  14 ++
 net/unix/af_unix.c                              |   6 +-
 tools/testing/selftests/net/af_unix/scm_pidfd.c | 229 ++++++++++++++++++++----
 11 files changed, 242 insertions(+), 54 deletions(-)
---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20261012-halaney-scm-creds-thread-7170680f8c5c

Best regards,
-- 
Andrew Halaney <andrew@amutable.com>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2858C15B6
	for <linux-parisc@vger.kernel.org>; Tue, 21 Nov 2023 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n+9SPJ6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D4EC433C7;
	Tue, 21 Nov 2023 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700528032;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=n+9SPJ6o75rhwsieDWHDIvGW+mdr+rfk8UWOUvBkfaB6yUhtfWEq3eFVrM6GQHmpD
	 WfkkeTpaULzu/qcdy/tEOmVJeQT9sHaYpyJ8pSV+j8lrry09SSEt5EVfge/rp5k0BN
	 nR9wtdCUImebsr4VqadUI8NMamzltDGijl+C8c1Q=
Date: Mon, 20 Nov 2023 19:53:51 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-parisc@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-witty-cornflower-markhor-de329c@nitro>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

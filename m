Received: from rhirst.linuxcare.com (user-79-182.jakinternet.co.uk [194.88.79.182] (may be forged))
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id GAA27972
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 06:51:50 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5A679B007; Mon, 11 Dec 2000 13:49:18 +0000 (GMT)
Date: Mon, 11 Dec 2000 13:49:18 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@puffin.external.hp.com, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] A500 status update
Message-ID: <20001211134918.Q7166@linuxcare.com>
References: <200012070634.WAA07459@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012070634.WAA07459@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Dec 06, 2000 at 10:34:55PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Dec 06, 2000 at 10:34:55PM -0800, Grant Grundler wrote:
> o dd to raw disk isn't working right. "No space left on device".

Fixed.  Needs mfctl,w to read all 6 bits of SAR in wide mode.

Richard

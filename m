Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (i003-035.nv.iinet.net.au [203.59.3.35])
	by dsl2.external.hp.com (Postfix) with SMTP id F2DAA482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Aug 2001 04:46:46 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id SAA27183
	for parisc-linux@lists.parisc-linux.org; Fri, 3 Aug 2001 18:46:38 +0800
Date: Fri, 3 Aug 2001 18:46:36 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] dev-packages
Message-ID: <20010803184634.R5850@neep.com.au>
References: <20010802221905.C20250@parcelfarce.linux.theplanet.co.uk> <Pine.BSF.4.30.0108030645560.38503-100000@noc.zabbadoz.net> <20010803132528.G9637@neep.com.au> <20010803113539.B1011@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010803113539.B1011@linuxcare.com>; from rhirst@linuxcare.com on Fri, Aug 03, 2001 at 11:35:39AM +0100
List-ID: <linux-parisc.vger.kernel.org>

Quoth Richard Hirst:
> If for some reason you do want to find things directly, you should
> be aware that pkgs live in a pool now, and you wont find much under
> a sid/main/binary-hppa dir on your local mirror.

That's right, and the relative path of the file can be found in the
"Filename:" field of 'apt-cache show packagename'.  Append this to the
URL in your /etc/apt/sources.list and you have the complete URL of that
package to download, if for some reason you need to do the downloading
on another system.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."

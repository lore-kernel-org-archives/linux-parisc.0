Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id C644849F6
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 06:12:09 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B1B07B00C; Sat, 29 Sep 2001 13:10:17 +0100 (BST)
Date: Sat, 29 Sep 2001 13:10:17 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: 'Richard Allen' <ra@hp.is>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
Message-ID: <20010929131017.L5051@linuxcare.com>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F1@umr-mail03.cc.umr.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F1@umr-mail03.cc.umr.edu>; from nneul@umr.edu on Fri, Sep 28, 2001 at 02:02:09PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 28, 2001 at 02:02:09PM -0500, Neulinger, Nathan wrote:
> Ah, thanks!... wonder why it got enabled since I told it no on dhcp...
> Weird. (I'm not a debian user, so some of it's ways of doing things are a
> bit odd to me.)

Caused by a broken dhcp-client package.  Should be invoked via ifup/ifdown,
but was also being started via init scripts.  rm /etc/rc?.d/*dhcp-client
(if I rememeber the name right) to fix it.

Richard

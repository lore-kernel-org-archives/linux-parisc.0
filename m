Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA15689
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Dec 1999 16:23:38 -0700
Date: Mon, 6 Dec 1999 00:27:08 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] /usr/conf/machine header files
Message-Id: <19991206002708.A16979@mathe.stud.uni-erlangen.de>
References: <199912030047.QAA13676@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912030047.QAA13676@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> This directory seems to be a gold mine of information about hardware.

One extremely interesting piece of information for those interested in the
PA2.0 port:  64-bit virtual addresses are 42 bits per quadrant only and
start at the smallest address in the quadrant - so unlike alpha where the
addresses are "sign-extended".

	Philipp Rumpf

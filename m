Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4396D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jul 2001 09:50:39 -0600 (MDT)
Message-Id: <200107301550.RAA00052@sap-ag.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Andrew Gaylard <andrew.gaylard@za.didata.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dead keys in X
Date: Mon, 30 Jul 2001 17:50:37 +0200
References: <3B657709.4050201@za.didata.com>
In-Reply-To: <3B657709.4050201@za.didata.com>
MIME-Version: 1.0
List-ID: <linux-parisc.vger.kernel.org>

On Monday 30 July 2001 17:02, Andrew Gaylard wrote:
> The 'i' and 'o' keys in X are dead.  The 'i'-key at least
> sends a keycode-224 to X (as viewed in xev), but if I try
>
> 	xmodmap -e "keycode 224 = i"
>
> I get the error:
> 	xmodmap: commandline:0: bad keycode value (out of range)


Hi Andrew,

Just an idea: Does 
		xmodmap -e "keycode 0xE0 = i"
works ?

Helge

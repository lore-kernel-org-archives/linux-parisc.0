Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA00926
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:49:21 -0700
Date: Sat, 6 Nov 1999 19:26:14 +0100
From: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
To: Paul Bame <bame@debian.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] _end symbol in parisc linux?
Message-Id: <19991106192614.H11609@mathe.stud.uni-erlangen.de>
References: <199911020039.RAA11767@debian.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911020039.RAA11767@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Anybody know how to get PA-Linux to have an _end symbol like
> most other programs, including Intel Linux?

AFAIK we would need to have linker scripts to do so, which seems to be impossible
with the HP/UX ld.  So this is on the "things that will get nicer when we have
GNU binutils again" list.

	Philipp Rumpf

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.65.60])
	by dsl2.external.hp.com (Postfix) with SMTP id DE00D4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Jan 2003 01:22:43 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: Sir Ace <chandler@nateng.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] ldconfig problems
Date: Thu, 23 Jan 2003 09:20:14 +0100
References: <Pine.LNX.4.33.0301221734281.21999-100000@jordan.eng.nateng.com>
In-Reply-To: <Pine.LNX.4.33.0301221734281.21999-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200301230920.14321.deller@gmx.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thursday 23 January 2003 02:34, Sir Ace wrote:
> I am having issues with the libraries from the 'out-of-box' debian 3.0 for
> parisc...
>
> -------------------------------------------------------------------------
> /tmp/ccywfbmB.o(.eh_frame+0x11): undefined reference to
> `__gxx_personality_v0'
> collect2: ld returned 1 exit status


Link your c++ object files with g++, not with ld.

Helge

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (imap.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D241B482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jul 2003 13:19:54 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Mihails Nikitins <nikitins@latnet.lv>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: How to enable LCD screen on K-class?
Date: Thu, 10 Jul 2003 21:20:34 +0200
References: <1057826587.3f0d271b5b81a@clients.latnet.lv>
In-Reply-To: <1057826587.3f0d271b5b81a@clients.latnet.lv>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="koi8-r"
Message-Id: <200307102120.35215.deller@gmx.de>
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

On Thursday 10 July 2003 10:43, Mihails Nikitins wrote:
> > Woody Debian on my K-class does not show info on status LCD screen after
> > linux is started. How to configure this feature? LCD is working before OS
> > is loaded, then everything is black.
>
> Anyway, is it possible to get it working? I see that something is
> overwriting LCD diagnostic info while loading Linux.

Please send an output of /proc/cpuinfo. The Hardware-ID of your
system might be interesting to figure out, why it doesn't work.

Helge

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 91B204846
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Feb 2002 00:32:26 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Christoph Plattner <christoph.plattner@gmx.at>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem with the current HP PA setup of debian
Date: Thu, 14 Feb 2002 08:28:16 +0100
References: <3C6AF74F.DDCD362C@gmx.at>
In-Reply-To: <3C6AF74F.DDCD362C@gmx.at>
MIME-Version: 1.0
Message-Id: <200202140828.16464.deller@gmx.de>
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

On Thursday 14 February 2002 00:31, Christoph Plattner wrote:
> Hello PA-RISC hackers !
>
> Since the last update a few days ago (apt-get dist-upgrade),
> I cannot login as ROOT on the console (/dev/ttyS0), although
> `/etc/securetty' includes `ttyS0'.

Hi Christoph,

I had a lot of problems with the latest debian libc6 packages,
downgrading them again to 2.2.4-7 cured all my problems.
All 2.2.5-X (X=1..3) libc6 packages seem broken.
Maybe this also helps in your case ?

Regards,
Helge

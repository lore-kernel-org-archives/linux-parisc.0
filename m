Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 4EDDF482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jul 2003 14:46:41 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] stifb
Date: Tue, 8 Jul 2003 22:47:36 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <3F056E9500000F91@ocpmta4.freegates.net>
In-Reply-To: <3F056E9500000F91@ocpmta4.freegates.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200307082247.36466.deller@gmx.de>
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

On Tuesday 08 July 2003 16:06, Joel Soete wrote:
> I think I have the bad idea to compile it as builtin; unfortuantely I got
> following compiling error:
> drivers/built-in.o(.init.text+0xa778): In function `stifb_init':
> : undefined reference to `sti_get_rom'
> drivers/built-in.o(.exit.text+0x5d8): In function `stifb_cleanup':
> : undefined reference to `sti_get_rom'
> Any idea?

Hi Joel,

sorry, I can't reproduce it here with current CVS version....

Helge

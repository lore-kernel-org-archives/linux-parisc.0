Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 8C4D64895
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 27 Dec 2003 16:16:37 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] printk cleanup
Date: Sun, 28 Dec 2003 00:16:23 +0100
References: <3FEDC568.30006@tiscali.be>
In-Reply-To: <3FEDC568.30006@tiscali.be>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Message-Id: <200312280016.23280.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Saturday 27 December 2003 18:46, Joel Soete wrote:
> PS: I also notice some printk("\n" KERNEL_... "...");
> would it not be better to change in printk(KERNEL_... "\n...");

Mostly: No.
The "\n" is there to finish some previous printk()s and
the KERNEL_xx in the middle of the strings is needed 
after a \n to put the printed string in the right context
(e.g. this ensures the text to be prefixed correctly in
the kernel syslog).

Helge

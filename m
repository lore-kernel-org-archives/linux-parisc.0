Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (imap.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 8E46C4840
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 11:54:29 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti & b2k: doesn't work?
Date: Fri, 30 Jan 2004 19:54:18 +0100
References: <400CB8A10000846A@ocpmta3.freegates.net>
In-Reply-To: <400CB8A10000846A@ocpmta3.freegates.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200401301954.18808.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Friday 30 January 2004 15:01, Joel Soete wrote:
> Looking to solve the pb I encounter with b2k and pdc_console, I unfortunately
> figure out that sti console doesn't work at all on this b2k model.
> 
> To be honnest, as the builtin gfx card is not (yet and may be never) supported,
> I only use serial console till now.

Which graphics card do you have ?
What does "lspci -v" and/or dmesg (look for "sti:") says ?

Helge

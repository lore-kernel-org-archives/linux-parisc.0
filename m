Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 90FCC4839
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Jun 2002 16:50:23 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Martin =?iso-8859-1?q?K=FCchler?= <martin@k0k.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] tst unaligned access
Date: Thu, 13 Jun 2002 00:49:17 +0200
References: <200206122222.35054.martin@mail.k0k.net>
In-Reply-To: <200206122222.35054.martin@mail.k0k.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200206130049.17945.deller@gmx.de>
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

On Wednesday 12 June 2002 22:22, Martin Küchler wrote:
> After a successful uptime of about a month, I could not log in to my 712/60
> any longer. I found the following error message at the console:

Hi Martin,

FYI, I had similiar problems on a 715/50 in the past. It hung sometimes after one week
of uptime and it seemed to me as if the SCSI driver was unable to access the disc
and thus didn't gave me a login prompt or anything else.
After upgrading the kernel to the most recent one (>= 2.4.18-pa35) which has some
IRQ fixes in it , and which seems to cure the SCSI driver problems, the box now seems 
to work stable.
In case you update your kernel, could you please let us know if the box works stable for 
you too ?

Greetings,
Helge

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA12775
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 19:32:59 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel1.hp.com (Postfix) with ESMTP id 4772C25D
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jun 2000 19:34:01 -0600 (MDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 6E47D37E22
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jun 2000 19:35:38 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Where is umount syscall?
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Jun 2000 19:35:38 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000623013538.6E47D37E22@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Forwarded as willy can't send email to the list right now.

MJT
------- Forwarded Message

Date: Thu, 22 Jun 2000 19:57:37 -0400
From: willy@thepuffingroup.com
To: Pavel Roskin <proski@gnu.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Where is umount syscall?
In-Reply-To: <Pine.LNX.4.21.0006222049530.16942-100000@sunapee.transcept.com>; 
from Pavel Roskin on Thu, Jun 22, 2000 at 08:54:08PM -0400

On Thu, Jun 22, 2000 at 08:54:08PM -0400, Pavel Roskin wrote:
> Hello!
> 
> linux-2.3/include/asm-parisc/unistd.h doesn't define __NR_umount for some
> reason. Other architectures define it.

we only have umount2 (the form which takes a flag to indicate whether to
force the umount or not).

- -- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.

------- End forwarded message -----

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA08820
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 13:25:17 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel2.hp.com (Postfix) with ESMTP id A1A7B137
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jun 2000 13:26:18 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_4128721000"
Date: Thu, 22 Jun 2000 13:27:56 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000622192756.3AF5437E22@carmen.fc.hp.com>
Subject: [parisc-linux] Another header conflict, in.h
List-ID: <linux-parisc.vger.kernel.org>

This is a multipart MIME message.

--==_Exmh_4128721000
Content-Type: text/plain; charset=us-ascii

I've hit another header conflict. This one is not optimization related. File 
attched.

"Doctor it hurts when I do this." "Then don't do that!"

Any ideas?

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com


--==_Exmh_4128721000
Content-Type: text/x-csrc ; name="inproblem.c"; charset=us-ascii
Content-Description: inproblem.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="inproblem.c"

/* These CVS versions end up in $PREFIX/hppa1.1-linux/sys-include/ */
#include </home/taggart/puffin/palinux/linux-2.3/include/linux/in.h>
#include </home/taggart/puffin/palinux/glibc/inet/netinet/in.h>

int main(void)
{
	return 0;
}

--==_Exmh_4128721000--

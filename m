Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA08060
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 12:17:29 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel2.hp.com (Postfix) with ESMTP id EBAF22DF
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jun 2000 12:18:24 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_1275400460"
Date: Thu, 22 Jun 2000 12:20:02 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000622182002.B84C337E22@carmen.fc.hp.com>
Subject: [parisc-linux] Optimization problems
List-ID: <linux-parisc.vger.kernel.org>

This is a multipart MIME message.

--==_Exmh_1275400460
Content-Type: text/plain; charset=us-ascii

I've run into a problem compiling code -O2 with string.h and linux/fs.h. I've 
attached a sample program that causes the failure. Change the header path to 
point to your own CVS and remember to compile with -O2.  willy/pb mentioned 
that it's because gcc is using it's own "optimized" versions. Is anyone 
looking at this?

-- 
Matt Taggart
taggart@fc.hp.com


--==_Exmh_1275400460
Content-Type: text/x-csrc ; name="fsproblem.c"; charset=us-ascii
Content-Description: fsproblem.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="fsproblem.c"

/* These CVS versions end up in $PREFIX/hppa1.1-linux/sys-include/ */
#include </home/taggart/puffin/palinux/glibc/string/string.h>
#include </home/taggart/puffin/palinux/linux-2.3/include/linux/fs.h>

int main(void)
{
	return 0;
}

--==_Exmh_1275400460--

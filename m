Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sage.eli.net (sage.eli.net [209.63.203.98])
	by dsl2.external.hp.com (Postfix) with ESMTP id E210C482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Feb 2003 18:43:11 -0700 (MST)
Received: from vli82k7dbaker ([209.210.3.17]) by sage.eli.net
          (Netscape Messaging Server 3.6)  with SMTP id AAA7452
          for <parisc-linux@lists.parisc-linux.org>;
          Wed, 19 Feb 2003 17:43:09 -0800
From: "Dan Baker" <dan_baker@eli.net>
To: <parisc-linux@lists.parisc-linux.org>
Date: Wed, 19 Feb 2003 17:42:29 -0800
Message-ID: <003601c2d881$54da7920$830c1bac@vli82k7dbaker>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <20030220012101.7198.23807.Mailman@dsl2.external.hp.com>
Subject: [parisc-linux] X problems...
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

I've just installed the Debian 3.0 distro on my B2000. I had the usual
problems with consoles and the like. I've thus far been unable to get the
framebuffer device to work. The only docs I've found on it date back to
1999.


BUT, I did download source code for HP's Intel linux visualize driver. I
can't get it to compile, the assembler tells me there's an invalid opcode
(??) in the .o file. I'm not really a programmer, so I'm hoping somebody out
there can take a look at what they're doing and fix it. The files are at

ftp://ftp.hp.com/pub/ccd/soar2sdd/wk207/wk207en/hpgraphics_kernel-1.5.3-1.sr
c.rpm
and
ftp://ftp.hp.com/pub/ccd/soar2sdd/wk207/wk207en/hpgraphics_kernel-1.5.3-1.sr
c.rpm


SO, Any help either with compiling the driver or with configuring the
framebuffer would be appreciated

Dan Baker
Storage Admin
Electric Lightwave, Inc.

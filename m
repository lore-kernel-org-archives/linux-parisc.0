Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from moutvdom.kundenserver.de (moutvdom.kundenserver.de [195.20.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DE03482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Aug 2002 13:59:31 -0600 (MDT)
Received: from [195.20.224.204] (helo=mrvdomng3.kundenserver.de)
	by moutvdomng2.kundenserver.de with esmtp (Exim 3.35 #2)
	id 17iKag-0005rB-00
	for parisc-linux@lists.parisc-linux.org; Fri, 23 Aug 2002 21:59:30 +0200
Received: from [217.81.2.168] (helo=PLUTO)
	by mrvdomng3.kundenserver.de with esmtp (Exim 3.35 #2)
	id 17iKaf-0001qL-00
	for parisc-linux@lists.parisc-linux.org; Fri, 23 Aug 2002 21:59:30 +0200
From: "Tobias Giesen" <tobias_subscriber@tgtools.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 23 Aug 2002 21:59:52 +0200
Message-ID: <001a01c24adf$a5d50a00$a80251d9@PLUTO>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: [parisc-linux] Question (fbdev, fbset, debconf)
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

Hello,

after a long search in the archives and elsewhere this is seems to be
the only remaining place to ask.

I have a fresh install of Debian 3.0 on my HP Visualize C200. Everything
went fine, except:

X server: no screens found.

So I tried to run fbset or debconf, but even though I said yes when
asked whether I wanted frame buffer support during the installation, and
even though the debconf package is installed, I do not have any fbset or
debonf executables on my hard disk.

There is also no /dev/fbdev.

So which is the command to configure my Linux? How do I get a
/dev/fbdev?

Cheers,
Tobias

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 072504881
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 10:22:58 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ukqwlaaa for parisc-linux@lists.parisc-linux.org; Thu, 7 Mar 2002 10:22:15 -0700
Date: Thu, 7 Mar 2002 09:22:32 -0800
From: Randolph Chung <tausq@debian.org>
To: Tilo Jandt <tilo@jandt-online.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] JDK
Message-ID: <20020307172232.GD1883@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <5.0.2.1.2.20020307181121.00b2d8e8@mailbox.hrz.tu-chemnitz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.0.2.1.2.20020307181121.00b2d8e8@mailbox.hrz.tu-chemnitz.de>
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

> is there any JDK I can use with my HP 712/60?
> I tried the Sun JDK but I can't compile it.

I doubt the Sun JDK is supported on parisc-linux...

> Does anyone know what to do?

jikes is available on hppa-linux (apt-get install jikes), although I haven't
tried it myself.  Getting kaffe to work would be ideal, although last time 
I looked at it there's still quite a bit of porting work to do.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/

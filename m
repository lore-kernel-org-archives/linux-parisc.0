Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4ADE7482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 08:13:46 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id wdpjmaaa for parisc-linux@lists.parisc-linux.org; Fri, 5 Apr 2002 08:12:46 -0700
Date: Fri, 5 Apr 2002 07:13:36 -0800
From: Randolph Chung <randolph@tausq.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Jesus Climent <climent@stybba.ntc.nokia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64bit newbie question
Message-ID: <20020405151336.GB356@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020405135556.GO10207@shire.ntc.nokia.com> <Pine.LNX.4.44.0204051456300.28325-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0204051456300.28325-100000@sal.ucc.ie>
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

> I wondered what options I have to pass to gcc to created 64bit
> executables (e.g. a 64bit kernel), and/or whether the 'normal' gcc-3.0
> you get with apt-get is just capable of dealing with 32bit executables.

the 64-bit compiler we use to build kernels is not yet in debian, it is
available on ftp://ftp.parisc-linux.org/unofficial-debs/

i'm working on getting something into the Debian archive...

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (unknown [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC546482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 May 2002 00:32:36 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id cjnlnaaa for parisc-linux@lists.parisc-linux.org; Thu, 16 May 2002 23:30:50 -0700
Date: Thu, 16 May 2002 23:36:57 -0700
From: Randolph Chung <randolph@tausq.org>
To: James Mc Parlane <james@massive.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parsic function calling convention
Message-ID: <20020517063657.GZ30370@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <C1126400B227D411AC1200A00CC456B501448DAD@emailserver.massive.com.au> <20020517040717.7C7ED483D@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020517040717.7C7ED483D@dsl2.external.hp.com>
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

> I'm not aware of any authoritative, detailed documentation for PA1.1 ELF.
> Since PA1.1 (32-bit) ELF is hack from the existing 64-bit ELF, 
> You could start by looking at PA2.0 calling convention for HPUX.
> Either docs.hp.com or www.parisc-linux.org should have that specification.
> Otherwise, just write something in 'C' and see what gcc produces.

 From what I have seen, the 32-bit elf conventions are quite similar to
 the 32-bit som conventions. the biggest difference i know off the top
 of my head is that we don't do fp argument relocation.

 http://www.parisc-linux.org/documentation/index.html has some good
 links for the 32-bit SOM and 64-bit ELF runtime architectures.

 randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

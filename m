Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cmailg2.svr.pol.co.uk (cmailg2.svr.pol.co.uk [195.92.195.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77620484B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 18:39:03 -0600 (MDT)
Received: from modem-27.deorwine.dialup.pol.co.uk ([62.136.153.155] helo=there)
	by cmailg2.svr.pol.co.uk with smtp (Exim 3.35 #1)
	id 17kwI1-00042z-00
	for parisc-linux@lists.parisc-linux.org; Sat, 31 Aug 2002 01:39:02 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Will Newton <will@misconception.org.uk>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64 byte alignment
Date: Sat, 31 Aug 2002 01:10:38 +0100
References: <E17kvMv-0002G4-00.2002-08-31-00-40-01@cmailg2.svr.pol.co.uk> <20020830235705.GD14634@tausq.org>
In-Reply-To: <20020830235705.GD14634@tausq.org>
MIME-Version: 1.0
Message-Id: <E17kwI1-00042z-00.2002-08-31-01-39-02@cmailg2.svr.pol.co.uk>
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

On Saturday 31 Aug 2002 12:57 am, Randolph Chung wrote:

> nullification only applies to one instruction. you probably need a
> branch there.

I know, but I figured clearing the low 6 bits on an already aligned pointer 
would do no damage.

> another good way to do this is to write what you want in C, and tell gcc
> to tell you what you want :-)

Thanks! I trust gcc somewhat more than I do myself at this stage. :)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34F914829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Sep 2002 14:22:24 -0600 (MDT)
Date: Tue, 10 Sep 2002 22:22:07 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Randolph Chung <randolph@tausq.org>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] definition of EWOULDBLOCK in /usr/include/asm/errno.h
In-Reply-To: <20020909220448.GP17893@tausq.org>
Message-ID: <Pine.LNX.4.44.0209102220520.6365-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Randolph,

> Portability Note: In many older Unix systems, this condition was indicated by EWOULDBLOCK, which was a distinct error code different from EAGAIN. To make your program portable, you should check for both codes and treat them the same.
>
> sounds like good advice to me.. :-)

It's fixed this way in current zebra CVS. However, there might be other
applications which might be hit by this, as well.

Cheers,
--jochen

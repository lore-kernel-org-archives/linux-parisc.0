Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69B19482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 15:47:31 -0700 (MST)
Date: Fri, 9 Nov 2001 23:47:21 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA stuff now in CVS
In-Reply-To: <20011109222255.8DB90482C@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.40.0111092343380.12365-100000@alpha.bocc.de>
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

Hi Helge,

> Hi Jochen,
> Daniel's newest patch is in CVS only. Update your tree or download the whole
> kernel source from ftp://parisc-linux.org/cvs

That's what i did and checked. 

However in the CVS version, init_eisa_pic() is called before EISA_bus is 
set to 1, so all the initialisation isn't really written to the chip...

That's what my patch fixes.

Cheers,
Jochen

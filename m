Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BADA482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 14:11:55 -0600 (MDT)
Received: from [172.17.6.40] (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7DKBrI05419;
	Wed, 13 Aug 2003 16:11:53 -0400
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030813175340.GF18794@dsl2.external.hp.com>
References: <20030811043457.GA5653@dsl2.external.hp.com>
	<20030813175340.GF18794@dsl2.external.hp.com>
Content-Type: text/plain
Date: 13 Aug 2003 15:11:42 -0500
Message-Id: <1060805514.2011.1.camel@fuzzy>
Mime-Version: 1.0
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

On Wed, 2003-08-13 at 12:53, Grant Grundler wrote:
> grundler <513>xpdf -cmap dino31.pdf 
> Error: Unresolved inheritance operation
> grundler <514>

Hmm, it looks like you still have the libXt problem.  Are you sure you
installed the newly compiled one?

> *sigh*.
> Do I need to restart X11 or something?

I didn't.  All I did was pull libXt.so.6.0 out of the gcc-3.3.1 build
and copy it into /usr/X11R6/lib.  Then xpdf worked for me.

James

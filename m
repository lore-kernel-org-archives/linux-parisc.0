Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.65.60])
	by dsl2.external.hp.com (Postfix) with SMTP id 8DE074829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Dec 2002 03:21:51 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: grundler@dsl2.external.hp.com (Grant Grundler),
	James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults
Date: Sun, 22 Dec 2002 11:17:59 +0100
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
References: <randolph@tausq.org> <20021220223747.GD13478@dsl2.external.hp.com> <20021222071142.GA17710@dsl2.external.hp.com>
In-Reply-To: <20021222071142.GA17710@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200212221117.59064.deller@gmx.de>
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

On Sunday 22 December 2002 08:11, Grant Grundler wrote:
> On Fri, Dec 20, 2002 at 03:37:47PM -0700, Grant Grundler wrote:
> > >  	STREG	%r1,0(%r30)			/* Stick r1 (usp) here for now */
> > > +	ldo	16(%r30),%r30
> >
> > As David observed, this wants to use ",ma" and I'll work that out with
> > lamont/helge offline.
> > Something will get committed to 2.4.x/2.5.x trees this afternoon.
>
> *sigh*.  Can someone else test/commit this?

Seems to work without any problems on my 715/64.
I committed your changes to CVS (2.5.51-pa5).

Helge

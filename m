Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lefou.zayda.com (unknown [204.99.158.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id 129FD482C
	for <parisc-linux@parisc-linux.org>; Sat, 17 Nov 2001 00:32:56 -0700 (MST)
Date: Sat, 17 Nov 2001 07:32:54 +0000 (UTC)
From: Sonny Cook <sonny@aspersion.org>
To: Randolph Chung <randolph@tausq.org>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] pam/ssh seems to be whacked
In-Reply-To: <20011116232524.S391@tausq.org>
Message-ID: <Pine.LNX.4.33.0111170731300.4966-100000@lefou.zayda.com>
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

Wow, thanks.  That did the trick.
Sonny

On Fri, 16 Nov 2001, Randolph Chung wrote:

> > I upgraded to the latest version of libpam0g, libpam-runtime, and
> > libpam-modules, to no avail.  Needless to say, I cannot log in.
> >
> > I suspect that the libc6 upgrage goofed me up somehow.  Does anybody have
> > an idea, or place to start debugging?
>
> correct. the way to fix this is to run, as root:
>
> /etc/init.d/ssh restart
>
> randolph
>

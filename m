Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5058D4829
	for <parisc-linux@parisc-linux.org>; Sat,  5 Oct 2002 10:24:42 -0600 (MDT)
Message-Id: <200210051622.g95GM2VU010593@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] /usr/bin/ld: can not size stub section: Bad value
To: phi@hpfrcu81.france.hp.com (phi)
Date: Sat, 5 Oct 2002 12:22:02 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <3D9EA511.20D85BEA@hpfrcu81.france.hp.com> from "phi" at Oct 5, 2002 10:38:41 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> /usr/bin/ld: can not size stub section: Bad value
> /usr/bin/ld: BFD 2.12.90.0.14 20020627 Debian GNU/Linux internal error,

I presume that you are using debian gcc 3.0.4.  There are known problems with
branches.  This error is usually caused by a call branch being too far from
the start of the module, or function if using -ffunction-sections.
Compiling with gcc 3.2 or later may help.

> Is this a bug or faq today?

Both.  There are still some problems in this area that haven't been resolved.
However, the situation is better in 3.2 than 3.0.4.  kde30/Qt is one package
where there are still problems.

> It is while building a tiny prog linked with shared lib, 'may be' this as to
> do with the way the shared libs are build i.e short pic vs long pic?

I can't remember offhand when this was changed but there is no difference
between short and long pic in 3.2 and later.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

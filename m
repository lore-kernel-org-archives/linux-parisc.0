Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16BAB4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 May 2003 13:44:59 -0600 (MDT)
Date: Sun, 18 May 2003 19:44:36 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
In-Reply-To: <20030518171645.GH548@tausq.org>
Message-ID: <Pine.BSF.4.53.0305181942400.86062@e0-0.zab2.int.zabbadoz.net>
References: <Pine.BSF.4.53.0305181226340.86062@e0-0.zab2.int.zabbadoz.net>
 <20030518161001.GG548@tausq.org> <Pine.BSF.4.53.0305181640470.86062@e0-0.zab2.int.zabbadoz.net>
 <20030518171645.GH548@tausq.org>
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

On Sun, 18 May 2003, Randolph Chung wrote:

> > > once gcc-3.2 gets patched and glibc gets recompiled, you'll be ok.
> > > otherwise, consider downgrading to libc6_2.3.1-16 and everything will be
> > > ok.
> >
> > what about the gcc-3.3 debs that are distributed ? If I rebuilt the
> > packages from source with them would they be ok ?
>
> yes, that should work too.

didn't :((

rebuild vim by hand with gcc 3.3 and it again segfaulted on startup :(
seems like this is a problem with shared libs ?

what else will I need to rebuilt ? or other question - how often are
packages re-built by debian package building system (how-ever this
works) ?

-- 
Greetings

Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/

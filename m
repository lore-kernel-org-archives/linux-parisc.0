Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id D19BE4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Jun 2003 12:30:05 -0600 (MDT)
Date: Mon, 2 Jun 2003 18:29:45 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
In-Reply-To: <20030602181451.GB31212@dsl2.external.hp.com>
Message-ID: <Pine.BSF.4.53.0306021827240.1237@e0-0.zab2.int.zabbadoz.net>
References: <Pine.BSF.4.53.0306011303040.1237@e0-0.zab2.int.zabbadoz.net>
 <200306011543.59335.deller@gmx.de> <Pine.BSF.4.53.0306011402580.1237@e0-0.zab2.int.zabbadoz.net>
 <20030602181451.GB31212@dsl2.external.hp.com>
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

On Mon, 2 Jun 2003, Grant Grundler wrote:

Hi,

> On Sun, Jun 01, 2003 at 02:05:20PM +0000, Bjoern A. Zeeb wrote:
> > When palo cannot open the kernel and errors out shouldn't it fall back
> > to the dialog and ask one to which fields to change instead of simply
> > running into a dead end where I think I can only recover from with
> > physical access to the machine ?
>
> The same issue has annoyed me too.
> But not enough to hack on palo. I only work on machines remotely
> if I have remote power control (eg A500).
>
> Paul Bame is happy to take any patches people have to improve
> this behaviour.  Source is available via anon CVS:
> 	cvs -d pserver:anonymous@cvs.parisc-linux.org login
> 	cvs -d pserver:anonymous@cvs.parisc-linux.org co palo

on sunday eve I already dowloaded 1.2 src tarball and had a quick look
at it. I may come up with a very dirty quick hack but I really hate
gotos in C.

The Problem is that I am currently in the middle of my final exams.
Perhaps I might come up with a patch next weekend.

-- 
Greetings

Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/

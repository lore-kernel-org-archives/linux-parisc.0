Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta04ps.bigpond.com (mta04ps.bigpond.com [144.135.25.136])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EC62482B
	for <parisc-linux@parisc-linux.org>; Sat, 27 Oct 2001 19:44:13 -0600 (MDT)
Received: from bubble.local ([144.135.25.78]) by
          mta04ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GLW7SG00.1J7 for <parisc-linux@parisc-linux.org>; Sun, 28 Oct
          2001 11:50:40 +1000
Date: Sun, 28 Oct 2001 12:14:03 +1030
From: Alan Modra <amodra@bigpond.net.au>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>,
	debian-hppa-request@lists.debian.org
Subject: Re: [parisc-linux] Troubles with expect scripts
Message-ID: <20011028121403.F1050@bubble.sa.bigpond.net.au>
References: <3BDAC2FE.DBF72DDD@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BDAC2FE.DBF72DDD@esiee.fr>; from marteaut@esiee.fr on Sat, Oct 27, 2001 at 04:21:50PM +0200
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

On Sat, Oct 27, 2001 at 04:21:50PM +0200, Thomas Marteau wrote:
> 
> 	We are using some scripts using Expect language and they die with a
> segmentation fault and you can read this output in the dmesg:

This isn't a fix, but may be a workaround:  Try "export LD_BIND_NOW=1" to
disable lazy binding by the dynamic linker.

Alan

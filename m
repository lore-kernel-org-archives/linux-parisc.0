Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A2CC4857
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Jan 2004 02:21:21 -0700 (MST)
Date: Fri, 9 Jan 2004 01:49:04 -0800
From: Randolph Chung <randolph@tausq.org>
To: Matt Lewis <nitephyre@iinet.net.au>
Subject: Re: [parisc-linux] Xfree on C3000 visualize
Message-ID: <20040109094904.GA533@tausq.org>
References: <000a01c3d68f$45c6f500$0101a8c0@nitephyre>
	<20040109094354.GZ533@tausq.org>
	<001701c3d691$4ca17ec0$0101a8c0@nitephyre>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001701c3d691$4ca17ec0$0101a8c0@nitephyre>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

In reference to a message from Matt Lewis, dated Jan 09:
> ah crap..
> 
> ok then, can i use my normal TNT2 then?

(please reply on the list)

In general x86 video cards do not work because they have bios that need
to run x86 code (that's my understanding anyway). this has been
discussed several times on the list.  there's an additional problem
which is that some pa firmware refuses to boot with non-HP gfx cards.

Your best bet is to get a PCI Vis-EG card which do work quite well.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

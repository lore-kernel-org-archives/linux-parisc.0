Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk (unknown [81.2.110.254])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C79D4855
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Jan 2004 05:36:04 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	i09CWu0r014572; Fri, 9 Jan 2004 12:32:56 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	i09CWrGt014570; Fri, 9 Jan 2004 12:32:53 GMT
Subject: Re: [parisc-linux] Xfree on C3000 visualize
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Randolph Chung <randolph@tausq.org>
In-Reply-To: <20040109094904.GA533@tausq.org>
References: <000a01c3d68f$45c6f500$0101a8c0@nitephyre>
	<20040109094354.GZ533@tausq.org>
	<001701c3d691$4ca17ec0$0101a8c0@nitephyre>
	<20040109094904.GA533@tausq.org>
Content-Type: text/plain
Message-Id: <1073651569.13471.5.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Fri, 09 Jan 2004 12:32:50 +0000
Cc: Matt Lewis <nitephyre@iinet.net.au>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Gwe, 2004-01-09 at 09:49, Randolph Chung wrote:
> In general x86 video cards do not work because they have bios that need
> to run x86 code (that's my understanding anyway). this has been
> discussed several times on the list.  there's an additional problem
> which is that some pa firmware refuses to boot with non-HP gfx cards.

X has an emulator for this, and we do actually know how to init a tnt2
card (see the rivafb code for some of it). Your Tnt2 might actually
work, you never know 8)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc1-cwma1-5-cust42.swa.cable.ntl.com [80.5.120.42])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id 88C024829; Wed, 13 Nov 2002 08:40:45 -0700 (MST)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id gADG67bc012775;
	Wed, 13 Nov 2002 16:06:08 GMT
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id gADG65Uc012773;
	Wed, 13 Nov 2002 16:06:05 GMT
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Matthew Wilcox <willy@debian.org>
Cc: HPPA List <parisc-linux@parisc-linux.org>,
	grundler@parisc-linux.org, Randolph Chung <randolph@tausq.org>
In-Reply-To: <20021113153217.J30392@parcelfarce.linux.theplanet.co.uk>
References: <20021113153217.J30392@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 13 Nov 2002 16:06:04 +0000
Message-Id: <1037203564.11996.80.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Subject: [parisc-linux] Re: 2.4.20-rc1
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

On Wed, 2002-11-13 at 15:32, Matthew Wilcox wrote:
> (3) include/asm-parisc/ide.h.  2.4.20-rc1 removed some definitions from
> this file that weren't removed from asm-i386, so i put them back.  Alan,
> I presume this was your doing?

Not me AFAIK. The IDE in -ac is seperate so doesnt get merged

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dhcp23.swansea.linux.org.uk (unknown [81.2.110.254])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5E86482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 18:12:36 -0600 (MDT)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9) with ESMTP id h7E0C7ra004075;
	Thu, 14 Aug 2003 01:12:08 +0100
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9/Submit) id h7E0C6gd004073;
	Thu, 14 Aug 2003 01:12:06 +0100
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: James Bottomley <James.Bottomley@SteelEye.com>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <1060815215.1987.2.camel@fuzzy>
References: <20030811043457.GA5653@dsl2.external.hp.com>
	 <20030813175340.GF18794@dsl2.external.hp.com>
	 <1060805514.2011.1.camel@fuzzy>
	 <20030813213204.GA26014@dsl2.external.hp.com>
	 <1060815215.1987.2.camel@fuzzy>
Content-Type: text/plain
Message-Id: <1060819924.4004.0.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 14 Aug 2003 01:12:05 +0100
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

On Mer, 2003-08-13 at 23:53, James Bottomley wrote:
> A lot of modern applications (particularly of the kde or gnome variety)
> pay absolutely no attention to potential colour map limitations and can
> blithely request more colours than you have available (and sometimes not
> even check for failure returns).

Set the display to a fixed colour mapping is the simplest approach.
XFree 4.x is quite happy to let you set different visuals and get
things like an 8bit fixed palette

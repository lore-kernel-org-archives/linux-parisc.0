Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72A3F4895
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 07:31:39 -0600 (MDT)
Date: Mon, 15 Jul 2002 15:31:36 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI framebuffer and PINE
Message-ID: <20020715133136.GR12241@charite.de>
References: <20020714091619.B1E35483A@dsl2.external.hp.com> <20020715142028.J27706@parcelfarce.linux.theplanet.co.uk> <3D32CDA9.2050403@itp.bg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D32CDA9.2050403@itp.bg>
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

On Mon, Jul 15, 2002 at 04:27:05PM +0300, Stephan Trajkoff wrote:

> My K class server works perfect with 240 users for mail.
> this server has apache, squid, pine,qmail

Quite nice.

> 4 cpu with 120mhz, 512mb ramm, 18GB HDD, what more???

* squid doesn't actually use more than one processor (state machine!)
* qmail is I/O bound.

Only a new Apache2 would benefit from a multi processor box.
If you replace qmail with postfix, you might speed things up a bit.

> my linux in my ISP is with P3 800Mhz, 256mb ram, 20GB HDD wtih apache, 
> mysql, radius, routing, shapers.
> Why did you call me lunatic???

Because Linux isn't really as stable on HPPA as on say Alpha or x386!

> Come here and see motor scooter 50cc runing at 80km/h:)))

I bet it's against the law :)

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
Went to Stop&Go to get ANOTHER case of insert favorite caffinated beverage here 

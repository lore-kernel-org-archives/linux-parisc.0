Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C9FB482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 May 2002 00:57:45 -0600 (MDT)
Date: Thu, 23 May 2002 07:35:31 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Armijn Hemel <armijn@nl.linux.org>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails
Message-ID: <20020523063531.GH3471@sleepie.demon.co.uk>
References: <20020517130527.J32014@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517152054.4F2CE482A@dsl2.external.hp.com> <20020517172600.I29738@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517154923.47C7E4838@dsl2.external.hp.com> <20020521155220.A28518@humbolt.geo.uu.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020521155220.A28518@humbolt.geo.uu.nl>
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

On Tue, May 21, 2002 at 03:52:21PM +0200, Armijn Hemel wrote:
> On Fri, May 17, 2002 at 09:49:23AM -0600, Grant Grundler wrote:
> > Can you be more specific (and cc the mailing list) where
> > you got the ISO from (ie file name)?

Since boot-floppies 3.0.22 (released 3rd April), at least, hppa has used
a 2.4.17-pa32 kernel.  Final woody b-f will use that same kernel, so
unless you have a very old ISO, I wouldn't expect a newer one to help.

If it turns out a more recent kernel is needed for some machines, I
could do a special b-f build and ISO.

Richard

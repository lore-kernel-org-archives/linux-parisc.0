Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (bay1-dav44.bay1.hotmail.com [65.54.244.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27D594829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 23:11:23 -0700 (MST)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Michael Wood" <mwood@its.uct.ac.za>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <se89551b.093@internal.us.fortis.com> <20030402092352.GA10035@marmite.its.uct.ac.za> <20030402113822.GB3363@cdc712-9.cdc.polimi.it>
Subject: Re: [parisc-linux] soft power and power light on 712/60
Date: Fri, 4 Apr 2003 08:09:00 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <BAY1-DAV44hAj5p1Fjx0005361c@hotmail.com>
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

I had a similar problem a while ago. The following URL should lead you to
the discussion I had that time:
http://lists.parisc-linux.org/hypermail/parisc-linux/8454.html
So eventually, the soft power worked, and is still working on my 712/60 even
with the latest kernel. Please note that I build the kernels myself, I never
use prebuilt ones (unless for installing ;) ). You should find my working
.config as an attachment
(http://lists.parisc-linux.org/hypermail/parisc-linux/att-8454/02-.config).
You can use this one, or do a diff with your .config to see what you're
missing.

Hope this helps.

Kenneth

----- Original Message -----
From: "root" <root@cdc712-9.cdc.polimi.it>
To: "Michael Wood" <mwood@its.uct.ac.za>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Wednesday, April 02, 2003 1:38 PM
Subject: Re: [parisc-linux] soft power and power light on 712/60


> On Wed, Apr 02, 2003 at 11:23:52AM +0200, Michael Wood wrote:
> > On Tue, Apr 01, 2003 at 08:59:43AM -0600, Derek Ellis wrote:
>
> I've got a problem similar to yours with my 712-60 using 2.4.20-pa32
> precompiled. The power light while searching for a suitable boot
> media (as it should), then goes on as expected. The power switch does not
> work. With earlier kernels (say 2.4.9-something) it worked. Any advice on
> that ?
>
>
> > > Hello,
> > >
> > > I have sort of a weird problem.  I installed Debian 3.0 on Sunday and
> > > it came up great on my 712/60.  The only problem is the soft-power
> > > switch doesn't work and the power light flashes while searching for
> > > the boot device and then goes off once it starts booting.
> >
> > --
> > Michael Wood <mwood@its.uct.ac.za>
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

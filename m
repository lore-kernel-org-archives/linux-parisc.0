Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78C224829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 08:10:05 -0600 (MDT)
Date: Wed, 16 Apr 2003 15:09:58 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
Cc: Matthew Wilcox <willy@debian.org>,
	Gavin Hubbard <ghub005@xtra.co.nz>,
	<parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: Presicionbook success
In-Reply-To: <03Apr16.162029cest.119065@ns.hiscom.nl>
Message-ID: <Pine.LNX.4.44.0304161504230.28370-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-15
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

On Wed, 16 Apr 2003, [iso-8859-1] "Beerse, Corn=E9" wrote:

> Is this something like
> http://www6.tomshardware.com/storage/20030130/index.html ? Then you
> (electronically) cannot find any ide at all, its hidden behind the scsi
> interface. If you see part of it, then best to try to handle it as good a=
s
> possible (try 'not at all' for a start). I think the 'will probe later' c=
an
> be canceled, triggered by a found scsi interface.

The hard disks are removeable, but there is no obvious IDE-SCSI bridge
visible. It is build-in inside the laptop (i.e. non-removeable), and it's
obviously visible from the OS (at least linux sees the IDE chip). Whether
you can make any sensible use of it is a different question though ...

> For what its worth, I think the IRQ is hooked to the scsi interface, not =
to
> the processor.

This would make sense.

> btw, what does an `ioscan` from HP-UX report? I guess it only sees scsi.

Good question, I don't have the HP-UX root password. The Precisionbook
comes with two 4GB hard disks, both with HP-UX installed, but I have to
ask for the password (or does anybody know how to easily gain root access?)=
,
which I haven't done yet.

Greetings, Max

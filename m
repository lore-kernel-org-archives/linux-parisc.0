Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 478E14829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 08:20:18 -0600 (MDT)
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: Matthew Wilcox <willy@debian.org>, "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Re: Presicionbook success
Date: Wed, 16 Apr 2003 08:20:08 -0600
Cc: "Beerse, =?iso-8859-1?q?Corn=E9?=" <c.beerse@torex-hiscom.nl>,
	Matthew Wilcox <willy@debian.org>,
	Gavin Hubbard <ghub005@xtra.co.nz>,
	parisc-linux@lists.parisc-linux.org
References: <03Apr16.162029cest.119065@ns.hiscom.nl> <Pine.LNX.4.44.0304161504230.28370-100000@sal.ucc.ie> <20030416141513.GQ30643@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030416141513.GQ30643@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200304160820.08734.bjorn_helgaas@hp.com>
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

On Wednesday 16 April 2003 8:15 am, Matthew Wilcox wrote:
> On Wed, Apr 16, 2003 at 03:09:58PM +0100, M. Grabert wrote:
> > Good question, I don't have the HP-UX root password. The Precisionbook
> > comes with two 4GB hard disks, both with HP-UX installed, but I have to
> > ask for the password (or does anybody know how to easily gain root access?),
> > which I haven't done yet.
> 
> Surely you can boot it, interact with IPL and add `single' as a parameter
> to boot it in single-user mode?  Or does that ask for the pw too?

I think you want something like:

ISL> hpux -is

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B0CC488B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 08:15:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 195ngv-0008Lm-Ky; Wed, 16 Apr 2003 15:15:13 +0100
Date: Wed, 16 Apr 2003 15:15:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: =?iso-8859-1?B?IkJlZXJzZSwgQ29ybuki?= <c.beerse@torex-hiscom.nl>,
	Matthew Wilcox <willy@debian.org>,
	Gavin Hubbard <ghub005@xtra.co.nz>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Presicionbook success
Message-ID: <20030416141513.GQ30643@parcelfarce.linux.theplanet.co.uk>
References: <03Apr16.162029cest.119065@ns.hiscom.nl> <Pine.LNX.4.44.0304161504230.28370-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0304161504230.28370-100000@sal.ucc.ie>
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

On Wed, Apr 16, 2003 at 03:09:58PM +0100, M. Grabert wrote:
> Good question, I don't have the HP-UX root password. The Precisionbook
> comes with two 4GB hard disks, both with HP-UX installed, but I have to
> ask for the password (or does anybody know how to easily gain root access?),
> which I haven't done yet.

Surely you can boot it, interact with IPL and add `single' as a parameter
to boot it in single-user mode?  Or does that ask for the pw too?

(I have to confess to never having used hpux in anger ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

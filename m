Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F578482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Jun 2002 06:23:04 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17E7uG-0003t5-00; Sat, 01 Jun 2002 13:22:52 +0100
Date: Sat, 1 Jun 2002 13:22:52 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP-UX partition support
Message-ID: <20020601132252.F10366@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0205312335140.11012-100000@garibaldi.apptechsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0205312335140.11012-100000@garibaldi.apptechsys.com>; from jeremyd@apptechsys.com on Fri, May 31, 2002 at 11:46:15PM -0700
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

On Fri, May 31, 2002 at 11:46:15PM -0700, Jeremy Drake wrote:
> Is there, or are there any plans to make, a way to access HP-UX 
> partitions?  When I plug my HP-UX drive into my parisc linux box, I can't 
> see any partitions, let alone a file system.  This is no urgent matter, 
> just a curiosity...

it's vxfs (basically).  someone who was motivated enough could try
munging freevxfs to make it work...

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9EDE4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 10:01:45 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18YqvA-0001dA-00; Wed, 15 Jan 2003 17:01:44 +0000
Date: Wed, 15 Jan 2003 17:01:44 +0000
From: Matthew Wilcox <willy@debian.org>
To: "BUEHL,REINER (HP-Germany,ex1)" <reiner.buehl@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Is Linux and HP-UX coexistence on same system possible?
Message-ID: <20030115170144.K26554@parcelfarce.linux.theplanet.co.uk>
References: <FFE5E286773CD411873400D0B747AC580681AB8B@goedel.bbn.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <FFE5E286773CD411873400D0B747AC580681AB8B@goedel.bbn.hp.com>; from reiner.buehl@hp.com on Wed, Jan 15, 2003 at 05:56:03PM +0100
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

On Wed, Jan 15, 2003 at 05:56:03PM +0100, BUEHL,REINER (HP-Germany,ex1) wrote:
> Hi all,
> 
> Is it possible to install parisc linux into an empty logical volume of an
> existing HP-UX 11 installation and then boot one or the other OS?

No, I'm afraid not.  Linux doesn't understand the LVM that HP-UX uses.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

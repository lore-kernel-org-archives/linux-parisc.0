Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94099482C
	for <parisc-linux@parisc-linux.org>; Tue, 30 Oct 2001 09:01:40 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ybKc-0000DU-00; Tue, 30 Oct 2001 16:01:38 +0000
Date: Tue, 30 Oct 2001 16:01:38 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Bryan W. Headley" <bheadley@interaccess.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] cvs locked on the new server
Message-ID: <20011030160138.B26881@parcelfarce.linux.theplanet.co.uk>
References: <3BDECEB7.7020802@interaccess.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BDECEB7.7020802@interaccess.com>; from bheadley@interaccess.com on Tue, Oct 30, 2001 at 10:00:55AM -0600
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

On Tue, Oct 30, 2001 at 10:00:55AM -0600, Bryan W. Headley wrote:
> /var/cvs/obsolete/binutils-2.10 seems to be locked by uid26947.
> 
> Probably need to make some entries in the modules file. (Otherwise why 
> would I want something from the obsolete directory?)

Mmm, no, it seems to be deliberate.  pehc:/etc/passwd:
dir_renamed_read_your_mail:!!:26947:26947::/home/dir_renamed_read_your_mail:/bin/bash
which was put in place by Mike Ang _many_ months ago.  I thought this
directory was going to be deleted as part of the move to cvs.p-l.org.

Why do you want binutils-2.10 anyway?

-- 
Revolutions do not require corporate support.

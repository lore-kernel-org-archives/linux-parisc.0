Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C99B482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 10:42:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 166xrj-0003nU-00; Thu, 22 Nov 2001 17:42:23 +0000
Date: Thu, 22 Nov 2001 17:42:23 +0000
From: Matthew Wilcox <willy@debian.org>
To: Bdale Garbee <bdale@gag.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa kernel-headers.deb and offset.h
Message-ID: <20011122174223.D10023@parcelfarce.linux.theplanet.co.uk>
References: <20011119210811.E11431@linuxcare.com> <874rnpg8fp.fsf@rover.gag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <874rnpg8fp.fsf@rover.gag.com>; from bdale@gag.com on Tue, Nov 20, 2001 at 01:20:26AM -0700
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

On Tue, Nov 20, 2001 at 01:20:26AM -0700, Bdale Garbee wrote:
> > glibc build should use kernel-headers, but I guess libc6-dev_2.2.4-6
> > was built using some local kernel tree for the headers, and has picked
> > up a 64 bit offset.h.  so, anyone trying to build gdb will have to
> > replace their offset.h.
> 
> So, we've never had a real kernel-headers package before.  I guess once we get
> one that's right, we should re-spin glibc even if it's a binNMU.

*sigh*.  whenever i built glibc, i ensured it was built with 32-bit kernel
headers.

-- 
Revolutions do not require corporate support.

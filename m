Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7643482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 12:57:29 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16EFVP-0000Qo-00; Wed, 12 Dec 2001 19:57:27 +0000
Date: Wed, 12 Dec 2001 19:57:27 +0000
From: Matthew Wilcox <willy@debian.org>
To: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Firmware upgraded, STI console problem
Message-ID: <20011212195727.B22198@parcelfarce.linux.theplanet.co.uk>
References: <1008185675.31094.49.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1008185675.31094.49.camel@archimedes.localnetsolutions.com>; from jkinney@localnetsolutions.com on Wed, Dec 12, 2001 at 02:34:35PM -0500
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

On Wed, Dec 12, 2001 at 02:34:35PM -0500, James P. Kinney III wrote:
> Also, my processor is listed in firmware and docs as a PA8000. So why
> not 64-bit cpu. If I boot the 2.4.16-64 kernel, it hangs after the
> "branching" messege screen. 

this must surely be a faq by now.  the c160-era workstations shipped
with 32-bit firmware, so it's much more sensible to run a 32-bit kernel
on them.  why do people think a 64-bit kernel is better?  it's slower and
takes more ram than a 32-bit kernel.  the only benefit it might offer
(being able to deal with >4gb of ram, or >4gb virtual address space)
aren't applicable -- you can't put that much ram in a c160, and we don't
support 64-bit user processes yet.

-- 
Revolutions do not require corporate support.

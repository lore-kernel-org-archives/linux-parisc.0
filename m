Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 075D34850
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 13:49:20 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16ktCx-0005QN-00; Tue, 12 Mar 2002 20:49:19 +0000
Date: Tue, 12 Mar 2002 20:49:19 +0000
From: Matthew Wilcox <willy@debian.org>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error.
Message-ID: <20020312204919.I30538@parcelfarce.linux.theplanet.co.uk>
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk> <3C8E6704.81F14945@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C8E6704.81F14945@cup.hp.com>; from gururaj@cup.hp.com on Tue, Mar 12, 2002 at 12:37:24PM -0800
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

On Tue, Mar 12, 2002 at 12:37:24PM -0800, Gururaj Ananthateerta wrote:
> both of them are set to 'y'

OK.  Since this is an N class, the serial ports should be automatically
detected on the Diva card.  Towards the top of arch/parisc/kernel/pdc_cons.c
you'll see:

/* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems. 
 * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
#undef EARLY_BOOTUP_DEBUG

Change the #undef to #define and recompile.  Do you see any more output?

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D976482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 08:26:43 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 166vkP-0001vu-00; Thu, 22 Nov 2001 15:26:41 +0000
Date: Thu, 22 Nov 2001 15:26:41 +0000
From: Matthew Wilcox <willy@debian.org>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mutexes ?
Message-ID: <20011122152641.B10023@parcelfarce.linux.theplanet.co.uk>
References: <20011122103209.A1789@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011122103209.A1789@hp.is>; from ra@hp.is on Thu, Nov 22, 2001 at 10:32:09AM +0000
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

On Thu, Nov 22, 2001 at 10:32:09AM +0000, Richard Allen wrote:
> Is there a problem with threads and/os mutexes on parisc linux, or is it
> just me ?
> 
> checking for mutexes... no
> configure: WARNING: THREAD MUTEXES NOT AVAILABLE FOR THIS COMPILER/ARCHITECTURE.

what package?  many programs implement their own mutex support -- there's
nothing wrong with the ones in glibc.

-- 
Revolutions do not require corporate support.

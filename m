Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0F34482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 05:48:27 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17DOPq-0001x1-00; Thu, 30 May 2002 12:48:26 +0100
Date: Thu, 30 May 2002 12:48:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: Andy Walker <squawker@start.no>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fast-Wide Diff. SCSI on a 735
Message-ID: <20020530124826.W10366@parcelfarce.linux.theplanet.co.uk>
References: <200205291104.AA315359834@mail.centraltx.com> <20020529201334.8C23C482A@dsl2.external.hp.com> <1022707216.3cf54610c5ee8@nyepost.start.no> <20020530081452.GS3471@sleepie.demon.co.uk> <1022748512.3cf5e760c85db@nyepost.start.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1022748512.3cf5e760c85db@nyepost.start.no>; from squawker@start.no on Thu, May 30, 2002 at 10:48:32AM +0200
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

On Thu, May 30, 2002 at 10:48:32AM +0200, Andy Walker wrote:
> If you remember Richard, I was having all sorts of trouble with a Bluefish
> card in a 725/100 a while back. Think I got the same results in a C110 too.
> Recognized as Zalon, but hung up with SCSI timeouts if there was a disk
> attached. HP-UX booted happily off the same controller & disk.

Hmm.. Bluefish in a 725 should also fail due to non-coherent DMA.
But a C110 has the ccio chip in it, so Bluefish should work fine.

-- 
Revolutions do not require corporate support.

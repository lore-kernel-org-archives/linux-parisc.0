Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A53AB48A1
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 08:10:17 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17U6YH-0000ZN-00
	for parisc-linux@lists.parisc-linux.org; Mon, 15 Jul 2002 15:10:13 +0100
Date: Mon, 15 Jul 2002 15:10:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] O_DIRECT on devices
Message-ID: <20020715151013.N27706@parcelfarce.linux.theplanet.co.uk>
References: <20020711082259.GF822@tykepenguin.com> <20020715034632.E27706@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020715074219.18CD54861@dsl2.external.hp.com> <20020715122919.F27706@parcelfarce.linux.theplanet.co.uk> <20020715135757.GM808@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020715135757.GM808@tykepenguin.com>; from patrick@tykepenguin.com on Mon, Jul 15, 2002 at 02:57:57PM +0100
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

On Mon, Jul 15, 2002 at 02:57:57PM +0100, Patrick Caulfield wrote:
> My machine isn't SMP but could a similar bug cause the problem to occur between
> the CPU and the DMA controller of the SCSI card ?

you're on a C110, right?  that has a ccio IOC so you shouldn't have any
problems, unless there's a driver bug.  and the symbios driver gets a
lot of testing ;-)

what we could be seeing on your machine is incoherency between user &
kernel space.

-- 
Revolutions do not require corporate support.

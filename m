Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 97079482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 08:52:28 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16Q9PO-0006Vh-00; Mon, 14 Jan 2002 15:52:26 +0000
Date: Mon, 14 Jan 2002 15:52:26 +0000
From: Matthew Wilcox <willy@debian.org>
To: Rodolfo Baselli <rodolfo.baselli@deaprofessionale.it>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installation console problem
Message-ID: <20020114155226.I9193@parcelfarce.linux.theplanet.co.uk>
References: <3C42D90E.20909@deaprofessionale.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C42D90E.20909@deaprofessionale.it>; from rodolfo.baselli@deaprofessionale.it on Mon, Jan 14, 2002 at 02:11:42PM +0100
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

On Mon, Jan 14, 2002 at 02:11:42PM +0100, Rodolfo Baselli wrote:
> Hi out there!
> I'm trying to install the 0.9.3 CD on a HP9000/E45/A3130AW.
> I managed to boot the image, but then I got this message on the serial 
> line console:
> "If this is the last message you see, you may need to switch your 
> console. This is a common symptom - search the FAQ and mailing lists"
> but I found nothing, since I'm asking you... :-(
> What's happened?

The E45 isn't supported, unfortunately.  See the mailing list archives
for details, but basically the serial port needs a new driver and the
SCSI card needs a new driver.  Documentation for both of these cards is
not publically available.

-- 
Revolutions do not require corporate support.

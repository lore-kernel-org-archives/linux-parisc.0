Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id BEF4A4834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Oct 2002 16:20:33 -0600 (MDT)
To: Richard Nairn <richard@nairnconsulting.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 735/125 Wide Diff scsi 
In-Reply-To: Your message of "Thu, 24 Oct 2002 15:50:11 MDT."
             <20021024215011.GP26502@taurus.nairnconsulting.ca>
References: <20021024215011.GP26502@taurus.nairnconsulting.ca> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 24 Oct 2002 16:20:29 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20021024222029.D007F37D63@carmen.fc.hp.com>
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

Richard Nairn writes...

> Hi There,
> 
> I have a number of Seagate WD drives that I would like to put on my
> 735/125.  It doesn't seem to recognize them.  Is the Wide scsi chain
> supported?

Well if you're plugging it in to a narrow single ended bus the drive should 
fall back. If you're trying to plug it in to a wide high voltage 
differential bus that's not going to work.

So which bus does your 735 have?

-- 
Matt Taggart
taggart@fc.hp.com

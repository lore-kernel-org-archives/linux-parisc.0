Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CFE94829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 07:27:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 195mwQ-0006wg-QO; Wed, 16 Apr 2003 14:27:10 +0100
Date: Wed, 16 Apr 2003 14:27:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: Gavin Hubbard <ghub005@xtra.co.nz>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Presicionbook success
Message-ID: <20030416132710.GO30643@parcelfarce.linux.theplanet.co.uk>
References: <20030416123824.22413.48893.Mailman@dsl2.external.hp.com> <3.0.2.32.20030417011531.00a2bf20@pop3.xtra.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3.0.2.32.20030417011531.00a2bf20@pop3.xtra.co.nz>
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

On Thu, Apr 17, 2003 at 01:15:31AM +1200, Gavin Hubbard wrote:
> Before anyone loses too much sleep over this, the Precisionbook has
> internal SCSI-IDE bridges that sit between the HBA and the drives. I
> believe a similar system was used in some of the earlier Apple Powerbooks.

Yep, someone pointed that out in an earlier email.  I'm just trying to
figure out how to handle this for the best.

1) Provide a pci quirk that deletes the IDE device from the bus
2) Hack the IDE driver to not claim that device if it's on a PrecisionBook
3) Ignore the scsi device and let the IDE driver drive the chips
4) Er.. something else.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

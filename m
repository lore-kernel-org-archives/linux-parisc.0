Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7494482D
	for <parisc-linux@parisc-linux.org>; Fri,  1 Nov 2002 10:04:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 187fDE-0007Tf-00; Fri, 01 Nov 2002 17:04:00 +0000
Date: Fri, 1 Nov 2002 17:04:00 +0000
From: Matthew Wilcox <willy@debian.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] SCSI patches
Message-ID: <20021101170400.A20749@parcelfarce.linux.theplanet.co.uk>
References: <20021101131818.S27461@parcelfarce.linux.theplanet.co.uk> <20021101160722.8AC994829@dsl2.external.hp.com> <20021101165834.GG10649@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021101165834.GG10649@sleepie.demon.co.uk>; from rhirst@linuxcare.com on Fri, Nov 01, 2002 at 04:58:35PM +0000
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

On Fri, Nov 01, 2002 at 04:58:35PM +0000, Richard Hirst wrote:
> NOTE though, that not all the zalon changes are in the diff willy
> posted; it doesn't include ncr53c8xx.c changes, at least.

Yeah, I noticed that after I posted it .. hence my recent commit that
brings those changes forward from 2.4.  I'm not sure I got everything
right, so please check it over.  I don't have access to a Zalon card
right now.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust111.brnt.cable.ntl.com [213.107.179.111])
	by dsl2.external.hp.com (Postfix) with ESMTP id C59CA4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Apr 2003 10:56:18 -0600 (MDT)
Date: Mon, 7 Apr 2003 17:44:21 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Still having raid issues
Message-ID: <20030407164421.GI8473@sleepie.demon.co.uk>
References: <20030407144351.44780.qmail@web12504.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030407144351.44780.qmail@web12504.mail.yahoo.com>
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

On Mon, Apr 07, 2003 at 07:43:51AM -0700, Derek Engelhaupt wrote:
> Ok, still having the same Raid creation issues from last week.  The
> only thing I can thing of is that my Make of the new CVS palo is
> screwy.  First time outside of class that I've actually had to install
> something from source so I included my make below.  What bothers me is
> the error that it can't stat iplboot.  I'm assuming that the iplboot

iplboot is only built if you compile on parisc, iirc.  The debian source
debian/pool/main/p/palo/palo_1.2.tar.gz contains iplboot, and there are
i386 palo debs for 1.2 in the archive too, if that's what you want.

Richard

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7A6F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jan 2002 08:28:30 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16M9nA-0006bl-00; Thu, 03 Jan 2002 15:28:28 +0000
Date: Thu, 3 Jan 2002 15:28:28 +0000
From: Matthew Wilcox <willy@debian.org>
To: Christian Suder <csuder@cisco.com>
Cc: Nick Papadonis <npapadon@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] DISREGARD 0.9.3 installer didn't set 712 bootable
Message-ID: <20020103152828.C23472@parcelfarce.linux.theplanet.co.uk>
References: <m3y9jhfmrn.fsf@localhost.localdomain> <m3u1u5fkmw.fsf@localhost.localdomain> <20020101203848.1634246f.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020101203848.1634246f.csuder@cisco.com>; from csuder@cisco.com on Tue, Jan 01, 2002 at 08:38:48PM -0800
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

On Tue, Jan 01, 2002 at 08:38:48PM -0800, Christian Suder wrote:
> The standard fdisk utility in Linux is pretty PC-ish, so you can only have
> 4 primary partitions. However you can create one of them as "extended"
> partition, and within this partition you can create additional ones,

this was a deliberate decision on our part to use the PC partition format
by default.  i don't think it's one to be ashamed of.  hpux's partitioning
scheme wasn't appropriate, and there are more tools which understand pc
partitioning than understand, say, sgi disklabels.

-- 
Revolutions do not require corporate support.

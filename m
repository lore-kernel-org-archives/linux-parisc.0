Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Christian Suder <csuder@cisco.com>,
	Nick Papadonis <npapadon@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] DISREGARD 0.9.3 installer didn't set 712 bootable 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Thu, 03 Jan 2002 15:28:28 GMT." <20020103152828.C23472@parcelfarce.linux.theplanet.co.uk>
References: <m3y9jhfmrn.fsf@localhost.localdomain> <m3u1u5fkmw.fsf@localhost.localdomain> <20020101203848.1634246f.csuder@cisco.com>  <20020103152828.C23472@parcelfarce.linux.theplanet.co.uk> 
Date: Thu, 03 Jan 2002 11:03:30 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020103180330.464F9482E@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> hpux's partitioning scheme wasn't appropriate

I'll go a step further: hpux boot loader supports two disk partitioning
schemes and both are unusable for linux. "hard partitioning" just
plain sucks and is unmaintainable. HPUX LVM partitions are unreadable by
linux since HP can't (not HP's IP) release the spec.

grant

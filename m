Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8074E482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Mar 2002 00:21:43 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16plH3-0004m5-00; Tue, 26 Mar 2002 07:21:41 +0000
Date: Tue, 26 Mar 2002 07:21:41 +0000
From: Matthew Wilcox <willy@debian.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Dump: need disk layout function.
Message-ID: <20020326072141.E22220@parcelfarce.linux.theplanet.co.uk>
References: <3CA01EB4.52B5F416@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CA01EB4.52B5F416@admin.france.hp.com>; from bruno_vidal@hpfrcu03.france.hp.com on Tue, Mar 26, 2002 at 08:09:40AM +0100
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

On Tue, Mar 26, 2002 at 08:09:40AM +0100, Bruno Vidal wrote:
> I'm looking for function that manage disk layout. In fact I'm looking
> for functions that are able to return start block and end block of
> a partition. Do you know if it exists (I'm sure that it exists), and where it is ?
> By the way, I'm looking for a function (or structure) that return the HPA 
> and the SPA of a disk (but for this I find nothing, except for the boot 
> disk in page0).

Tried fs/partitions/msdos.c?

How can a disc have HPA and SPA?  Are you trying to find the HPA/SPA of
the disc's controller?

-- 
Revolutions do not require corporate support.

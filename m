Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 286F2488B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Mar 2002 06:22:38 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16mE8b-0000pT-00; Sat, 16 Mar 2002 13:22:21 +0000
Date: Sat, 16 Mar 2002 13:22:21 +0000
From: Matthew Wilcox <willy@debian.org>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] code to handle disk partitions.
Message-ID: <20020316132221.A2179@parcelfarce.linux.theplanet.co.uk>
References: <1016088869.3c904925683bb@webmail.tiscali.be> <3C924032.6E5BB55D@cup.hp.com> <20020315190021.Z30538@parcelfarce.linux.theplanet.co.uk> <3C92E60D.E9D9A8ED@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C92E60D.E9D9A8ED@cup.hp.com>; from gururaj@cup.hp.com on Fri, Mar 15, 2002 at 10:28:29PM -0800
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

On Fri, Mar 15, 2002 at 10:28:29PM -0800, Gururaj Ananthateerta wrote:
> 
> where is this function
> get_all_partitions()
> 
> can it be still used.

my impression is this function has never existed.  it certainly has not
been removed during the 2.4 kernel series.

> I am looking partition handling functions,  I got some stuff in
> /drivers/block/blkpg.c

I think you probably want to start looking in fs/partitions/check.c,
function grok_partitions().

-- 
Revolutions do not require corporate support.

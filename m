Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C62F0482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 09:24:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18FGav-0006hv-00; Fri, 22 Nov 2002 16:23:54 +0000
Date: Fri, 22 Nov 2002 16:23:52 +0000
From: Matthew Wilcox <willy@debian.org>
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cpu affinity
Message-ID: <20021122162352.C24043@parcelfarce.linux.theplanet.co.uk>
References: <CB813811CBF6D3118DCC00902740BB4A0B89A7E7@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CB813811CBF6D3118DCC00902740BB4A0B89A7E7@xsp01.brazil.hp.com>; from leandro.farinati@hp.com on Fri, Nov 22, 2002 at 08:20:03AM -0800
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

On Fri, Nov 22, 2002 at 08:20:03AM -0800, FARINATI,LEANDRO (HP-Brazil,ex1) wrote:
> Hi people,
> 
> 	Does anybody know if hppa linux implements cpu affinity?

Yes, this is a generic facility.  AIUI the facility is not exposed to
userspace but it's used by (for example) ksoftirqd.

I assume you're talking about process <-> CPU affinity rather than any
other form of affinity ...

-- 
Revolutions do not require corporate support.

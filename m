Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF652482A
	for <parisc-linux@parisc-linux.org>; Tue, 30 Jul 2002 00:30:13 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17ZQWH-0004x8-00; Tue, 30 Jul 2002 07:30:09 +0100
Date: Tue, 30 Jul 2002 07:30:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] GCC CVS strange update?
Message-ID: <20020730073009.N1441@parcelfarce.linux.theplanet.co.uk>
References: <3D38181A000003D9@ocpmta6.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D38181A000003D9@ocpmta6.be.tiscali.com>; from jsoe0708@tiscali.be on Tue, Jul 30, 2002 at 08:27:39AM +0200
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

On Tue, Jul 30, 2002 at 08:27:39AM +0200, jsoe0708@tiscali.be wrote:
> Yesterday morning I do a cvs update of what I believe till last week being
> gcc-3.1
> (CVS/Tag == Tgcc-3-1-branch) but gcc/gcc/version.c shows me now 3.2 (well
> the current development CVS being now 3.3)?

ah, you haven't been following the gcc mailing list.  due to a pressing
need to change the c++ ABI, the current 3.1 development tree has been
renamed to 3.2 and the erstwhile 3.2 development line has been renamed
to 3.3.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AA5F4831
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 09:26:38 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16aflM-0000Fp-00; Tue, 12 Feb 2002 16:26:36 +0000
Date: Tue, 12 Feb 2002 16:26:36 +0000
From: Matthew Wilcox <willy@debian.org>
To: Arnaud.ATOCH@oecd.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] $$divU undefined reference
Message-ID: <20020212162636.B1173@parcelfarce.linux.theplanet.co.uk>
References: <C12531D038D1D011B1DB0000F8036C280BBA4743@eosm5.oecd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <C12531D038D1D011B1DB0000F8036C280BBA4743@eosm5.oecd.org>; from Arnaud.ATOCH@oecd.org on Tue, Feb 12, 2002 at 05:23:24PM +0100
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

On Tue, Feb 12, 2002 at 05:23:24PM +0100, Arnaud.ATOCH@oecd.org wrote:
> I'm trying to compile sqlrelay http://www.firstworks.com/sqlrelay on a 0.9.3
> HP 712 box with 2.4.16 kernel and deb packages up-to-date.
> 
> I got the following linking error message :
> 
> ecodev01:/tmp/rudiments-0.23/src# ld -G -o ../lib/librudiments.so.0.23
> daemonprocess.o signalclasses.o commandline.o server.o client.o
> semaphoreset.o sharedmemory.o randomnumber.o regularexpression.o text.o
> datetime.o permissions.o -lc -lm -ll
> server.o: In function `std::__default_alloc_template<true,
> 0>::_S_chunk_alloc(unsigned, int&)':
> server.o(.gnu.linkonce.t._ZNSt24__default_alloc_templateILb1ELi0EE14_S_chunk
> _allocEjRi+0xa0): undefined reference to `$$divU'

Don't use `ld' to link shared objects.  Link using gcc (if it's c code) or
g++ (if c++ code).  the compiler driver knows what extra libs to link in.

-- 
Revolutions do not require corporate support.

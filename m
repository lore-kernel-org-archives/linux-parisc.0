Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CFE0482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 11:44:39 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 98B81B00C; Mon, 19 Nov 2001 18:46:38 +0000 (GMT)
Date: Mon, 19 Nov 2001 18:46:38 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "Griffin, Aubrey, BMCIO" <aubreygriffin@att.com>
Cc: 'Parisc-linux Mailing List' <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem compiling GDB
Message-ID: <20011119184638.B11431@linuxcare.com>
References: <5360C45FAB301541AEB3C6A45A6B6A0270684F@ocst09.ugd.att.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5360C45FAB301541AEB3C6A45A6B6A0270684F@ocst09.ugd.att.com>; from aubreygriffin@att.com on Mon, Nov 12, 2001 at 05:16:37PM -0500
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

PT_CR30 used to exist in offset.h, see

http://cvs.parisc-linux.org/linux/include/asm-parisc/ptrace.h.diff?r1=1.12&r2=1.13

I just checked out the latest gdb source from cvs.parisc-linux.org and
changed PT_CR30 in gdb/pa-linux-nat.c to '-1'.  Builds now.  the gdbserver
stuff wouldn't build anyway, as it tries to include offsets.h, not offset.h.

btw, there is a gdb .deb on http://ftp.parisc-linux.org/unofficial-debs

Richard


On Mon, Nov 12, 2001 at 05:16:37PM -0500, Griffin, Aubrey, BMCIO wrote:
> All,
> 
> I am trying to compile GDB.
> 
> I downloaded gdb-20011024 from http://ftp.parisc-linux.org/cvs/
> 
> The compilation of gdb failed. There is an undefined constant PT_CR30. This
> is used in
> gdb/pa-linux-nat.c and gdb/gdb/gdbserver/low-linux.c.
> 
> Some PT_ constants are defined in /usr/include/asm/offset.h, but not
> PT_CR30.
> 
> Should this gdb bundle compile?
> 
> Is there another gdb package that compiles on this platform?
> 
> All help is appreciated.
> 
> Thanks in advance,
> Aubrey Griffin
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

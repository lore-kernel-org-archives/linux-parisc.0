Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id A6D754837
	for <parisc-linux@parisc-linux.org>; Mon,  4 Feb 2002 09:38:47 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id pkwglaaa for parisc-linux@parisc-linux.org; Mon, 4 Feb 2002 09:38:40 -0700
Date: Mon, 4 Feb 2002 08:38:42 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020204163842.GF624@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa-linux gcc-3.0.3: -O2 optimization does not handle fp args correctly
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

I was going to file this bug against gcc, but it looks like it's
just another instance of the fp relocation bug that has been
reported earlier..... Dave, Alan, any suggestions on how we should fix
this? 

The following program gives inconsistent output with -O1 vs -O2:

legolas[22:24] ~% gcc -O1 -o logtest logtest.c -lm
legolas[22:24] ~% ./logtest
float: nan
legolas[22:24] ~% gcc -O2 -o logtest logtest.c -lm
legolas[22:24] ~% ./logtest
float: -1.002099

The bug was first observed in the testsuite for 'mawk'. A simpler
testcase that illustrates the problem is:

#include <stdio.h>
#include <math.h>

void print_data(double d)
{
	fprintf(stderr, "float: %f\n", d);
}

int main(int argc, char **argv)
{
	double d = log(-8.0);
	print_data(d);
	return 0;
}

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/

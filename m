Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE1E54829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Jan 2003 23:24:08 -0700 (MST)
Received: from security.hp.com (cranston.fc.hp.com [15.1.44.224])
	by atlrel6.hp.com (Postfix) with ESMTP id 38AD213C0
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Jan 2003 01:24:03 -0500 (EST)
Date: Fri, 3 Jan 2003 23:24:05 -0700
From: LaMont Jones <lamont@hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: lamont@hp.com
Message-ID: <20030104062405.GB9826@cranston.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] gcc 3.2 ICE
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

This is a build log with a gcc 3.2 ICE..
http://buildd.debian.org/fetch.php?&pkg=xine-lib&ver=1-beta2-3&arch=hppa&stamp=1041582169&file=log&as=raw

It would appear that the gcc version used is:
    gcc-3.2_1:3.2.2ds3-0pre3

If that helps anyone...

(The maintainer switched over to gcc-3.2 when 3.0 was ICE'ing, but that
didn't fix the problem.)
 
gcc-3.2 -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../.. -I../../../include -I../../../include -I../../../src -I../../../src/xine-engine -I../../../src/xine-engine -I../../../src/xine-utils -Wall -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DXINE_COMPILE -O3 -I/usr/include/kde/artsc -c rpe.c -MT rpe.lo -MD -MP -MF .deps/rpe.TPlo  -fPIC -DPIC -o rpe.lo
rpe.c: In function `APCM_quantization':
rpe.c:422: internal error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.

If anyone wants, I'm happy to do the preprocessing, but I'll be heading out
of town Sunday for a week, and Saturday is understandably swamped...

lamont

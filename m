Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BE9E4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 12:20:32 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g8HI1200017819
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 14:01:03 -0400 (EDT)
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) id g8HI12wF017817
	for parisc-linux@lists.parisc-linux.org; Tue, 17 Sep 2002 14:01:02 -0400 (EDT)
Message-Id: <200209171801.g8HI12wF017817@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 17 Sep 2002 14:01:02 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] GCC patch to fix various problems in the passing of aggregates
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

This is a heads up to those that build from source.  A patch was applied
yesterday to the gcc 3.3 trunk to fix various ABI related problems in the
passing of aggregates.  It fixes various va_arg problems and improves
compatibility with the HP specified runtime architectures.  The downside
is that code (libraries) compiled with earlier versions of gcc may be
incompatible with new code.

The impact for 32-bit code is that 5-7 byte structs are now passed
correctly.  The patch also fixes a problem in passing structs with
a single char or short field.  Variable and zero sized types are now
also handled correctly.

The impact for 64-bit code is more significant.  All aggregates 
with a non-zero size MOD 8 were incorrectly padded when passed
by value.  This is now fixed.  As a GCC extension to the runtime,
variable and zero sized types are passed by invisible reference.

For more info, see <http://gcc.gnu.org/ml/gcc-patches/2002-09/msg00972.html>
and <http://gcc.gnu.org/ml/gcc-patches/2002-09/msg00975.html>.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C1854829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 12:43:03 -0600 (MDT)
Message-Id: <200209041842.g84Igx2n011400@hiauly1.hia.nrc.ca>
To: randolph@tausq.org
Date: Wed, 4 Sep 2002 14:42:59 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020904181156.GJ17893@tausq.org> from "Randolph Chung" at Sep 4, 2002 11:11:56 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] GCC and quad-precision floating point
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

I have just implemented some fixes and changed the long double size
to 128 bits on the hppa64 GCC ports.  For parisc-linux, the long double
support should be 128 bits (both for 32 and 64 bit) but we are currently
stuck at 64 bits because we are missing a bunch of quad library calls:

_U_Qfadd, _U_Qfsub, _U_Qfmpy, _U_Qfdiv, _U_Qfneg, _U_Qfsqrt, _U_Qfabs,
_U_Qfmin, _U_Qfmax, _U_Qfcnvff_sgl_to_quad, _U_Qfcnvff_dbl_to_quad,
_U_Qfcnvff_quad_to_sgl, _U_Qfcnvff_quad_to_dbl, _U_Qfcnvxf_sgl_to_quad,
_U_Qfcnvxf_dbl_to_quad, _U_Qfcnvfxt_quad_to_sgl, _U_Qfcnvfxt_quad_to_usgl,
_U_Qfcnvfxt_quad_to_udbl, _U_Qfcnvfxt_quad_to_dbl, _U_Qfeq, _U_Qfne,
_U_Qfgt, _U_Qfge, _U_Qflt, _U_Qfle.

There are probably some more for unordered comparisons.

Any chance that someone with contacts inside HP, might be able to
obtain the source code for these functions?  They are really part
of the ABI.

While it's relatively straightforward to implement these using the
quad-precision instructions in the PA 2.0 architecture for the 64-bit
port, it's non trivial to implement them for earlier architectures
using the 32-bit port.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] mmap and GCC precompiled headers
Date: Thu, 15 Jul 2004 16:25:01 -0400 (EDT)
Message-ID: <200407152025.i6FKP1ng011630@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Precompiled headers (PCH) seem to be broken at the moment on hppa-linux
on at least certain kernel versions (2.6.6-pa4) because of the following
assumption in the PCH implementation:

   This version assumes that the kernel honors the START operand of mmap
   even without MAP_FIXED if START through START+SIZE are not currently
   mapped with something.  */

int
mmap_gt_pch_use_address (void *base, size_t size, int fd, size_t offset)
{

Anybody have any ideas as to whether parisc-linux can support the
above?  It seems to break down for large PCH files.  START isn't
honored under hpux either.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

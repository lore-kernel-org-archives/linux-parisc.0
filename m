From: Ivar <orskaug@stud.ntnu.no>
Subject: [parisc-linux] Matrox Mystique & C3000
Date: Tue, 22 Jun 2004 17:15:44 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0406221657130.18505@leopard.stud.ntnu.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
To: parisc-linux@parisc-linux.org
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

Hello list,
I recently got my mystique working with matroxfb and kernel 2.4.24 by
modifying the write/read functions in mga.h. Everything seems
fine when passing noinit to the module. Standard card initialization
however,  fails. Has anyone else observed the same problem with other matrox cards
(Millenium etc)?

I really do not understand why, it fails while probing the
video memory (writing then reading the same address).

	cheers,

	Ivar
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

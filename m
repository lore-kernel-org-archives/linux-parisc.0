From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Runing small structs from functions.
Date: Thu, 10 Mar 2005 12:03:12 -0500
Message-ID: <20050310170312.GM22872@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
 parisc-linux@lists.parisc-linux.org
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


jda,

Currently the changes in the LA code for glibc mean that _dl_fixup
returns a small struct (function descriptor) to the trampoline.

Is it safe to assume that the small struct is always returned on ret0
and ret1? I ran some test programs and that seemed to be the case.

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

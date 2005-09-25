From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils breaks hppa kernel build,
Date: Sat, 24 Sep 2005 22:06:12 -0400 (EDT)
Message-ID: <200509250206.j8P26CdT003066__12633.8807669983$1416623925$gmane$org@hiauly1.hia.nrc.ca>
References: <200509250127.j8P1RMGg002900@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: 329888@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509250127.j8P1RMGg002900@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Sep 24, 2005 09:27:22 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > binutils-2.15 has this in include/opcodes/hppa.h:
> > { "fdc",        0x04001280, 0xfc003fdf, "cZx(s,b)", pa10, 0},
> > { "fdc",        0x04001280, 0xfc003fdf, "cZx(b)", pa10, 0},
> > { "fic",        0x04000280, 0xfc001fdf, "cZx(S,b)", pa10, 0},
> > { "fic",        0x04000280, 0xfc001fdf, "cZx(b)", pa10, 0},
> 
> The last "fic" opcode entry is wrong.  It's using the wrong
> instruction format, the mask is wrong, pa10 is wrong, etc.

The enclosed patch against binutils head adds the missing "fic"
entry.  I also noticed that we were missing a pa20 im5 variant for
"fdc".  This builds and checks with no regressions.  However,
the new entries aren't really tested.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: hppa.h
===================================================================
RCS file: /cvs/src/src/include/opcode/hppa.h,v
retrieving revision 1.59
diff -u -3 -p -r1.59 hppa.h
--- hppa.h	3 Aug 2005 15:08:52 -0000	1.59
+++ hppa.h	25 Sep 2005 01:58:35 -0000
@@ -755,6 +755,9 @@ static const struct pa_opcode pa_opcodes
 { "pdc",	0x04001380, 0xfc003fdf, "cZx(s,b)", pa10, 0},
 { "fdc",	0x04001280, 0xfc00ffdf, "cZx(b)", pa10, 0},
 { "fdc",	0x04001280, 0xfc003fdf, "cZx(s,b)", pa10, 0},
+{ "fdc",	0x04003280, 0xfc00ffff, "5(b)", pa20, FLAG_STRICT},
+{ "fdc",	0x04003280, 0xfc003fff, "5(s,b)", pa20, FLAG_STRICT},
+{ "fic",	0x040013c0, 0xfc00dfdf, "cZx(b)", pa20, FLAG_STRICT},
 { "fic",	0x04000280, 0xfc001fdf, "cZx(S,b)", pa10, 0},
 { "fdce",	0x040012c0, 0xfc00ffdf, "cZx(b)", pa10, 0},
 { "fdce",	0x040012c0, 0xfc003fdf, "cZx(s,b)", pa10, 0},
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

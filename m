From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PATCH hppa ordered load absolute ops
Date: Fri, 31 Jan 2003 16:27:17 -0500 (EST)
Message-ID: <200301312127.h0VLRHdq021554__42982.5988751419$1416622172$gmane$org@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@dsl2.external.hp.com, bug-binutils@gnu.org,
	parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <no.id> from "John David Anglin" at Jan 31, 2003 11:11:26 am
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I installed the following after testing on hppa-unknown-linux-gnu.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2003-01-31  Grant Grundler  <grundler@dsl2.external.hp.com>

        * hppa.h (ldwa, ldda): Add ordered opcodes.

Index: opcode/hppa.h
===================================================================
RCS file: /cvs/src/src/include/opcode/hppa.h,v
retrieving revision 1.49
diff -u -3 -p -r1.49 hppa.h
--- opcode/hppa.h	16 Dec 2002 09:57:03 -0000	1.49
+++ opcode/hppa.h	31 Jan 2003 21:13:31 -0000
@@ -407,6 +407,7 @@ static const struct pa_opcode pa_opcodes
 { "ldbx",       0x0c000000, 0xfc001fc0, "cXx(b),t", pa10, 0},
 { "ldwa",       0x0c000180, 0xfc00d3c0, "cxccx(b),t", pa10, FLAG_STRICT},
 { "ldwa",	0x0c001180, 0xfc00d3c0, "cmcc5(b),t", pa10, FLAG_STRICT},
+{ "ldwa",	0x0c0011a0, 0xfc1ff3e0, "cocc@(b),t", pa20, FLAG_STRICT},
 { "ldcw",       0x0c0001c0, 0xfc0013c0, "cxcdx(s,b),t", pa10, FLAG_STRICT},
 { "ldcw",       0x0c0001c0, 0xfc0013c0, "cxcdx(b),t", pa10, FLAG_STRICT},
 { "ldcw",	0x0c0011c0, 0xfc0013c0, "cmcd5(s,b),t", pa10, FLAG_STRICT},
@@ -417,6 +418,7 @@ static const struct pa_opcode pa_opcodes
 { "stby",	0x0c001300, 0xfc0013c0, "cscCx,V(b)", pa10, FLAG_STRICT},
 { "ldda",       0x0c000100, 0xfc00d3c0, "cxccx(b),t", pa20, FLAG_STRICT},
 { "ldda",	0x0c001100, 0xfc00d3c0, "cmcc5(b),t", pa20, FLAG_STRICT},
+{ "ldda",	0x0c001120, 0xfc1ff3e0, "cocc@(b),t", pa20, FLAG_STRICT},
 { "ldcd",       0x0c000140, 0xfc0013c0, "cxcdx(s,b),t", pa20, FLAG_STRICT},
 { "ldcd",       0x0c000140, 0xfc0013c0, "cxcdx(b),t", pa20, FLAG_STRICT},
 { "ldcd",	0x0c001140, 0xfc0013c0, "cmcd5(s,b),t", pa20, FLAG_STRICT},

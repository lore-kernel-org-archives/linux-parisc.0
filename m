From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Missing opcodes in PA 2.0
Date: Sat, 16 Jul 2005 19:50:06 -0400 (EDT)
Message-ID: <200507162350.j6GNo79q012011@hiauly1.hia.nrc.ca>
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

I've been reviewing the opcode table for gas an noticed that the
following opcodes appear to have disappeared from PA 2.0:

{ "idtlba",     0x04001040, 0xfc00ffff, "x,(b)", pa10, 0},
{ "idtlba",     0x04001040, 0xfc003fff, "x,(s,b)", pa10, 0},
{ "iitlba",     0x04000040, 0xfc001fff, "x,(S,b)", pa10, 0},
{ "idtlbp",     0x04001000, 0xfc00ffff, "x,(b)", pa10, 0},
{ "idtlbp",     0x04001000, 0xfc003fff, "x,(s,b)", pa10, 0},
{ "iitlbp",     0x04000000, 0xfc001fff, "x,(S,b)", pa10, 0},

I'm interested in knowing if PA 2.0 processors still support these
opcodes.

There are also some opcodes that may not ever have existed:

{ "lha",        0x04001300, 0xfc00ffc0, "cZx(b),t", pa10, 0},
{ "lha",        0x04001300, 0xfc003fc0, "cZx(s,b),t", pa10, 0},

{ "fstqx",      0x3c000200, 0xfc00dfc0, "cxft,x(b)", pa10, 0},
{ "fstqx",      0x3c000200, 0xfc001fc0, "cxft,x(s,b)", pa10, 0},

{ "fstqs",      0x3c001200, 0xfc00dfc0, "cmft,5(b)", pa10, 0},
{ "fstqs",      0x3c001200, 0xfc001fc0, "cmft,5(s,b)", pa10, 0},

I can't find documentation for the following:

/* These may be specific to certain versions of the PA.  Joel claimed
   they were 72000 (7200?) specific.  However, I'm almost certain the
  mtcpu/mfcpu were undocumented, but available in the older 700 machines.  */
{ "mtcpu",      0x14001600, 0xfc00ffff, "x,^", pa10, 0},
{ "mfcpu",      0x14001A00, 0xfc00ffff, "^,x", pa10, 0},
{ "tocen",      0x14403600, 0xffffffff, "", pa10, 0},
{ "tocdis",     0x14401620, 0xffffffff, "", pa10, 0},
{ "shdwgr",     0x14402600, 0xffffffff, "", pa10, 0},
{ "grshdw",     0x14400620, 0xffffffff, "", pa10, 0},

/* gfw and gfr are not in the HP PA 1.1 manual, but they are in either
   the Timex FPU or the Mustang ERS (not sure which) manual.  */
{ "gfw",        0x04001680, 0xfc00ffdf, "cZx(b)", pa11, 0},
{ "gfw",        0x04001680, 0xfc003fdf, "cZx(s,b)", pa11, 0},
{ "gfr",        0x04001a80, 0xfc00ffdf, "cZx(b)", pa11, 0},
{ "gfr",        0x04001a80, 0xfc003fdf, "cZx(s,b)", pa11, 0},

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

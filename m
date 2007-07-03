From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC trunk 20070630
Date: Tue, 3 Jul 2007 09:48:30 -0400 (EDT)
Message-ID: <200707031348.l63DmUrJ015142__39625.4758620218$1416624407$gmane$org@hiauly1.hia.nrc.ca>
References: <18058.7643.461885.7204@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <18058.7643.461885.7204@gargle.gargle.HOWL> from "Matthias Klose"
	at Jul 3, 2007 11:58:51 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The hppa64 cross compiler at least did build;

Since the dataflow merge, the hppa64-hp-hpux11.11 build fails at
the start of stage3.  More info is available in PR middle-end/32398.
The ptr-plus merge also has some affect.  After the pointer plus
merge, there's a small test case in the PR that's miscompiled
with the stage1 compiler.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

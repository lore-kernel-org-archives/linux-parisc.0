From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] "Unknown machine at ..." on N4k
Date: Wed, 14 Jul 2004 17:24:23 +0000
Message-ID: <40BD9F870001BC0C@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: "List Parisc" <parisc-linux@parisc-linux.org>
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

Hi all, 

I just noticed that that in during the "Found devices:" on the the N4k it=
's
mentioned:
[...]
18. DEW BC Runway Port at 0xfffffffffed24000 [36] { 7, 0x0, 0x584, 0x0000=
c
}
19. Unknown machine at 0xfffffffffed25000 [37] { 0, 0x0, 0x5d3, 0x00000
}
20. DEW BC Runway Port at 0xfffffffffed2c000 [44] { 7, 0x0, 0x584, 0x0000=
c
}
21. Unknown machine at 0xfffffffffed2d000 [45] { 0, 0x0, 0x5d3, 0x00000
}

Comparing with ioscan:
[...]
pbc         1  36                      pbc       CLAIMED     BUS_NEXUS 
  Bus Converter
processor   1  37                      processor CLAIMED     PROCESSOR 
  Processor
pbc         3  44                      pbc       CLAIMED     BUS_NEXUS 
  Bus Converter
processor   3  45                      processor CLAIMED     PROCESSOR 
  Processor

The 'Unknown machine' are in fact the cpu.

Any idea where I have to look for to change it?

TIA,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

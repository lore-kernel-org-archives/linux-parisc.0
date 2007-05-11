From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] DHCP issues in Cupertino (GSYPRF11 died again)
Date: Fri, 11 May 2007 15:48:30 -0500
Message-ID: <1178916510.3692.68.camel__11199.3398670622$1416624357$gmane$org@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <parisc-linux@lists.parisc-linux.org>
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

The root disc on GSYPRF11 became unbootable, so I'm reinstalling.

The upshot of this is that the DHCP/TFTP/Netboot server has been moved
to iodine.  At the moment, iodine only has dhcp entries for ion, ioz and
gsyprf11.  If you have a machine which uses dhcp to initialise its
ethernet interface (or you want to netboot) you'll have to update the
necessary files on iodine (usual root password for an a500).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

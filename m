From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] gsyprf11 has a failing root disk
Date: Sat, 17 Feb 2007 16:23:40 -0600
Message-ID: <1171751021.3379.27.camel__8805.24235913089$1416624295$gmane$org@mulgrave.il.steeleye.com>
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

The log is full of these:

sd 1:0:15:0: SCSI error: return code = 0x8000002
sda: Current: sense key=0x4
    ASC=0x3 <<vendor>> ASCQ=0x80

The ASCQ is vendor specific, but the key means "hardware error" and ASC
0x03 is usually associated with some type of internal write error, so I
think it's safe to say the root disc is dying.  Can we get it replaced?

Thanks,

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] sysfs names
Date: Mon, 6 Dec 2004 14:02:18 +0000
Message-ID: <20041206140218.GA10881@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


scooter:/sys/bus# ls */drivers/
eisa/drivers/:
hp100  sim710

parisc/drivers/:
Apricot  Dino              GSC SCSI (Zalon)  Lasi RS232  Serial RS232
Asp      EISA Bus Adapter  HP SDC            Lasi SCSI   Wax
CPU      GSC PS2           Lasi              Parallel    sti (native)

pci/drivers/:
acenic  hp100  parport_pc  serial  sti (pci)  sym53c8xx  tulip

platform/drivers/:
serial8250

scsi/drivers/:
sd  sr  st

serio/drivers/:
hil_kbd  hil_ptr

I'm going to go through and clean up our driver names.  In particular:
 - lower-case
 - replace spaces with underscores
 - eliminate brackets
 - choose better names

Here's my current thoughts:

parisc/drivers/:
apricot  dino      zalon      lasi_8250  serial_8250
asp      eisa      sdc        lasi_scsi  wax
cpu      gsc_ps2   lasi_core  parport    sti

pci/drivers/:
acenic  hp100  parport_pc  serial  sti  sym53c8xx  tulip

ISTR at one point, sti had to be disambiguated because sysfs would try
to create two directories in the same directory, but it looks like it
doesn't any more.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

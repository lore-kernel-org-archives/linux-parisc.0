From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.... b2k panic with raid1 :-( (I/O MMU ... out of
	mapping ressources)
Date: Thu, 20 Jan 2005 11:51:00 +0100
Message-ID: <41DE61B800004297@mail-8-bnl.mail.tiscali.sys>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: grundler@parisc-linux.org,
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

Hello all,

Since this morning I mirrored my disks (1 9Gb on 1 36Gb) but as soon as I=

try to 'apt-get update' the system now panic:

Kernel panic - not syncing: /CAD/linux-2.6.11-rc1-pa3/drivers/parisc/sba_=
iommu.c:
I/O MMU @ fed20000 is out of mapping resources

(nothing more sorry)

This pb occured with 2.6.11-rc1-pa3 32bit (config near c3k default), 2.6.=
11-rc1-pa2
64bit, 2.6.10-pa10 32bit and even with 2.6.8-pa11 64bit 

the fs on which I worked is:
/dev/md7               2015696    604044   1391176  31% /Sources

ie:
# cat /proc/mdstat
...
md7 : active raid1 sdb10[1] sda10[0]
      2047872 blocks [2/2] [UU]
...

and the slicing of those disks are:
# partition table of /dev/sda
unit: sectors

/dev/sda1 : start=3D       32, size=3D   128992, Id=3Df0
/dev/sda2 : start=3D   129024, size=3D   256000, Id=3Dfd
/dev/sda3 : start=3D   385024, size=3D   512000, Id=3Dfd
/dev/sda4 : start=3D   897024, size=3D 16773120, Id=3D 5
/dev/sda5 : start=3D   897056, size=3D  3198944, Id=3Dfd
/dev/sda6 : start=3D  4096032, size=3D   511968, Id=3Dfd
/dev/sda7 : start=3D  4608032, size=3D   255968, Id=3Dfd
/dev/sda8 : start=3D  4864032, size=3D   255968, Id=3Dfd
/dev/sda9 : start=3D  5120032, size=3D  4095968, Id=3Dfd
/dev/sda10: start=3D  9216032, size=3D  4095968, Id=3Dfd
/dev/sda11: start=3D 13312032, size=3D  4095968, Id=3Dfd

# partition table of /dev/sdb
unit: sectors

/dev/sdb1 : start=3D       32, size=3D   128992, Id=3Df0
/dev/sdb2 : start=3D   129024, size=3D   256000, Id=3Dfd
/dev/sdb3 : start=3D   385024, size=3D   512000, Id=3Dfd
/dev/sdb4 : start=3D   897024, size=3D 49278976, Id=3D 5
/dev/sdb5 : start=3D   897056, size=3D  3198944, Id=3Dfd
/dev/sdb6 : start=3D  4096032, size=3D   511968, Id=3Dfd
/dev/sdb7 : start=3D  4608032, size=3D   255968, Id=3Dfd
/dev/sdb8 : start=3D  4864032, size=3D   255968, Id=3Dfd
/dev/sdb9 : start=3D  5120032, size=3D  4095968, Id=3Dfd
/dev/sdb10: start=3D  9216032, size=3D  4095968, Id=3Dfd
/dev/sdb11: start=3D 13312032, size=3D  4095968, Id=3Dfd
/dev/sdb12: start=3D 17408032, size=3D 32767968, Id=3D83

(no pb encountered to build and sync the mirroring).

I just find a work around: mark a slice failed (mdadm --fail /dev/sda10)
and I can now doing my 'apt-get update'

Thanks in advance for help,
    Joel

PS: I presume that same pb will occure when I will try to upgrade the ins=
tall
(a debian unstable) so am I waiting the end of a restore before continuin=
g

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B7F4482E
	for <parisc-linux@parisc-linux.org>; Tue,  5 Aug 2003 09:57:59 -0600 (MDT)
Date: Tue, 5 Aug 2003 17:57:10 +0200
Message-ID: <3F2E2C77000006C7@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: linux-lvm@sistina.com
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3F2E2C77000006C7/mail.tiscali.be"
Subject: [parisc-linux] lvm2 pb on hppa-linux
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--========/3F2E2C77000006C7/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi all,

Since the announce of lvm2 I used succefuly lvm tools (also with evms tools
before 1.9 ie evms-1.2.1) on my linux hppa box runing a last updated linux-2.4.21-pa8
(+ a very small hack to use generic_ffs()).

Now I try to install lvm2 and dm1.

I so recover last lvm-1.0.7. I configure it and build PATCHES which I apply
against kernel (without VFS-lock). Then I reboot it and install tools:
_no pb_ :-)

# vgdisplay --version
vgdisplay: Logical Volume Manager 1.0.7
Heinz Mauelshagen
 Sistina Software  28/03/2003 (IOP 10)

# vgdisplay -v
--- Volume group ---
VG Name               EvmsLvm
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV      
         2
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               3.99 GB
PE Size               4 MB
Total PE              1022
Alloc PE / Size   
   896 / 3.50 GB
Free  PE / Size       126 / 504 MB
VG UUID               k7px10-qfN2-J3y0-fony-aczD-HLwn-ZnN9G3

--- Logical volume ---
LV Name                /dev/EvmsLvm/DebianRep
VG Name                EvmsLvm
LV Write Access        read/wri
e
LV Status              available
LV #                   1
# open                 0
LV Size                3 GB
Current LE             768
Allocated LE           768
Allocation             next free
Read ahead sectors     120
Block device    
      58:1

--- Logical volume ---
LV Name                /dev/EvmsLvm/JfsTst
VG Name                EvmsLvm
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 0
LV Size          
     512 MB
Current LE             128
Allocated LE           128
Allocation             next free
Read ahead sectors     120
Block device           58:2


--- Physical volumes ---
PV Name (#)           /dev/sdc (1)
PV Status             avai
able / allocatable
Total PE / Free PE    1022 / 126

_no pb_ to mount and use usually the first lv (/dev/EvmsLvm/DebianRep)

#df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/md2               1700208   1086488    52735
  68% /
/dev/md0                123891     58924     58571  51% /boot
/dev/md3                247791    132508    102490  57% /var
/dev/md4                123827      4118    113316   4% /tmp
/dev/md5                123827     10339    107095   9% 
home
/dev/md6               2015696   1200328    794892  61% /usr/src
/dev/md7               2015696   1927752     67468  97% /Sources
/dev/md8               2015696   1612664    382556  81% /Develop
/dev/EvmsLvm/DebianRep
                       3096336   2926848    138032  96% /Debian

I so go further and patch kernel with dm/patches/devicemapper-ioctl.patch
(no VFS-lock) rebuild it wihtout any pb or warning (about dm part :-)) ).
I so install dmsetup tool and reboot with this kernel sucessfully (no pb
to discover vg and lv as lvm1 tools are still installed)

The dmsetup create well special file:
# ll /dev/mapper
total 28
drwxr-xr-x    2 root     root         4096 Aug  5 17:52 .
drwxr-xr-x    9 root     root        24576 Aug  5 16:04 ..
crw-------    1 root     root      10,  63 Aug  5 17:52 control

:-)

To be care I "vgchange -a n", than compile and install lvm2 tools.
Then I just edit lvm.conf file so that filter only sd disc
filter = [ "a|^/dev/sd|, "r/.*/" ]
[...]
file = /var/log/lvm2.log

level=7

activation=1 # in log section

Unfortunately _vgchange_ failled to recover vg structure:

#vgscan --version
  LVM version:     2.00.05 (2003-07-18)
  Library version: 1.00.02-ioctl (2003-07-12)
  Driver version
  4.0.1

#vgscan
  Volume group "EvmsLvm" not found
    Wiping cache of LVM-capable devices
    Wiping internal cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "EvmsLvm"

Very strange: it first tell 'Volume group "EvmsLvm" not found' and finaly
'Finding volume group "EvmsLvm"' ?

Vgchange will it tell the true?
#vgchange -a y

too bad:
  Out of memory.  Requested 2483027988 bytes.
  Failed to read extents from /dev/sdc
  Unable to find volume group "EvmsLvm"

Any idea?

(As I use full log I join a gz of this lvm2.log)

Thanks in advance for help,
    Joel

PS: I do a similar exercise on my ia32 platform (same linux-2.4.21 not pa
specific naturaly) and do not met any pb.
There is anyway a small difference:
on the ia32 I build a vg over a disk slice; on hppa, allover a full disk
(i don't think that it does matter, but just in case?)





------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 



--========/3F2E2C77000006C7/mail.tiscali.be
Content-Type: application/x-gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lvm2.log.gz"

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
XQIA

--========/3F2E2C77000006C7/mail.tiscali.be--

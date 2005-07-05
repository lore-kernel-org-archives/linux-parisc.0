From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Tue, 5 Jul 2005 16:59:22 +0200
Message-ID: <42B91C140000455F@mail-1-bnl.tiscali.it>
References: <42BAE7C300003107@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="========/42B91C140000455F/mail-1-bnl.tiscali.it"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42BAE7C300003107@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--========/42B91C140000455F/mail-1-bnl.tiscali.it
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello Dave and * pa,

I trust, it's already a good news:
# cat /proc/cpuinfo ; uname -a ; echo " "; uptime
processor       : 0
cpu family      : PA-RISC 1.1e
cpu             : PA7300LC (PCX-L2)
cpu MHz         : 180.000000
model           : 9000/778/B180L
model name      : Merlin L2+ 180 (9000/778/B180L)
hversion        : 0x00005040
sversion        : 0x00000481
I-cache         : 64 KB
D-cache         : 64 KB (WB, 0-way associative)
ITLB entries    : 96
DTLB entries    : 96 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=3D4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (8 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 119.60
software id     : 2010134099

Linux patst004 2.6.10-pa10-b180 #1 Fri Jul 1 18:49:47 CEST 2005 parisc GN=
U/Linux
 
 16:43:53 up 2 days, 23:16,  4 users,  load average: 7.85, 7.10, 7.15
=3D=3D=3D=3D<>=3D=3D=3D=3D
# cat /proc/cpuinfo ; uname -a ; echo " "; uptime
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 400.000000
model           : 9000/785/B2000
model name      : Kazoo W+
hversion        : 0x00005d00
sversion        : 0x00000481
I-cache         : 512 KB
D-cache         : 1024 KB (WB, 0-way associative)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 794.62
software id     : 2011773200

Linux patst005 2.6.10-pa11-b2k32 #2 Mon Jul 4 19:37:53 CEST 2005 parisc G=
NU/Linux
 
 16:44:35 up 21:03,  6 users,  load average: 8.23, 8.08, 8.10
=3D=3D=3D=3D=3D=3D<>=3D=3D=3D=3D

Previously those 32bit kernel was panicing more/less quickly after the st=
art
of my "stress test" (respectively 2h and 5min)
>
 
> >
> > > > good news with gcc-4.0 (debian pakage) and '-mfixed-range=3Dfr6-f=
r21,fr27-fr31'
> > > >
> > > >     o 2.6.9-rc2-pa1 seems to works as fine as with original optio=
n
> > > >     o 2.6.9-rc2-pa13 the same
> > > >
> > > > (just have to backport some small stuff to  reach to compile kern=
els)
> > > >
> > > > I apply my stress test (tar loops + kernel build loops) during a
full
> > day
> > > > for each one without any pb ;-)
> > > >
> > > > I can now try a step forward: 2.6.10-pa + gcc-4.0, ...
> >
> > I'll have to try a gcc-4.0 built kernel to see if it improves things
> > on the c3k.
> >
> cool ;-)
> 
[...]
(in case of interest I attached my diff file)

> 
> > Just a note, a patch to fix the function pointer canonicalization
> > issue that you and others noticed was installed Friday to the 4.0 bra=
nch,
> > and Saturday to the GCC head.
> >
Next test (tomorow :-)

Thanks,
    Joel



--========/42B91C140000455F/mail-1-bnl.tiscali.it
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch-2.6.10-pa11-gcc40.gz"

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
AA==

--========/42B91C140000455F/mail-1-bnl.tiscali.it
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--========/42B91C140000455F/mail-1-bnl.tiscali.it--

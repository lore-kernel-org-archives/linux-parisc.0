From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: [parisc-linux] sym2 changes between 2.6.12 and 2.6.15
Date: Thu, 29 Dec 2005 19:16:19 +0100
Message-ID: <7d01f9f00512291016k67676c59i759121abdfa0cf24@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
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

Hi all

I recently got 2.6.15-rc7-pa0 booting up on my rp3440 and noticed sym
wasn't initializing HDs as it previously was, in fact it was
initializing in Narrow mode instead of wide:

with 2.6.12-rc6-pa1:
 target0:0:0: tagged command queuing enabled, command queue depth 16.
 target0:0:0: Beginning Domain Validation
 target0:0:0: asynchronous.
WIDTH IS 1
 target0:0:0: wide asynchronous.
 target0:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 62)
 target0:0:0: Ending Domain Validation

with 2.6.15-rc7-pa0:
 target0:0:0: tagged command queuing enabled, command queue depth 16.
 target0:0:0: Beginning Domain Validation
 target0:0:0: asynchronous.
 target0:0:0: FAST-40 SCSI 40.0 MB/s ST (25 ns, offset 31)
 target0:0:0: Domain Validation skipping write tests
 target0:0:0: Ending Domain Validation

in both cases, though, cat /sys/class/spi_host/host0/signalling says "LVD"

jejb suggested the following: in 2.6.15-rc7-pa0:
magnum:~# cat /sys/class/spi_transport/target0\:0\:0/dt
0
magnum:~# echo 1 > /sys/class/spi_transport/target0\:0\:0/dt
  target0:0:0: FAST-40 WIDE SCSI 80.0 MB/s DT (25 ns, offset 31)
cat /sys/class/spi_transport/target0\:0\:0/dt
1
magnum:~# cat /sys/class/spi_transport/target0\:0\:0/period
25
echo "12.5" >  /sys/class/spi_transport/target0\:0\:0/period
  target0:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)

but then, alas:
magnum:~# echo 1 > /sys/class/spi_transport/target0\:0\:0/revalidate
 target0:0:0: Beginning Domain Validation
 target0:0:0: asynchronous.
 target0:0:0: FAST-40 SCSI 40.0 MB/s ST (25 ns, offset 31)
 target0:0:0: Domain Validation skipping write tests
 target0:0:0: Ending Domain Validation

magnum:~# cat /sys/class/spi_transport/target0\:0\:0/min_period
reserved
magnum:~# cat /sys/class/spi_transport/target0\:0\:0/max_width
0
magnum:~# echo 1 > /sys/class/spi_transport/target0\:0\:0/max_width
magnum:~# echo 1 > /sys/class/spi_transport/target0\:0\:0/revalidate
 target0:0:0: Beginning Domain Validation
 target0:0:0: asynchronous.
 target0:0:0: wide asynchronous.
 target0:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 62)
 target0:0:0: Ending Domain Validation

at which point jejb said:
<jejb> OK, it's picking up narrow as an nvram setting
<jejb> that's a new feature of the driver (believing the nvram)
<jejb> there's probably some secret PDC call we should be doing instead

complete boot logs:
http://www.pateam.org/archive/logs/dmesg_rp3440-2.6.12-rc6-pa1.txt
http://www.pateam.org/archive/logs/dmesg_rp3440.txt

HTH

T-Bone

--
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

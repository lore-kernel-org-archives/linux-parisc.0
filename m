Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dymwsm08.mailwatch.com (dymwsm08.mailwatch.com [204.253.83.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DD94482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Mar 2002 07:23:57 -0700 (MST)
Received: from MWSC0208.MW4.MAILWATCH.COM (mwsc0208.mw4.mailwatch.com [204.253.83.244])
	by dymwsm08.mailwatch.com (8.11.0/8.11.0) with ESMTP id g2KENoh02500
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Mar 2002 09:23:50 -0500
Received: from eccmfw6.ford.com (mailfw6.ford.com [136.1.1.30])	by dymwsm09.mailwatch.com (8.11.0/8.11.0) with ESMTP id g2KENo323881	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Mar 2002 09:23:50 -0500
Message-Id: <200203201423.g2KENo323881@dymwsm09.mailwatch.com>
Received: by mailfw6.ford.com id JAA06273  (InterLock SMTP Gateway 4.2 for parisc-linux@lists.parisc-linux.org);  Wed, 20 Mar 2002 09:23:00 -0500 (EST)
Date: Wed, 20 Mar 2002 09:23:36 -0500
From: Chris Rampson <crampson@ford.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/alternative; boundary="------------010301030109000208080802"
Subject: [parisc-linux] Mounting HPUX volumes/disks under PA-LINUX
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

--------------010301030109000208080802
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I had a really great idea - Use LINUX to install a HP-UX bootimage (and 
Solaris and IRIX and AIX and . . .). Theoretically you can boot from a 
LINUX (x86) server via tftp (stateless protocol), and then lay down an 
arbitrary image on the boot drive (also the CD install procedure would 
be the same for HPUX, Solaris, etc.). I knew that HP would be the 
toughest to get this working because of its logical volumes and "soft" 
partitions - and I was right.

   1.  I tried using sistina.com's LVM to try to mount a HPUX volume -
      and found out after testing (and reading from this list) that the
      two LVMs are NOT the same, nor even similar - except for the
      executable names. 
   2. I also tried mounting a HPUX full-disk partition, and palinux
      GRONKED and couldn't even recognize that the disk had a partition.
   3. I tried loading the HPUX executables for vgscan, vg-pv-lv
      whatever, to see if they would work. No dice, if they were
      dynamically linked, I might be able to load the corresponding
      library to get them to work - but alas, they are statically
      linked. I get mmap failures when I try to use them.
   4. The "reverse" of these procedures (mounting the palinux partitions
      under HPUX) yielded no successes either.

Is there a way to do this? Has anyone had success in mounting HPUX 
volumes/partitions? (JFS or HFS). Is there a plan to make this work?

It would be really nice to be able to replace IgniteUX, Jumpstart, 
RoboInst and our home-brew PC net installer (plus all the CD installs) 
with a single, open-source product. I would even put it on SourceForge!

--
Chris Rampson
UNIX Server Specialist

--------------010301030109000208080802
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<html>
<head>
</head>
<body>
I had a really great idea - Use LINUX to install a HP-UX bootimage (and Solaris
and IRIX and AIX and . . .). Theoretically you can boot from a LINUX (x86)
server via tftp (stateless protocol), and then lay down an arbitrary image
on the boot drive (also the CD install procedure would be the same for HPUX,
Solaris, etc.). I knew that HP would be the toughest to get this working
because of its logical volumes and "soft" partitions - and I was right.<br>
<ol>
  <li>&nbsp;I tried using sistina.com's LVM to try to mount a HPUX volume - and
found out after testing (and reading from this list) that the two LVMs are
NOT the same, nor even similar - except for the executable names.&nbsp;</li>
  <li>I also tried mounting a HPUX full-disk partition, and palinux GRONKED
and couldn't even recognize that the disk had a partition.</li>
  <li>I tried loading the HPUX executables for vgscan, vg-pv-lv whatever,
to see if they would work. No dice, if they were dynamically linked, I might
be able to load the corresponding library to get them to work - but alas,
they are statically linked. I get mmap failures when I try to use them.</li>
  <li>The "reverse" of these procedures (mounting the palinux partitions
under HPUX) yielded no successes either.</li>
</ol>
Is there a way to do this? Has anyone had success in mounting HPUX volumes/partitions?
(JFS or HFS). Is there a plan to make this work?<br>
<br>
It would be really nice to be able to replace IgniteUX, Jumpstart, RoboInst
and our home-brew PC net installer (plus all the CD installs) with a single,
open-source product. I would even put it on SourceForge!<br>
<br>
--<br>
Chris Rampson<br>
UNIX Server Specialist<br>
</body>
</html>

--------------010301030109000208080802--

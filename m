Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B5B1482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Apr 2002 09:40:12 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel8.hp.com (Postfix) with ESMTP id 15AA2A008ED
	for <parisc-linux@parisc-linux.org>; Tue, 16 Apr 2002 11:40:11 -0400 (EDT)
Received: from paul.bame (lart.fc.hp.com [15.1.54.48])
	by ldl.fc.hp.com (Postfix) with ESMTP id E20194528
	for <parisc-linux@parisc-linux.org>; Tue, 16 Apr 2002 09:40:10 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by paul.bame with esmtp (Exim 3.35 #1 (Debian))
	id 16xV3y-0004C9-00
	for <parisc-linux@parisc-linux.org>; Tue, 16 Apr 2002 09:40:10 -0600
Received: from ldl.fc.hp.com (linux-bugs.fc.hp.com [15.1.50.190])
	by atlrel9.hp.com (Postfix) with ESMTP
	id 45991804CEC; Tue, 16 Apr 2002 11:37:10 -0400 (EDT)
To: Manuel Fernandes <Manuel.Fernandes@lis2.siemens.pt>
Cc: cvsmaster@parisc-linux.org, parisc@parisc-linux.org
In-Reply-To: Your message of "Tue, 16 Apr 2002 13:23:06 BST."
             <B940662D7541D6118ED300065B1A223CA01903@siepor43.siemens.pt>
References: <B940662D7541D6118ED300065B1A223CA01903@siepor43.siemens.pt> 
Date: Tue, 16 Apr 2002 09:37:08 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E16xV12-0004AP-00@paul.bame>
Resent-Message-Id: <E16xV3y-0004C9-00@paul.bame>
Subject: [parisc-linux] Re: Python Exception Occurred while trying to get via http
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

> Dear Sirs,
> =20
> I was trying to get the  sources from your site for release rel0_9 but =
> your
> server displayed the following exceptions (see below):
> Can you explain me how can I get the Linux sources for this version or =
> any
> other?

Hmmm, I see this is not obvious from our main web site...

Daily kernel source snapshots are available as tarballs from
http://ftp.parisc-linux.org/cvs

		    --or--

Follow the "ANONYMOUS CVS" setup instruction at http://cvs.parisc-linux.org/
and then use the command:

	cvs co -rrel0_9 linux

	           ------

Beware that rel0_9 is nearly a year old and generally it is better to
simply get the latest version either from the tarball or

	cvs co linux

I don't think we will support downloading sources through the
'viewcvs' web GUI.

	-Paul Bame

> =20
> Thanks in advance
> =20
> =20
> The explorer address was:
> http://cvs.parisc-linux.org/linux/linux.tar.gz?tarball=3D1
> <http://cvs.parisc-linux.org/linux/linux.tar.gz?tarball=3D1&only_with_ta=
> g=3Drel0
> _9> &only_with_tag=3Drel0_9
> 
> 
> 
> =20
> 
> =20
> 
> Python Exception Occurred
> 
>  [LOGO] <http://cvs.parisc-linux.org/images/htux.gif> =09
> Traceback (innermost last):
> 
>   File "/usr/share/viewcvs/lib/viewcvs.py", line 2516, in run_cgi
> 
>     main()
> 
>   File "/usr/share/viewcvs/lib/viewcvs.py", line 2502, in main
> 
>     download_tarball(request)
> 
>   File "/usr/share/viewcvs/lib/viewcvs.py", line 2424, in =
> download_tarball
> 
>     generate_tarball(fp, os.path.basename(directory), directory, tag)
> 
>   File "/usr/share/viewcvs/lib/viewcvs.py", line 2368, in =
> generate_tarball
> 
>     for file, pathname, isdir in get_file_data(directory + '/Attic'):
> 
>   File "/usr/share/viewcvs/lib/viewcvs.py", line 635, in get_file_data
> 
>     files =3D os.listdir(full_name)
> 
> OSError: [Errno 2] No such file or directory
> 
> 
> 
> 
> =20
> =20
> =20
> =20
> =20
> =20
> Best Regards,
> =AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=AD=
> =AD=AD=AD=AD=AD_________________________________________
> Manuel Fernandes
> Siemens SA - Portugal
> IC Information and Communications=20
> ON- Optical Networks
> Tel: +351 21 424 2081
> e-mail:  <mailto:manuel.fernandes@lis2.siemens.pt>
> manuel.fernandes@lis2.siemens.pt
> =20
> =20
